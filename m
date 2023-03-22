Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AAC6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 16:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6910E3DC;
	Wed, 22 Mar 2023 16:57:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D95510E3DC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679504272; x=1711040272;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G2ACEqeMMu9oseT39ApEqUbfBwRowGltiSW+Ejq2Vdk=;
 b=UCLjclssQCGu9x8Gqf/6g3DLt1ptcBQdN14uHMlicR7aoRifUNK1cfzY
 nbesr6yks4rC52Kll8hoe6UFdlrVfG3tMMqPpIzQEF+d86bAYKx4lVmfz
 Bxk4uT5YdnXZ/xrs0WFhgb2qWWrwwom77+CnwaB3pkpLIZneSG+6lbcsR
 arVdHU/zxQTbWWUkYYZ01Bfjdv4W+b7IC1wcaC+ATm1Lppaa7C+LSKgSG
 HJyvH/H/oOlBuZ60D4u1pt9jkmebFjP/hq9H5Q20Qmo2HK14KqaJY/jte
 1azCjsJQPiTyRCiGx3YWoc3yDzOrI8LK4fVnHQ8oW+qVAoag7F2xp7odR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336776789"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="336776789"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805897367"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="805897367"
Received: from ftbyrne-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.151])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:57:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:57:33 +0000
Message-Id: <20230322165733.309447-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Revert "drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally"
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

This reverts commit d51afeaae0479c964e720f3855834a82914112f6.

See if this helps the ADL-P in CI.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 304a9501b447..fd9911ffeae4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -224,7 +224,10 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
+	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
+
+	if (needs_wa_1607983814(gt_to_xe(gt)))
+		count += LNCFCMOCS_REG_COUNT;
 
 	return count * sizeof(struct guc_mmio_reg);
 }
-- 
2.39.2

