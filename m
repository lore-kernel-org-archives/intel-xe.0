Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D9ECCA474
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A3C10E21A;
	Mon, 29 Sep 2025 02:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FulCiBAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF5210E20C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eW8jWuM/LcgQWSN7la5WbNtI/1Zel1JYqHFHWF23sE8=;
 b=FulCiBALHjsfdnzASvZ2DDbM3/IjdqNz1+z4V/0/Fp7plABOpdagTTsG
 q07PgUQ8UX89IKn/lH1lX/Rp6pR/UtHFhb/PjRlTwVT3SWRGrIthMs9Q/
 ANPNNoKSChBI7cpS6oGx+EU/eO0uCdqEsw1m/rJ6bOdRHLeywGU6dq8+6
 uql/zStkzZ7GRVycOHYUVjXFeeUlShfpdHVaN3EO16iwOjcy+H1feYLqY
 Gbgidc0jEIRRz4TRknh0NR3FGM8eEdVoIgP/Uzq9/pz9GLgWloTLCtgJ+
 6DcD5rKh9owxeM/CKUqYVHotUFUcBrQfV3KmWgmFOPGgw/hxxNiYAKBOD g==;
X-CSE-ConnectionGUID: 8qExh4LPTxe/nYvqFWF8EA==
X-CSE-MsgGUID: KArA5A4aRFeh/QRZGevI1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398537"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
X-CSE-ConnectionGUID: IaiJmaNPQieAoQfpOuBvQQ==
X-CSE-MsgGUID: Cx2D8eHuRcSHQ7aHedJD/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529271"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 21/36] drm/xe/vf: Extra debug on GGTT shift
Date: Sun, 28 Sep 2025 19:55:27 -0700
Message-Id: <20250929025542.1486303-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adding a bit of extra debugging to GGTT shift printing—specifically
printing the GGTT shift value—is helpful for VF post-migration recovery.

v3:
 - Reword commit message (Michal)
 - Adjust debug message (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46bba0feadd0..a564f296e4b9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 		primary_config->ggtt_base = start;
 	err = config->ggtt_size ? 0 : -ENODATA;
 
-	if (!err && shift && recovery)
+	if (!err && shift && recovery) {
+		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\\n",
+				 shift, config->ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+	}
 out:
 	up_write(config->lock);
 	return err;
-- 
2.34.1

