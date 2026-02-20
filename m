Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D211C5AD69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1DF10E83E;
	Fri, 20 Feb 2026 20:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRH/o+hN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAC910E83A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771618751; x=1803154751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3157a0rTf2RfjFGHIo+YhSSaSYBFRPCu2SvFOw3wJc=;
 b=NRH/o+hNYEzkQP45ux8/PtVXGj26SUACtQ+b4K4p8SRJw5/fmDk+hmtD
 yV93zi6E6+MTRrSpqvKZpt7qx52RzhjYhASHGaYmfQWVfSSKAVjLfC3Ek
 YcnWqJwMuXc9u0CDIG7LO2EJUSqP4X8ztCF6BMs27s3cHyHnQ1G8ZMnY+
 glWSFIQWXaupx2jgDzIHfmLMZuNB/Hd4ZWMmocz7TekjYVrAiBISr/a7M
 ACli9rujJUNAW1SmCcH8gTUUTfgaHeHRoudIUVyIHew6kjxF67fw+tlF5
 WS5Xanv8NDJxeZpc88UEWqNatOd2AdJkHqabVCFdNqAOJJZ9UaK+K4u1+ Q==;
X-CSE-ConnectionGUID: dprS8Ma3T0K+qH1LlPWs8Q==
X-CSE-MsgGUID: gMfB+EySSDSEXiLdmKWGkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84169541"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84169541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:11 -0800
X-CSE-ConnectionGUID: XcYi1kRZSMKLuEvmaCKkdQ==
X-CSE-MsgGUID: G+vQycsyQZWpIegqciSPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214182102"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Use explicit VRAM BO flag for VRAM provisioning
Date: Fri, 20 Feb 2026 21:18:53 +0100
Message-ID: <20260220201857.6113-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220201857.6113-1-michal.wajdeczko@intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
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

When we are about to provision VRAM/LMEM for VF, there is no point
in using semi-automatic flag that supports fallback to the SMEM.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index cba20eb6b36b..6383763d02ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1652,7 +1652,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	bo = xe_bo_create_pin_range_novm(xe, tile,
 					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
 					 ttm_bo_type_kernel,
-					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_VRAM(tile->mem.vram) |
 					 XE_BO_FLAG_NEEDS_2M |
 					 XE_BO_FLAG_PINNED |
 					 XE_BO_FLAG_PINNED_LATE_RESTORE |
-- 
2.47.1

