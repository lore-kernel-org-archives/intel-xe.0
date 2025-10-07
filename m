Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092FBCCD186
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6F410E712;
	Tue,  7 Oct 2025 20:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3UiQEyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C22410E39A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMaK24a+wpGV5gZRLxOVjCkodfVam3AL3S6baiEy6mI=;
 b=B3UiQEyE5+GT9L5pEsf9eN7VHlVYVuQGa2/qijYEg/fMZ64Lsfol83xW
 bPT6q78SeyTroZrEZ7HC+zybFy/TD0JYpwrxPR3urpUzz4DyLIEGDY2cx
 PSDEQFHgDMqqCUA5yv4LFIpueUrS/prnHHYFSijlNm/GudgSYTjep6Vwh
 9+Cw1IZs81TU31WcXWXYe+31v97z0ZtC4MegHp2g9lG9qMp16F+NyPnjt
 VkdRfDs6Vrl27tQaxHPNK8nHr1Rv0PFSkwOcpUoNTrPMPoZkHWZN6JqRj
 kzwEhnDEek3C6HpC9lG11L6HdP3+iBQRKc4Ut5pZi7uV7Pr8QdZQzCsBy w==;
X-CSE-ConnectionGUID: 2Kl4LuTrTleXBbreGtsw2w==
X-CSE-MsgGUID: 4V/SXCmuQSCK2V/tTTZNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616756"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: gOzOuc1DTvK+G4dHFHAU7w==
X-CSE-MsgGUID: EMznpf9NQuiX1rX1r+61vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631109"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 17/23] drm/xe: Bypass Wa_14018094691 when primary GT is
 disabled
Date: Tue,  7 Oct 2025 13:48:47 -0700
Message-ID: <20251007204829.1468209-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

Don't try to lookup Wa_14018094691 on a NULL GT when the primary GT is
disabled.  Since this whole workaround centers around mid-thread
preemption behavior, the workaround isn't relevant if the primary GT
(where the engines that can do MTP live) is disabled.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 83d61bf8ec62..dd69cb834f8e 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	unsigned int fw_ref;
 	int ret;
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691)) {
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
 		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
@@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691))
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
 		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
 
 	if (ret)
-- 
2.51.0

