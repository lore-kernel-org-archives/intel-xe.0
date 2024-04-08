Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CC8CD1299
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 14:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F10112697;
	Mon,  8 Apr 2024 14:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8tpYj4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427B2112694
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712586970; x=1744122970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XDVYGAbysHUCNcTHgux6Acd/Y1hj2RJcLqEaFS0VTrA=;
 b=C8tpYj4UFXyp2LIgFL2gMD4TVGgLsBmrTAGgwM4xnU9ITE0d/kJJdUbE
 fq/1WaBanjbM/I9dTIpHXPjTzi/ak0kTFFALzmka/9LFOfxloUKQCXQ5B
 DSY1fuglEGkKUDcWMg1GbYHYJ/WqviWNw1HH+qiAiY8gGjLZTtL0aSN/H
 830QgIA/eOh77LAXK246H+9MeIeHEv/axFACqNTmTpgJLaWuBymsun/yC
 koV2kxIUcRP9ly06Mj55PM5n1vp1Gt/JWudXqZ/GjkkbvJxuBivUK7I4C
 8uhTcXDihT7xyjFE4PCp091CH2YYP13+E13NsWDpJ/vV5vKkZmCGDb43L g==;
X-CSE-ConnectionGUID: GERif21yQauynUkwBGsfcg==
X-CSE-MsgGUID: HI8G0R9mREOU7t9eaWyKfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33264154"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="33264154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 07:36:10 -0700
X-CSE-ConnectionGUID: f7rNIg8SS5y3W3irbvuH5w==
X-CSE-MsgGUID: ElnNYHiYThSvNIclEqd5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24673149"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 08 Apr 2024 07:36:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Incase of action add failure,
 free_gsc_pkt only once.
Date: Mon,  8 Apr 2024 20:19:43 +0530
Message-Id: <20240408144944.604448-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
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

