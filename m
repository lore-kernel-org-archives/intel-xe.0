Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385F3C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 22:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16BF10E26E;
	Wed, 19 Apr 2023 22:49:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699510E26E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681944559; x=1713480559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t7H8tvIFPtnrW2qWZZkeOH40r0RXSTZkZ+vjZO6Pfxs=;
 b=YSqyrW5zeiwRoVFxVrqzuWr+lEu7fPK5IZ3m73J33SW2FoNibRZ6iijT
 fQ/CqaM/eUHr9KiLgO57FQEtpPteAgigb4oyxuDNyfPlu8MUyRwbsYcrM
 avaYdTbnpG8/JUgaeJtt5We6evRa8ZnDqlkFTsNKSD03m6+UGhn+vq5XZ
 +pIP7t85+ymw5Q3MlDPbXUod/tJAjdW8LDgnN7DeCFoieU2SIk8gMg+v8
 i4LJXcIyTv/tZIP1hmJcQSkOyy1w2UeI7lwa/ph7E1bcu3ZNniE4T2wuS
 oszttCUes8UfAJv7Pexhnvm0fcK9fITInItx71dtC+I7OPpkDy6k/4R/z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325191003"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325191003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="781009898"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="781009898"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:49:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:49:09 -0700
Message-Id: <20230419224909.4000920-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/sr: Apply masked registers properly
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The 'clear' field for register save/restore entries was being placed in
the value bits of the register rather than the mask bits; make sure it
gets shifted into the mask bits.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index feed87109e93..f77203b32026 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -150,7 +150,7 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
 	 * supposed to set all bits.
 	 */
 	if (entry->masked_reg)
-		val = (entry->clr_bits ?: entry->set_bits << 16);
+		val = (entry->clr_bits ?: entry->set_bits) << 16;
 	else if (entry->clr_bits + 1)
 		val = (entry->reg_type == XE_RTP_REG_MCR ?
 		       xe_gt_mcr_unicast_read_any(gt, MCR_REG(reg)) :
-- 
2.40.0

