Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC593C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 00:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9702310E452;
	Tue, 11 Apr 2023 00:36:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F298A10E452
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681173372; x=1712709372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3cXsRwnkHztpof8/OLI30saHjcl+rceCCejncWooPmY=;
 b=la9W0qt7Oll4XIc5Cl6H+Px+9l1TqpvpmBOhRRksG7e2O1DOifsj2TFO
 95MuXnNsA1IEdvL2SRS4Mgz9q1rIijcwL54xG0ckVR2lsys7PSDbDwCmc
 OTl16ZR0c1cpvZo6keYIlHEovjeuBGUjnFLBKCu1ZcM6ZbEJs16VMolS/
 d/2IqLgXOfekyhriRBx583AHRkY/ZfG8q8lHI6lXPqIPGL4qiWzLvxzTz
 0RtE6TQ69TqQBFOmmYhEGpno91b9mteouKB3uFHKAxVog/LzVS/bFtAAK
 SKZj7w9I3upaUkm2kHhAhASkxxRChdIXK19Sp+VjvTkcK2vWo0V+eV3LH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371334625"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="371334625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 17:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752944198"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="752944198"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 17:36:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 17:36:10 -0700
Message-Id: <20230411003610.2780651-1-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit dfa54efbe169b4fe0efbbb0adc8868e6172b41b5.

Allocating the regset space unconditionally shouldn't have been
necessary, but was an early attempt to paper over gitlab issue #232 on
some platforms; now that #232 has been fixed properly, this bandaid can
be removed.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
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

