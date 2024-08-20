Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8587C531DF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232D10E7F5;
	Tue, 20 Aug 2024 17:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKMzzX8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DB410E7F1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ei0j1Drw7ki+Ae72DGQkB2QDAqG4ew2jyJ1cud8aIaI=;
 b=VKMzzX8IVtzgVGZXVsMoRo1G/4vA+LvjEl4mnPypOAnIVfHssIXJexu6
 RwL1XiW1tHB/R5fZzq46/h7ZGOUOBwA/kLWLPHT6+R8k1jwh0VK1iW+u+
 kvYmrv0rNYM0iWRpLKsL0uWI6+eHWSH4BjiaxSjlcd4Ji8jt1uuwCCvuz
 Ggt+cTULp+upKdBk+4CHnvNq2g5gzoug53RAahAKr9pkrM5wiojndH0R5
 2SwlEzdvZpmFNZ+zHidGnPpjwxRr25Jed1/byia3F97NksBmboli5tSsY
 /aIrN3Ihzge2B8FS6EHAA/VB5H9RKHkJgekFPv/wvCU83c1aNhSBr0cxc A==;
X-CSE-ConnectionGUID: E3853yQISf+SjGmIHhNQug==
X-CSE-MsgGUID: DRThsthlS+am7KkdAMymDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365495"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365495"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: /4X7QD5mRbekWxHNi4GM6Q==
X-CSE-MsgGUID: EizahM65SqSU3lkeiIHULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651738"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/xe: Move hw_engine_fini to devm managed
Date: Tue, 20 Aug 2024 10:29:56 -0700
Message-Id: <20240820172958.1095143-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Kernel BOs are destroyed with GGTT mappings, this is hardware
interaction so use devm.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index aa9b2b16a6e0..18980238a2ea 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -267,7 +267,7 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
-static void hw_engine_fini(struct drm_device *drm, void *arg)
+static void hw_engine_fini(void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
 
@@ -585,7 +585,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
-	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
+	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
 err_kernel_lrc:
 	xe_lrc_put(hwe->kernel_lrc);
-- 
2.34.1

