Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2760C3DA45
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 14:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F70B10E013;
	Sat, 13 Jul 2024 14:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqzNfsb4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51C610E013
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jul 2024 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720880821; x=1752416821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KqRqUu5i5LBdDXuO6sC2j+v03HeScFakQZkXuX1VeRc=;
 b=OqzNfsb4yc7piIzjfU8EQUKqvd+zS6OoNgWKq6+pD3IamwNS/fvfzMpA
 tQGQA7ul7D2kfAie6NLPsCFfJFAm2gAJt5pVBMQxLrIzQK8K8lmlBbvcS
 39zkik/FKt6954S7D182txFK8C28Hhc53j0OpYy3+C6n8Jh6mwdmnZhOp
 Zg+tQDSQKKiKKq0PmNIg8IKUb0R7tW9rt3k7+XcmDch4SpNNssrWee+W2
 QCzHB82W8cN7E6ZgMgqrwtMJGKwb9kLpJ+B3QVnrKpc6pMtqsUXqHQR2N
 B7OsUmqYRxbboXNMg10CU91CTRHAGmYMRn8bg2QEBFn3fPogoRzqNFT79 g==;
X-CSE-ConnectionGUID: zGlhBYIkTJ27cXoBepZ0Zw==
X-CSE-MsgGUID: IXqi+1JaSnWAnTWk1F+3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18127059"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="18127059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 07:27:01 -0700
X-CSE-ConnectionGUID: uVf8QluDTQmsHXdXs6k96g==
X-CSE-MsgGUID: G2FfRjrVRvaxHhI2bDa3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="49947471"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.27.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 07:27:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 1/1] drm/xe/vf: Track writes to inaccessible registers from
 VF
Date: Sat, 13 Jul 2024 16:26:43 +0200
Message-Id: <20240713142643.1242-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240713142643.1242-1-michal.wajdeczko@intel.com>
References: <20240713142643.1242-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only limited set of registers is accessible for the VF driver and
the hardware will silently drop writes to inaccessible registers.
To improve our VF driver lets intercept all such writes to warn
about such unexpected writes on debug builds or optionally allow
to provide some substitution (as a potential future extension).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: update commit message (Gustavo)
v3: drop case for SOFTWARE_FLAGS_SPR33 (xe)
    improve function description, add comment (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 41e46a00c01e..6a87d31c44e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -892,6 +892,32 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	return rr->value;
 }
 
+/**
+ * xe_gt_sriov_vf_write32 - Handle a write to an inaccessible register.
+ * @gt: the &xe_gt
+ * @reg: the register to write
+ * @val: value to write
+ *
+ * This function is for VF use only.
+ * Currently it will trigger a WARN if running on debug build.
+ */
+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+{
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !reg.vf);
+
+	/*
+	 * In the future, we may want to handle selected writes to inaccessible
+	 * registers in some custom way, but for now let's just log a warning
+	 * about such attempt, as likely we might be doing something wrong.
+	 */
+	xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+		   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
+		   val, reg.addr, addr - reg.addr);
+}
+
 /**
  * xe_gt_sriov_vf_print_config - Print VF self config.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0de7f8cbcfa6..e541ce57bec2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index cf622d07e190..ea3c37d3e13f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -171,7 +171,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
 	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
-	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+
+	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
+		xe_gt_sriov_vf_write32(gt, reg, val);
+	else
+		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
-- 
2.43.0

