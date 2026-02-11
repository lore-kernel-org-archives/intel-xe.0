Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBB1ECD6F7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF19210E669;
	Wed, 11 Feb 2026 23:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRs8IloX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D210E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852791; x=1802388791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r44AGhN9lO1M0gWpAzoZ9JoqzraI+DYHB0lXm9UK6Q4=;
 b=VRs8IloX2OkyGv5BaipEv1u6gmBjCV3wnEP/xdxbUrji9b/eBPC5qjMe
 Ryi5m/TPKDe92JDTh5eaQ1VUcfGkGgST8iEG2EEEPstfMB9N7cuEVy3PH
 aOpPg1ZcBtvruAgGo8R/kUclkNzjgsrLfv75sxIy5EaCpGKR9YzREf7FN
 ikGkzvXkKpQUyldipR5+kurlQ+pW+ZfZHZJsKN6D5j3yB8ld0+/4A6Tmb
 /B66rZeY6GhdSzEvV4kS1GMjimQfIFwmbsjBDNFW/YQH2cdIzK8dZVnjP
 ersBQMHf7BvHOc0igB9i5q0v7qHSs7BgighXsIpmiVsZJ63o93VZnXFJT g==;
X-CSE-ConnectionGUID: jPXnkuGIRRe0MScC19nxQw==
X-CSE-MsgGUID: 39yjWHbXRuutyUecjA0FVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71916310"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71916310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:33:10 -0800
X-CSE-ConnectionGUID: hK7CG8ebR4+bVsry+4uLxw==
X-CSE-MsgGUID: ziSBmFM4QQC3q1Sn8DTbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212495384"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:33:11 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe: Do not process engine WAs and tunings for SRIOV VF
Date: Wed, 11 Feb 2026 15:33:04 -0800
Message-ID: <c6adbb6724e607902818b57bc3426004b87da49e.1770852521.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
References: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
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

Engine workarounds and tunings are not applied for SRIOV VF, so do not
process them.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4d3ee5226e3a..7c5b4c1638ff 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -568,8 +568,10 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	}
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
-	xe_tuning_process_engine(hwe);
-	xe_wa_process_engine(hwe);
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		xe_tuning_process_engine(hwe);
+		xe_wa_process_engine(hwe);
+	}
 	hw_engine_setup_default_state(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
-- 
2.43.0

