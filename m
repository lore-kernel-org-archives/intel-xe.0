Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09772E7DF11
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B864310E510;
	Mon,  2 Feb 2026 17:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5xNnyqn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFEA10E510
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770052442; x=1801588442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PzDGEM6R1NqOsyNS8IxR+dLnuIWXMmheW9k3P4N2434=;
 b=R5xNnyqn9nT2am/Y2+uZua9PjWaUgwzfgHBlFnj+/eClvYWcbV+yLiGj
 m0AiwbB8sEdzT/Nx6t5tfZYrqR635taEaOF6yyvbQIIgzkYiw3akH8hNQ
 ObfFOqowqym991T9lcpb6jgckdZ0EQxvBn1lbEZ/sxx6EQBxXG27/siWe
 j2nS8YyuLI+zIFq7CZk+PVyTCzkxNiX6nwQGfN56sxagtLNc5ZE2K+O1N
 P+iBlAjocUDl6tKY5jaGiU+SrLDYXLUN37yj+2CbCOxFbZ8vIMam8BeHv
 ULugksuD+5E33v0gua8pxPxO22bosIxSPpLkwW5RvuwXTIte2k6zdq1Cq w==;
X-CSE-ConnectionGUID: x67zEPAPROmp1LjIdWhKUg==
X-CSE-MsgGUID: ov2MbljARaCIzk39+ouHgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82641713"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82641713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:14:01 -0800
X-CSE-ConnectionGUID: JQKy+7hFRzOJuFs056S2Ew==
X-CSE-MsgGUID: pBTk53DDTWSNSryhK0i5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208682911"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 02 Feb 2026 09:13:59 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com, Michal.Wajdeczko@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
Date: Mon,  2 Feb 2026 22:38:12 +0530
Message-ID: <20260202170810.1393147-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
References: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
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

Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
CCS mode changes

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

---
v2: Removed Fixup tag and reference from commit message as modfication
    not really fixing anything instead not allowing VF user to have sysfs entry.
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 91ac22ef5703..fe944687728c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
-- 
2.43.0

