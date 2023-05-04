Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE90EC7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761FB10E3AD;
	Thu,  4 May 2023 07:33:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336E110E3AD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9xyvPNQGqjEV0K4FXw4Z2uKNrjw7hBBsob5WiXipsE=;
 b=VjmUFQJHSXAOEIR5t3dkVQSXmPUlLKfLjuKJ9/eBlHFvDTO6mgEw5/Kk
 OEG4vrpoyWKd2sPrL5es6SAfAJhUKgxEb0FWKpTJf/H6JL5HMLifosKh5
 3aRxyJelMa2hwMyh0lkg9u2WY/AlqI/youGVZYmuVqCHs6CHwUu2zGr5P
 J3C74W5wDL+VI5TYRxGE6yctM2tHMsFWgMEj59Fhdc/78P0IsM+yZsOQj
 gNtcBcpZwopgfMzjG1kavg6UkJ+gNZACHsKSIO+8sKAGy2Cj3QyDLvPtR
 6DhSnRoqrocGtgf/3nAJwb52QuSLJIc5fGymcMF/egfaGN02YzRSoi+cF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323828"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439427"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439427"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:45 -0700
Message-Id: <20230504073250.1436293-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe: Fix comment on Wa_22013088509
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On i915 the "see comment about Wa_22013088509" referred to the comment
in the graphics version >= 11 branch, where there were more details
about it. From the platforms supported by xe, only PVC needs
Wa_22013088509, but as the comment says, it's simpler to do it for all
platforms as there is no downside.  Bring the missing comment over from
i915 and reword it to fit xe better.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 55b240a5eaa7..02afb313bfea 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -461,9 +461,16 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 	}
 
 	/*
-	 * Always leave the hardware in multicast mode when doing reads
-	 * (see comment about Wa_22013088509 below) and only change it
-	 * to unicast mode when doing writes of a specific instance.
+	 * Always leave the hardware in multicast mode when doing reads and only
+	 * change it to unicast mode when doing writes of a specific instance.
+	 *
+	 * The setting of the multicast/unicast bit usually wouldn't matter for
+	 * read operations (which always return the value from a single register
+	 * instance regardless of how that bit is set), but some platforms may
+	 * have workarounds requiring us to remain in multicast mode for reads,
+	 * e.g. Wa_22013088509 on PVC.  There's no real downside to this, so
+	 * we'll just go ahead and do so on all platforms; we'll only clear the
+	 * multicast bit from the mask when explicitly doing a write operation.
 	 *
 	 * No need to save old steering reg value.
 	 */
-- 
2.40.1

