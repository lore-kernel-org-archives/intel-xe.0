Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7EEE8FDB5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627C810E0EE;
	Tue,  3 Oct 2023 20:37:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986B010E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696365447; x=1727901447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qBfLTNV6AmlKC+P+pa1tFiRVwkB7WaYe8pj2P+udNu4=;
 b=KO4fncI6eyCNsfo/4XCxUXGlOVLusdIiYklCXE8mxMLXFvMyaylOJbO0
 KO8OQ212JbYW8fJ+F4R9V4Xboorr8MrNSUZKkJq1TC/yBvbtKsxxvOx7F
 kVj5BFvfZ8Ze1c9aBFpITvwN9MjaKpt6hz3g3YB+bUQYeAwuR53aUUIzN
 a1hC239QlPIt2uTKkztfFm7ssvD/uJs2Rh2f4vkHvZZS2lhywkjtP3eTp
 ubitnP/Yi1tP3g/Tbg0IdWie6E5J7AgK6+SnLkgcfqWFRG8rsDq4upx/k
 aOcV4mIxzepRg1r2iEx6gYluQXzlI3lMsLswWtbZQjPDeE3vm2XXnBYED Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382882329"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382882329"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821393968"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="821393968"
Received: from xuebinta-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.212.207.176])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:27 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:37:15 -0700
Message-Id: <20231003203716.108979-5-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003203716.108979-1-anusha.srivatsa@intel.com>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe/rpls: Add Stepping info for RPLS
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
v3: rebase (Anusha)

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
---
 drivers/gpu/drm/xe/xe_step.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 903c65405d3a..eaf1b718f26c 100644
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

