Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:36 -0500
Message-ID: <20230112222538.2000142-36-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 35/37] drm/xe: Fix hidden gotcha regression with
 bo create
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

The bo_create ioctl relied on the internal ordering of memory regions to
be the same, make sure we don't allocate stolen instead of VRAM0.

Also remove a debug warning left in.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h             | 8 +++++---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8d8a3332dbc8..8c2cdbe51ab5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -13,10 +13,12 @@
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
 #define XE_BO_CREATE_USER_BIT		BIT(0)
+/* The bits below need to be contiguous, or things break */
 #define XE_BO_CREATE_SYSTEM_BIT		BIT(1)
-#define XE_BO_CREATE_STOLEN_BIT		BIT(2)
-#define XE_BO_CREATE_VRAM0_BIT		BIT(3)
-#define XE_BO_CREATE_VRAM1_BIT		BIT(4)
+#define XE_BO_CREATE_VRAM0_BIT		BIT(2)
+#define XE_BO_CREATE_VRAM1_BIT		BIT(3)
+/* -- */
+#define XE_BO_CREATE_STOLEN_BIT		BIT(4)
 #define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
 	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id : \
 	 XE_BO_CREATE_SYSTEM_BIT)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 21ca7f79e63b..b4e9c88644e4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -184,7 +184,6 @@ static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
 	mem->bus.offset = cur.start;
 
 	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
-	WARN_ON_ONCE(1);
 
 	if (mem->placement & TTM_PL_FLAG_CONTIGUOUS && mgr->mapping)
 		mem->bus.addr = (u8 *)mgr->mapping + mem->bus.offset;
-- 
2.38.1


