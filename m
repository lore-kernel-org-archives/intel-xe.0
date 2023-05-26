Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54E7C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7557110E1DB;
	Fri, 26 May 2023 17:10:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2D410E1DD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121053; x=1716657053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QC+aBIC3ItylTIkBbn/4rqf5b8uBUK6PaMHTvUS+Mx4=;
 b=m7S77FHT1OU3oNLZWdeQI7ilY06eQD9w/X2dtMhxsF4o1sS5BEEHZCaW
 W1Daq1/Of2c0KCIlB/h+vkn5hD7fgY/hSiQ7AbahKn3qVJllHIOMraeoe
 FVuQf/aBzWWiHPn9H3a0oo/6A/A0h1BpPPwgc8nbeHK+JTABNLGtZj115
 7yPTYsIPdwx1+Dii/dgDyTZuAPgNXsl0jbcj8lTgHj50BxYPzFkOILJ3v
 ajSc1bypAXwd8kBfM0lIacDhSxL4ykS43ibrki/ve8jRofXI1a0fKkpo0
 gSlQ6e/8xalAJED6UOxAyxn9b9IS7T2YsCXe/bbM1SC1bqIZoCtJ9HNQh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353094995"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353094995"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879603462"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879603462"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:43 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 10:12:03 -0700
Message-Id: <20230526171204.2754550-6-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe/rpls: Add Stepping info for RPLS
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stepping-substepping info. Though it looks
weird, the revision ID for the newer stepping
is indeed backwards and is in accordance to the spec.

v2: s/RPLS/RAPTORLAKE_S (Anusha)

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
---
 drivers/gpu/drm/xe/xe_step.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index cb0811c8bf22..e5d4bc9d64bb 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -60,6 +60,11 @@ static const struct xe_step_info adls_revids[] = {
 	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
 };
 
+static const struct xe_step_info adls_rpls_revids[] = {
+	[0x4] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_D0 },
+	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
+};
+
 static const struct xe_step_info adlp_revids[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
 	[0x4] = { COMMON_GT_MEDIA_STEP(B0), .display = STEP_B0 },
@@ -143,6 +148,9 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
 	} else if (xe->info.platform == XE_ALDERLAKE_N) {
 		revids = adln_revids;
 		size = ARRAY_SIZE(adln_revids);
+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_S_RPLS) {
+		revids = adls_rpls_revids;
+		size = ARRAY_SIZE(adls_rpls_revids);
 	} else if (xe->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU) {
 		revids = adlp_rpl_revids;
 		size = ARRAY_SIZE(adlp_rpl_revids);
-- 
2.25.1

