Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86B2D49C91
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 09:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2FF10E975;
	Fri, 30 Jan 2026 09:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQGrHgcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C503810E967
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769766615; x=1801302615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bSREk0K8rvH3dhboFcJdZLkDGsoxJD5CAw7igb8TDd0=;
 b=QQGrHgcnlSWzzA3lleY6+eG4Y/EKpc+MmNRH21AeMXnyhxknZOHOQOSx
 ewZHoFZUw+I/HeD7Aodum6RLtC8S0mroBTyZW9rxwJbvXAoREu3r1h3Rt
 rJiWuma6SqemvYuCXDkov17qE2IL9ZPY/vv54CVMFeHw8U5Hvbw+QQgrH
 d1FChDf0iVL+E22XeIZLhQPQ3YKqHBCDjnRcPcXugDXU/FGjC7u8QFzK6
 f4Sg+XMqYtsvN/k8JT9SyRE8sON1Bzz89fiz5QMERw3ZBABD4FIt3vq0e
 aPGelt3or1npsNi1afZU33gNJbTz7XivrHGhuJ6xxDunMNRxF+90I/u9F g==;
X-CSE-ConnectionGUID: n9F2mmJ4QrWGEDctiUPckQ==
X-CSE-MsgGUID: PNiR9PE0T82EliT9sjoVIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70035304"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70035304"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:50:14 -0800
X-CSE-ConnectionGUID: pepPxirHT9278RFAqbWKgQ==
X-CSE-MsgGUID: yhl/UTI8T8WV6RpwKTNcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209238602"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2026 01:50:13 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
Date: Fri, 30 Jan 2026 15:14:25 +0530
Message-ID: <20260130094423.1111201-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130094423.1111201-4-naresh.kumar.g@intel.com>
References: <20260130094423.1111201-4-naresh.kumar.g@intel.com>
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

Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
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

