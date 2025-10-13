Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61306CCD18C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320510E501;
	Mon, 13 Oct 2025 20:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv4gaR7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4A310E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386203; x=1791922203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMaK24a+wpGV5gZRLxOVjCkodfVam3AL3S6baiEy6mI=;
 b=gv4gaR7Ac5hjkaPrnFWqLiRG3HsYgQDCuSW96GtnGlOKBjeB1+nbQ3a9
 zmfgEXRuz2Qmwkvmuz7CGv7s+O9T4WZ2suYsQWn+AlE5cWtdm+4TPTijQ
 llhjiFjzEm7Tuw4GKA4VENxlp7Ns9PBpeFuLY/qGdRpxMexPNFQcZciQU
 QzLAyXt/xg5GIeaj08ZHHaz5fh7HYciBN2yDYTPlVrXqeVZVs5I9AExT+
 0Upu2oodYf8B69Ra3Bc9eEHKBJO2UV3o/+g7idtGQACsnuPgKOL4ZPihz
 fU0G4AhQGkXaN8AeHFKD0LG5ESKcUM3vUYtuVD6qqjrmxqRaRPGHCpubI w==;
X-CSE-ConnectionGUID: PaTO/9LIQwe58nIJB3Yk5Q==
X-CSE-MsgGUID: 49VgVZagSFO9qf+wbZqDcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800552"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800552"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
X-CSE-ConnectionGUID: IBarFztOT0SsPZC5lVB7jQ==
X-CSE-MsgGUID: DQ74KuGeTrqTrFAMiDIj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707602"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 17/23] drm/xe: Bypass Wa_14018094691 when primary GT is
 disabled
Date: Mon, 13 Oct 2025 13:10:00 -0700
Message-ID: <20251013200944.2499947-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

