Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:32 -0500
Message-ID: <20230112222538.2000142-32-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 31/37] drm/xe/guc:
 s/xe_guc_send_mmio/xe_guc_mmio_send
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

From: Matthew Brost <matthew.brost@intel.com>

Now aligns with the xe_guc_ct_send naming.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          | 6 +++---
 drivers/gpu/drm/xe/xe_guc.h          | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 34d7d20a2ce7..731b26cc49a9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -599,7 +599,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 		XE_GUC_ACTION_CLIENT_SOFT_RESET,
 	};
 
-	ret = xe_guc_send_mmio(guc, action, ARRAY_SIZE(action));
+	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
 	if (ret) {
 		drm_err(&guc_to_xe(guc)->drm,
 			"GuC suspend: CLIENT_SOFT_RESET fail: %d!\n", ret);
@@ -630,7 +630,7 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 #define MEDIA_SOFT_SCRATCH(n)           _MMIO(0x190310 + (n) * 4)
 #define MEDIA_SOFT_SCRATCH_COUNT        4
 
-int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
+int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -747,7 +747,7 @@ static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
 	XE_BUG_ON(len == 1 && upper_32_bits(val));
 
 	/* Self config must go over MMIO */
-	ret = xe_guc_send_mmio(guc, request, ARRAY_SIZE(request));
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
 
 	if (unlikely(ret < 0))
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 72b71d75566c..923efee90991 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -22,7 +22,7 @@ int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
-int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len);
+int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
 int xe_guc_self_cfg32(struct xe_guc *guc, u16 key, u32 val);
 int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val);
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 61a424c41779..f48eb01847ef 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -268,7 +268,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 			   enable ? GUC_CTB_CONTROL_ENABLE :
 			   GUC_CTB_CONTROL_DISABLE),
 	};
-	int ret = xe_guc_send_mmio(ct_to_guc(ct), request, ARRAY_SIZE(request));
+	int ret = xe_guc_mmio_send(ct_to_guc(ct), request, ARRAY_SIZE(request));
 
 	return ret > 0 ? -EPROTO : ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 8dfd48f71a7c..57640d608787 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -33,7 +33,7 @@ static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
 		size,
 	};
 
-	return xe_guc_send_mmio(guc, action, ARRAY_SIZE(action));
+	return xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
 }
 
 static int guc_hwconfig_size(struct xe_guc *guc, u32 *size)
-- 
2.38.1


