Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE1C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB7710E688;
	Tue, 25 Feb 2025 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvs3fFvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903B810E4D9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489838; x=1772025838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFW1fjTtRKSK3RL0C0y5lBVdRU1X8INfQ1g4FqsGU1Q=;
 b=hvs3fFvGJn2QsDOb4y8L4S4IpHhc2Skk2NsoRFJ7+VFhdGvsDc0crWr7
 Ak1uWfAMMtbCJm1E1rzuQExAPQ7IWF/lmujCMQBel8MVwIznuKzk2h9y7
 Z+MnkQXaE1uyuawIX4825zgW3REiRpfzReJNaQpuMTQ5KY+LfXrkgHDM/
 yMSI+rmC2h0EvwOSY5o4ABFt+7ENwJRfxjEQOGQiRf3YGmJPv6aqE7f6t
 E3KO+ZbsK2PAfNYDmDVE8Bw7YaJohnffwtPkm5+Fp1GbnIXuLpxJCCzTf
 ruuRpOG/P4sRbHTe3fEyuMFhO2BW1tv4oRlqFI++GwwJhKYKvcJeTdrUt Q==;
X-CSE-ConnectionGUID: pEHx/a5/QLGvnDzJwHRaxQ==
X-CSE-MsgGUID: MYOJ6/gnSneURDZgaqnnmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40530493"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40530493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:58 -0800
X-CSE-ConnectionGUID: uf4RgfjRQOKhkqeZFd9+PA==
X-CSE-MsgGUID: jV8zbW0xRuGWG+7X2xhX/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="120998287"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:56 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 2/3] drm/xe/vf: Add helper to get negotiated GuC ABI version
Date: Tue, 25 Feb 2025 14:23:36 +0100
Message-Id: <20250225132337.6508-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250225132337.6508-1-lukasz.laguna@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
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

Introduce a helper function to retrieve the negotiated GuC ABI version
in the generic xe_uc_fw_version structure format.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4831549da319..d0dbc00dd8ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1014,6 +1014,32 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 		   val, reg.addr, addr - reg.addr);
 }
 
+/**
+ * xe_gt_sriov_vf_get_guc_ver - Get negotiated GuC ABI version.
+ * @gt: the &xe_gt
+ * @ver: pointer to storage for read GuC ABI version
+ *
+ * This function is for VF use only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_vf_get_guc_ver(struct xe_gt *gt, struct xe_uc_fw_version *ver)
+{
+	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (!guc_version->major)
+		return -ENOPKG;
+
+	ver->major = guc_version->major;
+	ver->minor = guc_version->minor;
+	ver->patch = guc_version->patch;
+	ver->build = 0;
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_vf_print_config - Print VF self config.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ba6c5d74e326..b139d1e026e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -11,6 +11,7 @@
 struct drm_printer;
 struct xe_gt;
 struct xe_reg;
+struct xe_uc_fw_version;
 
 int xe_gt_sriov_vf_reset(struct xe_gt *gt);
 int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
@@ -26,6 +27,7 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
+int xe_gt_sriov_vf_get_guc_ver(struct xe_gt *gt, struct xe_uc_fw_version *ver);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
-- 
2.40.0

