Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:24 -0500
Message-ID: <20230112222538.2000142-24-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 23/37] drm/xe: Fix dumb bo create
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0889c3c89511..da2c8a1c19ec 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1784,10 +1784,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	uint32_t handle;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	int err;
+	u32 page_size = max_t(u32, PAGE_SIZE,
+		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
 
-	/* Align to ggtt page size, which we start requiring for xe display */
-	args->pitch = ALIGN(args->width * cpp, GEN8_PAGE_SIZE);
-	args->size = mul_u32_u32(args->pitch, args->height);
+	args->pitch = ALIGN(args->width * cpp, 64);
+	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
+			   page_size);
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
 			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
-- 
2.38.1


