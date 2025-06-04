Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4733DC5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 19:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB9910E7E3;
	Wed,  4 Jun 2025 19:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlfYUq0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6BB10E7E3
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749063634; x=1780599634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqbPOCn5azwkNE8zX1P304Joqs1Cv4OBFErVcfqKXNE=;
 b=OlfYUq0wkQQjRbuhX4oCa1AXIH6h9t6l1ltCpM3WWJG1rnY1Jsk2a2QL
 kmkhWikggmqyfRu1Yxlol6UVVOu5ntPXVoEUxvvKMLJ+ChwZmKTwG+5nL
 12PFYBes2LiWJf0c4WlKq/6ceVukowtgj4d2qj0HjNEOgC80ifBboti98
 VpDm9pUACU+t5+FWHHkV3DNlki6wB5+LMfjfPqd5okZ0REQq1Lj89GLnY
 0DD6CDuelAjvMCBd71A65Rgd9r9p6/XAtjZ4Nb9MkP2yq5srMq98jZw1Z
 OkZsPeVqN/0B6xip90ibtPaKGys6exvtZ4XMFT9O//N1EXK9injMNaJw/ w==;
X-CSE-ConnectionGUID: 46ltWprgRtm409BN3co4jw==
X-CSE-MsgGUID: ugur3dufRumni32+GYzRFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50279995"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50279995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:34 -0700
X-CSE-ConnectionGUID: LjiVuAUqTiylmGGqKKLdtA==
X-CSE-MsgGUID: wu5ixSeTRYaotj+u2WJsNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150066470"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Print runtime registers using debug printer
Date: Wed,  4 Jun 2025 21:00:20 +0200
Message-Id: <20250604190021.725-2-michal.wajdeczko@intel.com>
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

While we already print VF's runtime registers only under DEBUG_SRIOV
config, we should be still doing it at debug level, not info.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 821cfcc34e6b..fa74b3e1a964 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -266,7 +266,7 @@ static void pf_prepare_runtime_info(struct xe_gt *gt)
 	read_many(gt, size, regs, values);
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		struct drm_printer p = xe_gt_info_printer(gt);
+		struct drm_printer p = xe_gt_dbg_printer(gt);
 
 		xe_gt_sriov_pf_service_print_runtime(gt, &p);
 	}
-- 
2.47.1

