Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D969EC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0C110E1C2;
	Thu, 12 Jun 2025 22:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceB0gaUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266F10E1C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749766175; x=1781302175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9sjdTRBgVFIZZ9w7ul5NLpow0ufm0bDNeBQ62AP4HGU=;
 b=ceB0gaUb2vvkD7PqWOv2AsWcYubImxuPwra0RQfNCyFXHo96tELXtSS8
 9uEJ8JmlhBhUSEgI50R75dZUY7P8J9MK6psga19L3mNcbeNfW28XEyyBy
 wQU6/rPrF4PvDRs37sjuys8Pu8j1edGj5E74A1ofzHvZrdb+weFmDcr4U
 J4xjAAL3IECPCHDzcBsIsgSVAPL03xgs8pHGaMHj48ssdyf2+YaMGI+o/
 NEx7iJ7smYGwNeDLeKqQqG3j2TjztAud7atOMcKerlBnW/0JRnbKlOfKT
 QUQhubYimPGGUP+0siXKUeDflPoO+5mqbH38n26aNH141RiNEa3hZ6mjg A==;
X-CSE-ConnectionGUID: kg+e9Sm+RbC/WQm0saRgNw==
X-CSE-MsgGUID: QAOoF0HkQQ2+F4fbXzeg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74497862"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="74497862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:34 -0700
X-CSE-ConnectionGUID: 5aUFBrMiR2KIY0uwzxtakA==
X-CSE-MsgGUID: nKUqeD3ORcaGYq1TqlP2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147632220"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 12 Jun 2025 15:09:35 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4] drm/xe/guc: Set wedged on Xe micro hardware initialization
 error
Date: Thu, 12 Jun 2025 18:09:25 -0400
Message-Id: <20250612220925.2286286-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Declare wedged on Xe micro controller hardware initialization
failed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917

---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Change list:
v4: Fix typo and add new line
v3: v2 CI re-run
v2: Remove unnecessary jump to err-out
    Drop disable ct, switch to set wedge
---
 drivers/gpu/drm/xe/xe_uc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92d..77175938fc40 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -157,19 +157,22 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 
 	err = xe_guc_enable_communication(&uc->guc);
 	if (err)
-		return err;
+		goto err_out;
 
 	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	uc->guc.submission_state.enabled = true;
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-		return err;
+		goto err_out;
 
 	return 0;
+err_out:
+	xe_device_declare_wedged(uc_to_xe(uc));
+	return err;
 }
 
 /*
@@ -197,19 +200,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 	ret = xe_guc_enable_communication(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	ret = xe_guc_pc_start(&uc->guc.pc);
 	if (ret)
-		return ret;
+		goto err_out;
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
@@ -221,6 +224,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	xe_gsc_load_start(&uc->gsc);
 
 	return 0;
+
+err_out:
+	xe_device_declare_wedged(uc_to_xe(uc));
+	return ret;
 }
 
 int xe_uc_fini_hw(struct xe_uc *uc)
-- 
2.34.1

