Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD48C04FFF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AB210F4BB;
	Fri, 12 Apr 2024 07:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRXssFPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0D410E009
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908145; x=1744444145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMFqiMbds8SX0Ybs0k1Q2SG5Nwu4cYrt9s6xULudQ6E=;
 b=ZRXssFPJjJcCQVLRhhwn62tN3MvBoRDDOD7XE8ihN8YVwpvTGAZjqAoo
 +cco8BZS2ThCr9Zliuqi8vZCQzXTFpI+zix8D6jlzAs/oJWzA7i+NNrsm
 VG6k7VappHwYOi3QoOBnYdSj5MucPT4HHSNMvQQZoISoI4CNGkmc7ozMp
 KltfK+mQFaMG/Z47ISRk7YpJt6rIEl4OV7eNZxIH8q3X31SZeT+vLqBnX
 Thn4HoNDKRSBfrGVY0pq9FenFQXVJApoaw+CnL0MZDz0OhIwQSCg/NXm8
 vxNIAzL0wf9vUX0t5VuicCD2Txrdevo/uwttYwMQP/+ZPUJWfrGiMdI2J A==;
X-CSE-ConnectionGUID: ZzHeCWQ3R6O+Edgi89dGwQ==
X-CSE-MsgGUID: 0BTVT1WpQ2u/BAW/PjiB/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317210"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:05 -0700
X-CSE-ConnectionGUID: 2dnCg4gnSJ2Un7VKIZvQqA==
X-CSE-MsgGUID: Lx8T+2qsQLG/dM/HK/kiIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220727"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 3/7] drm/xe: Incase of action add failure,
 free_gsc_pkt only once
Date: Fri, 12 Apr 2024 13:32:41 +0530
Message-Id: <20240412080245.1044902-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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

