Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF3EC7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 22:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103E710E603;
	Wed, 28 Aug 2024 22:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W63iBzNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1110E603
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724883311; x=1756419311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGTUVg64mQjBNGiT/ZLGxppvaSnAN8IOP2E8PzBjBGc=;
 b=W63iBzNHYgIXKYrzULIpTroVGssXubUjjDgEqbswtGxetZRQhZvSyUbZ
 QyMmWW56Wd2hlzLaelMJvZO2yJkx0UkI2GZ6hbLQ8zWG1HYRVorZqcyFV
 AzmScI6mizljxf50keomag/Zy5xIIgN2R36ufzaxAdsOCCDpb484GjaB3
 rtsXKUZIx4bM/dEhMKowxuYKIslKxpNLYxURwGc7bxKM4AZQwghd5UEZ7
 CUCRnKB6IOmx0hFeiPe2EGyk5fd3J67/CE3GhGtof2QcX+6wP7WwjYn3J
 1KATuW8A4OUoQ6k1SPe3qOZcELAIVhYz0j6XGEBGrmtXO7CUGNQkhGz+c w==;
X-CSE-ConnectionGUID: jHENE0XUR1KDwgwjZfySuA==
X-CSE-MsgGUID: 2O3YMWdVSfelpAjNyxVqKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23606380"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23606380"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 15:15:11 -0700
X-CSE-ConnectionGUID: 6VkppIuSQauz+Uh/1usCNA==
X-CSE-MsgGUID: lkBvD0YoSBedvxTsdxE67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="100883428"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 15:15:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/gsc: Wedge the device if the GSCCS reset fails
Date: Wed, 28 Aug 2024 15:14:57 -0700
Message-ID: <20240828221457.2752868-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Due to the special handling of the GSCCS in HW, we can't escalate to GT
reset when we receive the reset failure interrupt; the specs indicate
that we should trigger an FLR instead, but we do not have support for
that at the moment, so the HW will stay permanently in a broken state.
We should therefore mark the device as wedged, the same as if the GT
reset had failed.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 648786afffe0..6fbea70d3d36 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -335,9 +335,11 @@ static int gsc_er_complete(struct xe_gt *gt)
 	if (er_status == GSCI_TIMER_STATUS_TIMER_EXPIRED) {
 		/*
 		 * XXX: we should trigger an FLR here, but we don't have support
-		 * for that yet.
+		 * for that yet. Since we can't recover from the error, we
+		 * declare the device as wedged.
 		 */
 		xe_gt_err(gt, "GSC ER timed out!\n");
+		xe_device_declare_wedged(gt_to_xe(gt));
 		return -EIO;
 	}
 
-- 
2.43.0

