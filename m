Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084BC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5D410F948;
	Mon,  8 Apr 2024 12:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJd2EYXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7E010E9FB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579697; x=1744115697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XDVYGAbysHUCNcTHgux6Acd/Y1hj2RJcLqEaFS0VTrA=;
 b=NJd2EYXCxjQZslPQlyUFw/px+u4y7etp7fUquVCzI/jXy9dYkouGBKc9
 iu7Yj0n9sjZJqAPgjlCcx55gnTNXIw7PfJOf1FpzzXMfGPaga4Obth+wr
 EvVR4ZLUFT9wUgpDwsodZBZ9F/oZTqEwwBzxWlpaVwg5nrRZO24hJ5D4m
 fQEV1smzLzR0W8JoeJRIS/488xbbMh3pQqbN9Sj0YOtSjFLONdp2gkXtx
 xekt+4myx+4sq6VaA+DcSlaq4G02Vlns3C53SM2VxiFVS9s8eZ1c5W1g0
 G5itqidAjtJwhDMS1gqljykHoi6jfbqi65q7EwREH8C6JH6+f6Qi26vBO Q==;
X-CSE-ConnectionGUID: qCPdIk2bQJmfciM8hHh3JQ==
X-CSE-MsgGUID: TzIYpgkBTPuTKVc1mxbeZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25301551"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25301551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:34:57 -0700
X-CSE-ConnectionGUID: C8qUKtHaQ5uxXYzLkG7SrQ==
X-CSE-MsgGUID: 4ijTKUXhRzOEt5yyU/7YiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19828692"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 05:34:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 3/4] drm/xe: Incase of action add failure,
 free_gsc_pkt only once.
Date: Mon,  8 Apr 2024 18:18:29 +0530
Message-Id: <20240408124830.591903-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
References: <20240408124830.591903-1-himal.prasad.ghimiray@intel.com>
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

The drmm_add_action_or_reset function automatically invokes the
action (free_gsc_pkt) in the event of a failure; therefore, there's no
necessity to call it within the return check.

Fixes: d8b1571312b7 ("drm/xe/huc: HuC authentication via GSC")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 78318d73e4cf..39a484a57585 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -53,7 +53,6 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	struct xe_gt *gt = huc_to_gt(huc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
-	int err;
 
 	/* we use a single object for both input and output */
 	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
@@ -66,13 +65,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 
 	huc->gsc_pkt = bo;
 
-	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
-	if (err) {
-		free_gsc_pkt(&xe->drm, huc);
-		return err;
-	}
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
 }
 
 int xe_huc_init(struct xe_huc *huc)
-- 
2.25.1

