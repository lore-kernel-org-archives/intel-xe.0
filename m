Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6276E92FC3
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2F910E42C;
	Thu,  5 Oct 2023 20:56:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD3710E19D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696539417; x=1728075417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0tneH8/1EYP12jBNaej6pw5Yiy83WDKrxRDDeWyiZY=;
 b=PsfmMgy7MxLzkDAcbo8z/y/lraCp4zmfJh7EBMn+X/yctYTJyJ/zD1HQ
 /dCxUBs82boY/1Z45Ti8Ss3mAvPJQXr552ApeS9nkgqeNV+FDt9fefL4H
 ONDLolEBdoYmnSdm3Cc7MBXz4pc88vRQ8OOT2ka8jTuBjfcywwGhg7WmO
 CC/9EIsEihOALxX5W0F5sfkuvhG1P5KAvaDDJ4M1ruS5NaS3ydC8m/Kf0
 +Vwx3UtF1Ek5swrKM6mURGtUbIi0Vi/cPN/Gz0hQcAtDIiIAtj9UqkwR7
 ydlmTFX14AcccUM5JrZGEufYVlpChN08IdZk9UJyqp8DdXZVLiWkwyxPq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382490115"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382490115"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755613818"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755613818"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:39 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 13:54:49 -0700
Message-Id: <20231005205450.3177354-5-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

