Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C9E77184
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 22:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8412510E62D;
	Mon, 16 Dec 2024 22:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZnf4aV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0D610E62D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734388401; x=1765924401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yDccV9EBoYc3tGLO5Apg6gTX8JpptFDdgHLaQHThvrQ=;
 b=jZnf4aV92zyURHhqfS7wDlnQxiXUIHZFQYbg8yAg6BkISt5nNe+9XCDf
 zGlmErIGOLk/FQzgt/MKgcYDkIuo8az87swBwCoMNFukqj/i0tlvGiKs8
 94pdbOuSTbZ9YONwHV7TTBcRikonJZajVBldEQlEuycScNmt5jXaroyuo
 RjJmjgnn+O0Rnsi10bw+0qamMwMbDCqvD8jTJpknwkWeJOK7EmiCsg9a8
 HbRi2HdUnsB37aXqwEqqEPgOdMvgaPqPs5ISnHup2fVMqw2WVyb4zp4xT
 ye+Kwz94kxVxiF8MBGlqEuvMdyf5i5j+RRoOy4Gl4AFocNpTALqEFYdei Q==;
X-CSE-ConnectionGUID: SgV0tp+XSwut6MUcduTIPg==
X-CSE-MsgGUID: Wql+R3I8RLiveaHP6Yyc/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34942230"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34942230"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 14:33:21 -0800
X-CSE-ConnectionGUID: /7wGZaLsRNeNv2u/5PoAHA==
X-CSE-MsgGUID: KpmYxuYeSJ+hwWz657/OrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97579991"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 14:33:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Use correct function to check LMEM provisioning
Date: Mon, 16 Dec 2024 23:32:53 +0100
Message-Id: <20241216223253.819-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There is a typo in function call and instead of VF LMEM we were
looking at VF GGTT provisioning. Fix that.

Fixes: 234670cea9a2 ("drm/xe/pf: Skip fair VFs provisioning if already provisioned")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 65082f12f1a8..bd621df3ab91 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2120,7 +2120,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_any = valid_any || (valid_ggtt && is_primary);
 
 	if (IS_DGFX(xe)) {
-		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
+		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
 
 		valid_any = valid_any || (valid_lmem && is_primary);
 		valid_all = valid_all && valid_lmem;
-- 
2.47.1

