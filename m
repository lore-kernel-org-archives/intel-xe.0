Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE1C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 19:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647CE10E7F5;
	Wed,  4 Jun 2025 19:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0THsGwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3CD10E7E4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749063636; x=1780599636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3uC/fhwimVaVuJe1VgLed5zI3leQQCUAhuI1w/L8Hw=;
 b=f0THsGwR7Eg1KjlXWJV2hpu+VmFfxjbh2WEjNy11snMMrNIaWeMsaxMY
 dEuq51Vod2ktvrEgL2r8QDt2t/o2Aw2SxBYkJgelQ+Zj/7pYq4A+lnVeg
 b+yZEg9hgrSwjiN6UCgFPmPY3BNRodEyqsgmO7eRaXVDUPBE4bSmRrg2k
 VDNX1mIoN/la3ez4Km6GRuLUYGBz1SZa6NxGumeh2uc7HyIKhQLV2I9Fi
 dyjIT4lhvCV8J7PnzFRpeOGb86lVs2dwXTDn3j7n5dBaaG5UP7nHgRP3K
 OCupiijbMCB03dsZsuV5+mM0uetaPLdYfckgHigLKDErU76rgJQJ7Cual A==;
X-CSE-ConnectionGUID: R87SjhDMSguDHvXTMgq9qw==
X-CSE-MsgGUID: Y5Y4c5ltQkWCyuy4J+OiQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50279996"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50279996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:36 -0700
X-CSE-ConnectionGUID: p3yoH0FtSf2Y9NMOQqp4kg==
X-CSE-MsgGUID: i3X7TVo4RGCoCPaWHMGPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150066473"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe/pf: Print configuration KLVs using debug printer
Date: Wed,  4 Jun 2025 21:00:21 +0200
Message-Id: <20250604190021.725-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250604190021.725-1-michal.wajdeczko@intel.com>
References: <20250604190021.725-1-michal.wajdeczko@intel.com>
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

While we print VF's configuration KLVs only under DEBUG_SRIOV
config, we should be doing it at debug level, not info level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..3128d9adc10e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -104,13 +104,13 @@ static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		struct drm_printer p = xe_gt_info_printer(gt);
+		struct drm_printer p = xe_gt_dbg_printer(gt);
 		void *klvs = xe_guc_buf_cpu_ptr(buf);
 		char name[8];
 
-		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
-				 xe_sriov_function_name(vfid, name, sizeof(name)),
-				 num_klvs, str_plural(num_klvs));
+		xe_gt_sriov_dbg(gt, "pushed %s config with %u KLV%s:\n",
+				xe_sriov_function_name(vfid, name, sizeof(name)),
+				num_klvs, str_plural(num_klvs));
 		xe_guc_klv_print(klvs, num_dwords, &p);
 	}
 
-- 
2.47.1

