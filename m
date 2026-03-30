Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011F11061B21
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255B10E805;
	Mon, 30 Mar 2026 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqlZASta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061C10E7FE
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903263; x=1806439263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GkmVhc5nazrBcQ66EWaw2zm8RybjSF6ZbjufCG2DZjg=;
 b=YqlZAStazDzeE97NYBp/4AleyLVGSur7lAVlixLQjIvTtMnNTWEn5wpt
 EA+9av1uxlreD2j/SZCqrKSISdhC0nnNZTUADAMIYuciR/I5fzCL6zl0a
 4vAcwd4xa0QEuHFVDYEXZUTVNq6Yg6HVIrdj/6dF2wDLpC4K2uG9GfXQD
 9lWxDYK2rMTz5bWa4mJnSAUJ2APJBTErcUozj3RrQNWNw4xpAhOyXMAJ4
 WgdYCYyuZ43tTV6tderqY/x6QOFMS+iw5ONT2bBLQ1aAHTWx0FrlMqDSr
 QtVixqFw2OGovv7m++YDTBdaozDsj64vNEri23rBVJUs6lzG4V4Qc84DT A==;
X-CSE-ConnectionGUID: TbWw77gpSEabVwLibMAalg==
X-CSE-MsgGUID: EoihlAjoSC2x+E63UZhEwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923701"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:03 -0700
X-CSE-ConnectionGUID: C8s/fiEjS6GoAATFHcZhxw==
X-CSE-MsgGUID: 2tF0rcSwRpuw7E1JiuTc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329376"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 04/13] drm/xe/pf: Print applied policy KLVs
Date: Mon, 30 Mar 2026 22:40:35 +0200
Message-ID: <20260330204046.567-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

Under CONFIG_DRM_XE_DEBUG_SRIOV print all policy KLVs sent to the
GuC for better diagnostics.  This is similar what we are already
doing with VF configuration KLVs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 6ab02e96e46c..c88c4e6a9b61 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -68,6 +68,15 @@ static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
 		return err;
 	}
 
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		struct drm_printer p = xe_gt_dbg_printer(gt);
+		void *klvs = xe_guc_buf_cpu_ptr(buf);
+
+		xe_gt_sriov_dbg(gt, "pushed policy update with %u KLV%s:\n",
+				num_klvs, str_plural(num_klvs));
+		xe_guc_klv_print(klvs, num_dwords, &p);
+	}
+
 	return 0;
 }
 
-- 
2.47.1

