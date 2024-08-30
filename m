Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14388CA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ED610E7CB;
	Fri, 30 Aug 2024 05:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOPxzVyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C2B10E7CE
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994358; x=1756530358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aJgfxNvVaQ67/pcccagIMhmdCL7/EIx/Rb1lm3egXnE=;
 b=SOPxzVyjKjG1qEOENRIY+AqHo8gX34F+68lMO4T608xhMyELGFCO5pgH
 KVVBTLzpmwgQcaUwU5nyzWgKEEQZksYlJ5ETB7FZEB/MuVb3bidf51f1q
 JMgq6hf8NQz8hSeeyM989PFdYsXQUwlUBOesXt8X7huy4xY2RKwJB7wIf
 nFp+Q8X796LYeOY5nFVW91oYobhMYOQ2++id4lZeXnAVzUkU3u5vGBjv2
 MqJ0P0PE959gOOWhjbWFB9U9efJUZ0Vj34Ve7vwGAvX9aLmH/haqjyghS
 hFXvcBGbdcke/NQIYlNTXUCSg/Wyl0mSDwO20hW2uGS7P0leYRLVMGGKm Q==;
X-CSE-ConnectionGUID: FJFVsjrCToq16t1G2dJmvA==
X-CSE-MsgGUID: MsUeFj0DTBiXlytmzBQfpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006505"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:58 -0700
X-CSE-ConnectionGUID: GjKMuaraQPuRgB5z3d44Hw==
X-CSE-MsgGUID: OP5ivWjETfGL2rglfcwY+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101302019"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [RFC 8/9] drm/xe: Change return type to void for xe_force_wake_put
Date: Fri, 30 Aug 2024 10:53:25 +0530
Message-Id: <20240830052326.3707019-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
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

In case of xe_force_wake_put failure caller just calls XE_WARN_ON
and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
void.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c    |  2 +-
 drivers/gpu/drm/xe/xe_device.c     |  3 ++-
 drivers/gpu/drm/xe/xe_drm_client.c |  2 +-
 drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++-----
 drivers/gpu/drm/xe/xe_force_wake.h |  5 +++--
 drivers/gpu/drm/xe/xe_gt.c         | 21 +++++++++------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c    |  4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c     |  8 ++++----
 drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
 drivers/gpu/drm/xe/xe_pat.c        | 10 +++++-----
 drivers/gpu/drm/xe/xe_reg_sr.c     |  6 ++----
 drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
 13 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..78537bbfe2a4 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -109,7 +109,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6db7e082d88..f891fc84c96f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -609,7 +609,8 @@ static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	return 0;
 }
 
 int xe_device_probe(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 7ddd59908334..a322ca0e0921 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -270,7 +270,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
+		xe_force_wake_put(gt_to_fw(gt), fw);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9949f2d7ee63..72be9d5b4705 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -11,6 +11,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
@@ -214,11 +215,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
  * refcount for any of the specified domain reaches 0, it puts the domain to sleep
  * and waits for acknowledgment for domain to sleep within specified timeout.
  * Ensure this function is called only in case of successful xe_force_wake_get().
- *
- * Returns 0 in case of success or non-zero in case of timeout of ack
+ * Warns in case of timeout of ack from domain.
  */
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -239,5 +239,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret;
+	if (ret)
+		XE_WARN_ON("Timedout for domain sleep acknowledgment");
+
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 8939fc0fd09f..c8fc08d91a84 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 				   enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       enum xe_force_wake_domains domains);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 73987ef83e7e..7a22f001a530 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -444,8 +444,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
 	return 0;
 
@@ -529,8 +528,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	return 0;
 
@@ -782,8 +780,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
@@ -791,7 +788,7 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_pm_runtime_put(gt_to_xe(gt));
@@ -830,7 +827,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	xe_uc_stop_prepare(&gt->uc);
 
 	if (!err)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -852,13 +849,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 err_msg:
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
@@ -898,13 +895,13 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 err_msg:
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 8f95d3a5949b..1431170d899b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -101,7 +101,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index f9fdefd161b5..4689cff757a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -132,7 +132,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
 
 	if (!err)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
@@ -149,7 +149,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 
 	if (!err)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 static ssize_t name_show(struct device *dev,
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f1dcd71dc642..c0b8c401b9bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -430,7 +430,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
 	*freq = decode_freq(*freq);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	return 0;
 }
 
@@ -504,7 +504,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = pc_get_min_freq(pc);
 
 fw:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 out:
 	mutex_unlock(&pc->freq_lock);
 	return ret;
@@ -870,7 +870,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 
 	xe_gt_idle_disable_c6(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	return 0;
 }
@@ -1005,7 +1005,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 
 out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 78ff4ab9ef57..9203d54ecad8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -831,7 +831,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1451,7 +1451,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_alloc_oa_buf:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 err_fw_get:
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 722278cc23fc..7cc8f20ee979 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -193,7 +193,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
 }
@@ -224,7 +224,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
 }
@@ -253,7 +253,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
 }
@@ -287,7 +287,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
 }
@@ -369,7 +369,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
 }
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 440ac572f6e5..acaa41b3d7a6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -201,8 +201,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
 
 	return;
 
@@ -253,8 +252,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
 
 	return;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 5bcd59190353..4c20da93b90c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -262,7 +262,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	return 0;
 }
 
 static void vram_fini(void *arg)
-- 
2.34.1

