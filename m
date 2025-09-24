Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D14CAC5BD
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59110E6A7;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKvECntR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A510E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676570; x=1790212570;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kQjzQnbPlmbyw804cMmqZ+hikdhX5u5m6DEpT4CLqx0=;
 b=ZKvECntR3nNOLIRaKLwsqKJjUIJXVb4JHl8gnRuXLKp2aDGyzh1mjZZa
 M5A3FxESNaBDW6JYTF+Wn0z6TBiJM4Q6nbCBj22riFkkvXUh8tWuiB9IL
 /iey1cEqHTXAI9l0eV69PFz63RQ0jMcMoeL5PWTWhWy6o2fcyR38aeMk7
 EzKr4EuQV4BUWMxn9SzXyT15GH5bK1RL/sFxMNiU8Xd/SLDifCiTg8cIf
 ++jfmTPdbyoajeR/oGL9XX2RlnfQMXAFfCZ7fl63tyHXqirPZobQi8HGf
 wnXz29zF5y2LGGy1hh1VMA63SCScRJgqe0bu+Y59AHUFM/zrouoKMfugo g==;
X-CSE-ConnectionGUID: EEXtMv1qRt+CAqytIfwnsA==
X-CSE-MsgGUID: e9VzGo7yR36i9b3xe09mXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908268"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: EmniHv2/ThSCZlXSabcKQQ==
X-CSE-MsgGUID: YqwOf+N7RL+3eacQhNYWwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841799"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 19/34] drm/xe/vf: Extra debug on GGTT shift
Date: Tue, 23 Sep 2025 18:15:46 -0700
Message-Id: <20250924011601.888293-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

A little extra debug on GGTT shift printing the GGT shift value is
helpful for VF post-migration recovery.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a96e0dd65bc1..e79ab4a2a273 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 		primary_config->ggtt_base = start;
 	err = config->ggtt_size ? 0 : -ENODATA;
 
-	if (!err && shift && recovery)
+	if (!err && shift && recovery) {
+		xe_gt_sriov_info(gt, "Shifting GGTT %lld -> 0x%016llx\n",
+				 shift, config->ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+	}
 out:
 	up_write(config->lock);
 	return err;
-- 
2.34.1

