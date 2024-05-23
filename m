Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C033C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D410E18E;
	Thu, 23 May 2024 19:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktWrMVUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CF10E18E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492176; x=1748028176;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c0ltOEN9BcXjgX1u5Hc7043tFX/Gz9LIwgo6SOuINfw=;
 b=ktWrMVUy4+szw+s/yiRUT0zLWGqevWKwX6gy832LbYFDUFc8D3vbPR4U
 kala/5xPzOK3ITuimI+L8BmpOJmi5wp9GVdqyi8O1pzRfCV+0fRMBVMoA
 zX8AkTcgrduD01Rg7Gya8Y3IdrAbQqmKAlhGNDE82NyCF0gojbpTZpDHP
 RuccqNSGMCZGn1nn03f5hrFvR7FRVjKdeKYVDXDtpNctVu5gj3jyfdyF9
 zjeLMIaT24LKMlbRRTXlXpOKQ6vfq25rF1/i9i2/RpcvsiFRuo9FSBdbD
 KLeWTIeMnO6EqOdWXXFUdnr5qQs8ZSW6zk/Q1ImDa2JrR+/wSuerCGYgE A==;
X-CSE-ConnectionGUID: MzfXguY3R56XVwBibbbaDw==
X-CSE-MsgGUID: A6t2Z+awT0asY2+CP5ceVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023473"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:53 -0700
X-CSE-ConnectionGUID: iulynOu9SfGBq2MRKjZ30w==
X-CSE-MsgGUID: C2EYhkmFSVizJDZE3SbuLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848836"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/xe/vf: Use register values obtained from the PF
Date: Thu, 23 May 2024 21:22:35 +0200
Message-Id: <20240523192240.844-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

As part of the its initialization, the VF driver has already
obtained a list of the runtime (fuse) register values from the
PF driver. When VF driver is attempting to read register that is
inaccessible to the VF, use the values from this list instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 53 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 drivers/gpu/drm/xe/xe_mmio.c        |  4 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index bab3858b423e..237486a80fb5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bsearch.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -21,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
@@ -677,6 +679,57 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
 	return err;
 }
 
+static int vf_runtime_reg_cmp(const void *a, const void *b)
+{
+	const struct vf_runtime_reg *ra = a;
+	const struct vf_runtime_reg *rb = b;
+
+	return (int)ra->offset - (int)rb->offset;
+}
+
+static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
+{
+	struct xe_gt_sriov_vf_runtime *runtime = &gt->sriov.vf.runtime;
+	struct vf_runtime_reg key = { .offset = addr };
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	return bsearch(&key, runtime->regs, runtime->regs_size, sizeof(key),
+		       vf_runtime_reg_cmp);
+}
+
+/**
+ * xe_gt_sriov_vf_read32 - Get a register value from the runtime data.
+ * @gt: the &xe_gt
+ * @reg: the register to read
+ *
+ * This function is for VF use only.
+ * This function shall be called after VF has connected to PF.
+ * This function is dedicated for registers that VFs can't read directly.
+ *
+ * Return: register value obtained from the PF or 0 if not found.
+ */
+u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
+{
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	struct vf_runtime_reg *rr;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
+	xe_gt_assert(gt, !reg.vf);
+
+	rr = vf_lookup_reg(gt, addr);
+	if (!rr) {
+		xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			   "VF is trying to read an inaccessible register %#x+%#x\n",
+			   reg.addr, addr - reg.addr);
+		return 0;
+	}
+
+	xe_gt_sriov_dbg_verbose(gt, "runtime[%#x] = %#x\n", addr, rr->value);
+	return rr->value;
+}
+
 /**
  * xe_gt_sriov_vf_print_config - Print VF self config.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index d6d37b193d17..be69c1025320 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_gt;
+struct xe_reg;
 
 int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
@@ -17,6 +18,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
+u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8a39d4c18554..16c94f118119 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
@@ -479,6 +480,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
+	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
+		return xe_gt_sriov_vf_read32(gt, reg);
+
 	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
-- 
2.43.0

