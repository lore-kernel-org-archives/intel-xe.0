Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ABBEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0183310E469;
	Wed, 14 Jun 2023 20:52:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D210E462
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686775932; x=1718311932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AQLqsAIfascPApYFRJkItH/Lac6UT+op6X+y7g+TGs=;
 b=h0bjMInnc8nnR3JRNRpz9crzyIJPBsItByXI9Pb+FpgMekShLJ6WteMY
 uj/Mabls8CvO18LcqbR8oM/2R0VsShfj/7ew+SwvQs6j3SBePoo+LiBUy
 Ln/blJNzt9Ac7Rk3MVVw/TnENJH7zTWpg02W90eSggzs6jfloWRn9kgcE
 /1BAW84OeEERXksjO+xKvy4uazedwcBK+dXACuHkpyp4M6X39CT/9xzek
 Psmu4cNavv5cHGWLwoGY3Irb5LzfnhnoiQU7PsiS86zkDJcMoGBXuD0c/
 9usUu4TlTTot4Lpgzpre3kqPB+MAiYRtSJZ2XVEnaBwmrzKPgmY53pohh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343431998"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343431998"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712206070"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712206070"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:52:01 -0700
Message-Id: <20230614205202.3376752-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614205202.3376752-1-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe: Print proper revid value for unknown
 media revision
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If the GMD_ID register reports a higher media revision ID than we're
expecting, print the media revid, not the graphics revid, in the
debug message.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 1baf79ba02ad..371cac951e0f 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -235,7 +235,7 @@ struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 	if (step.media >= STEP_FUTURE) {
 		step.media = STEP_FUTURE;
 		drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as future stepping\n",
-			graphics_gmdid_revid);
+			media_gmdid_revid);
 	}
 
 	return step;
-- 
2.40.1

