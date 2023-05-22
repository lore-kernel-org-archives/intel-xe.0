Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DBAC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 19:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A65210E1FB;
	Mon, 22 May 2023 19:34:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE74810E14C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684784060; x=1716320060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6MMJ02jPnsDw9bMKbQNS0EP1bMx+/x0M1Wad7jRH/Q=;
 b=fpjZmiwQbx7hgXgN4ApzaKmfbQ5rnzB7ylufm4ONa5bV8gHjEUVd6a7v
 ct95JMawHhUjnRWoWXVjof36WzY0ofmmVqHQrxEaB9OVDBC0fbElyWMbp
 tl7Gy3+Rcdy+KBciTTf1ou0TKryxt8gaqAVcNcEIxTN4CxI625cE2W1bs
 ZY53kvITX+5B/e5Gg52k7/prhPCgG6zGE6Cs377UzWCgVjr5KpjvqRwi4
 PVSM5gfj/h4atuQSgEkf515ZQsVLoUX4AdQwfVDaqJ8P0rLe4k8PhL7w1
 QuBGRA+wuUSPzW2AjPHuVDp03vSkhISQkeYXuWqZiD7xftl3JH/YDUVb7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="350529732"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="350529732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 12:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736548650"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="736548650"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 12:34:20 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 12:35:41 -0700
Message-Id: <20230522193541.2537418-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
References: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] xe/rpls: Add Stepping info for RPLS
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stepping-substepping info.
Though it looks weird, the revision ID
for the newer stepping is indeed backwards
and is in accordance to the spec.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index a443d9bd7bbb..08c3ccb7d537 100644
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
@@ -136,6 +141,9 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
 	} else if (xe->info.platform == XE_ALDERLAKE_N) {
 		revids = adln_revids;
 		size = ARRAY_SIZE(adln_revids);
+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLS_RPLS) {
+		revids = adls_rpls_revids;
+		size = ARRAY_SIZE(adls_rpls_revids);
 	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
 		revids = adlp_rpl_revids;
 		size = ARRAY_SIZE(adlp_rpl_revids);
-- 
2.25.1

