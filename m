Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E40CCD186
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940210E631;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieGuDaRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C710E2EA
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272994; x=1790808994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DCZlr37m8qgwR6+yQYY27mu7gyw7GhEOz+b+eMlSJCE=;
 b=ieGuDaRWnz+dEoQXHBRfBROIxOHRkLIy7SEpuQYR4N3QepJAAo8rTTzx
 h7R0Mcrv869YtLrJ/9JPxjqIpDKfWiB+thZMgJ7E3C2XIL+P9oy7eq5eG
 qM6ySEm05+jMfaP+TWfUKFe2px3wUsZkoKJTVY2kZDEPUsTUoek5CqEJ9
 uzCJGpjMP8eOcsXlbIAb5zNl6MnUCPhb27MS7KSQLZs5dC3CiQlRLct3S
 V7B+YqAdf3ShhQaYb7dGQdYALckVC0RKyegxoL0r07As3h3pQ6+x8fU+M
 R3+/0tH7fQNDbOMcgROSG/kvyoThG54K/6zCSifsxyBlWNft8q6RYXeh2 w==;
X-CSE-ConnectionGUID: No/yMAgRRVabNKacX09cYQ==
X-CSE-MsgGUID: DInsbdpFQXCEbgEsTmdh5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397764"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397764"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:33 -0700
X-CSE-ConnectionGUID: 8orZgN1LTb+1bXuSiWQrqw==
X-CSE-MsgGUID: 7nKY6wvdQceq6uVSxjCNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229501"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 23/23] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
Date: Tue, 30 Sep 2025 15:56:40 -0700
Message-ID: <20250930225618.140071-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

SR-IOV operation relies on the primary GT's GuC to operate (in both PF
and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
If the primary GT is disabled in PF mode, force the device back to
native (non-sriov) mode.

v2:
 - Move handling to xe_info_init().  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4a792e1037d5..44f99c1a39e0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -763,6 +763,18 @@ static int xe_info_init(struct xe_device *xe,
 	int ret;
 	u8 id;
 
+	/* SR-IOV (both PF and VF) relies on the primary GT's GuC */
+	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) == 0) {
+		if (IS_SRIOV_PF(xe)) {
+			drm_info(&xe->drm, "Disabling SR-IOV because primary GT is disabled.\n");
+			pci_sriov_set_totalvfs(pdev, 0);
+			xe->sriov.__mode = XE_SRIOV_MODE_NONE;
+		} else if (IS_SRIOV_VF(xe)) {
+			drm_err(&xe->drm, "Cannot probe device in SR-IOV VF without primary GT enabled.\n");
+			return -ENODEV;
+		}
+	}
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers.
-- 
2.51.0

