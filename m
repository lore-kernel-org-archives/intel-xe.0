Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:33 -0500
Message-ID: <20230112222538.2000142-33-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 32/37] drm/xe/guc: Add support GuC MMIO send /
 recv
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

SRIOV has a use case of GuC MMIO send / recv, add a function for it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 731b26cc49a9..7f84d761283b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -630,7 +630,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 #define MEDIA_SOFT_SCRATCH(n)           _MMIO(0x190310 + (n) * 4)
 #define MEDIA_SOFT_SCRATCH_COUNT        4
 
-int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
+int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
+			  u32 len, u32 *response_buf)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -640,6 +641,7 @@ int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 	int ret;
 	int i;
 
+	BUILD_BUG_ON(GEN11_SOFT_SCRATCH_COUNT != MEDIA_SOFT_SCRATCH_COUNT);
 	XE_BUG_ON(guc->ct.enabled);
 	XE_BUG_ON(!len);
 	XE_BUG_ON(len > GEN11_SOFT_SCRATCH_COUNT);
@@ -723,10 +725,24 @@ int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 		return -EPROTO;
 	}
 
+	/* Just copy entire possible message response */
+	if (response_buf) {
+		response_buf[0] = header;
+
+		for (i = 1; i < GEN11_SOFT_SCRATCH_COUNT; i++)
+			response_buf[i] =
+				xe_mmio_read32(gt, reply_reg + i * sizeof(u32));
+	}
+
 	/* Use data from the GuC response as our return value */
 	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 }
 
+int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
+{
+	return xe_guc_mmio_send_recv(guc, request, len, NULL);
+}
+
 static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
 {
 	u32 request[HOST2GUC_SELF_CFG_REQUEST_MSG_LEN] = {
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 923efee90991..7be33458eef6 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -23,6 +23,8 @@ int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
+int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request, u32 len,
+			  u32 *response_buf);
 int xe_guc_self_cfg32(struct xe_guc *guc, u16 key, u32 val);
 int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val);
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir);
-- 
2.38.1


