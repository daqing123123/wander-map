-- =====================================
-- 🗺️ 美食美景取景地地图 - Supabase 建表脚本
-- 在 Supabase SQL Editor 中运行此脚本
-- =====================================

-- 1. 创建地标表
CREATE TABLE IF NOT EXISTS pins (
  id BIGSERIAL PRIMARY KEY,
  lat DOUBLE PRECISION NOT NULL,
  lng DOUBLE PRECISION NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('food', 'scenic', 'location')),
  title TEXT NOT NULL,
  description TEXT DEFAULT '',
  image_url TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 索引（加速地理查询和分类过滤）
CREATE INDEX IF NOT EXISTS idx_pins_category ON pins(category);
CREATE INDEX IF NOT EXISTS idx_pins_created_at ON pins(created_at DESC);

-- 3. 开启行级安全
ALTER TABLE pins ENABLE ROW LEVEL SECURITY;

-- 4. 策略：任何人都可以查看
CREATE POLICY "Anyone can read pins" ON pins
  FOR SELECT USING (true);

-- 5. 策略：任何人都可以添加（无需登录）
CREATE POLICY "Anyone can insert pins" ON pins
  FOR INSERT WITH CHECK (true);

-- =====================================
-- 📦 存储桶设置（在 Supabase Dashboard > Storage 中手动操作）
-- =====================================
-- 1. 新建 Bucket，名称: pin-images
-- 2. 勾选 "Public bucket"（公开访问）
-- 3. 在 Bucket 的 Policies 中添加策略:
--    - SELECT: 允许所有人 (true)
--    - INSERT: 允许所有人 (true)
--   文件大小限制建议: 5MB
