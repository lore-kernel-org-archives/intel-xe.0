Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C60C25B5F
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7754B10E9B7;
	Mon, 13 May 2024 21:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0+jpJxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BB910E9A2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636235; x=1747172235;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NjediG01lTJFPfw0KYrgHa+B+WKaZ739rUaCSniVXt0=;
 b=W0+jpJxbys9KkUcIKHw8gEkj5mLzpn1E88rF9fOYDw/c7n/OWUVPAHAC
 IKx+pBME4qpd875Urw2/pKq21BR7Nvve7VTQpAfero1nw5xAaqngNmIIv
 2/PSBRwKiO2ut5jpiK23tmplEHf/sxuzQBwjPm2aDZerpkpOZOigkQKGJ
 PBaqs5z7auNx9TL00pXnnw+LQ2sBlHA7BdBIKA0L+w3T5XN+Up3zPtrND
 evRJQ39MioWK69lXrrTNEDcoM+LU1K51TnOer/NDdGnw8a3V9LX5hUEzl
 b3NOoPS0LQ8NhhBipXNDWPyM8nGARS+UJK8vT9hVsUnxZcqvLkDJBjIuk g==;
X-CSE-ConnectionGUID: XCbEHnvxQ2SCMyCF/gJMIQ==
X-CSE-MsgGUID: r35xw7uPTWGSPh7menQDiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11505918"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11505918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:06 -0700
X-CSE-ConnectionGUID: POQ7H1gYTLu2VMjhLxagKg==
X-CSE-MsgGUID: b5BEZHvkStifuvHHH7xDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35348592"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 4/5] drm/xe: Move xe_force_wake_init_gt() inside gt initialization
Date: Mon, 13 May 2024 14:37:50 -0700
Message-ID: <20240513213751.1017791-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513213751.1017791-1-lucas.demarchi@intel.com>
References: <20240513213751.1017791-1-lucas.demarchi@intel.com>
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

xe_force_wake_init_gt() is a software-only initialization and doesn't
need to be called from xe_device_probe(). Move it to initialize
together with the gt.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ---
 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b08d4f213302..8cb93be83332 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -574,9 +574,6 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	for_each_gt(gt, xe, id)
-		xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 05b77214f996..e05899691a8c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -328,6 +328,8 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_wa_process_oob(gt);
 	xe_tuning_process_gt(gt);
 
+	xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	return 0;
 }
 
-- 
2.43.0

