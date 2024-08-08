Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4529EC52D7C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 09:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69AA10E69A;
	Thu,  8 Aug 2024 09:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azt4WUvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BB410E69A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723109185; x=1754645185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQ04D3YtlLHBDi1IVj1C/5cMh9b7QV5QadO5v8uhAkE=;
 b=azt4WUvJu8BnJUhQuOB6643yXInCXe4Btr0hEw0R8gmlgrl3MDSB6BAR
 gk9rDOIdWSbtvgRwdkXXnswHIMPjdlUrzCuLvHDvRzZHu6Ie56503Jp66
 DD/gFelTI/CpVX1VnORGGzsHmc6aVZINp+OpEDpTMNLsjGXw/6Vdu2MXo
 L0lll7s8JrKBbhvStjOXG4b7d13H8wu5JzE9njzjY6hfqd8TLiBj3Sncg
 TP1VibfhEs0A5mPHRohGuKu3LiTdhdoNV4M/lgoabZsplK0QfGB2AiRD4
 Scw5z3wMCxHwMweiYXfzNTZvtdmDW8HKTsDzy0OfdHs/dkXHVEK2TgyL3 Q==;
X-CSE-ConnectionGUID: 3r9iU/e8SqGMUPnz4gNh3w==
X-CSE-MsgGUID: lTv+qShUTg+t4HaxoEFDyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25094238"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25094238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:26:25 -0700
X-CSE-ConnectionGUID: uC/aRyEKSKa0LGAkpbIpgg==
X-CSE-MsgGUID: ppzG9aMdQkC1VtVfGU4nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="62000409"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 02:26:23 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Date: Thu,  8 Aug 2024 14:58:25 +0530
Message-Id: <20240808092826.585276-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808092826.585276-1-tejas.upadhyay@intel.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
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

enable host l2 VRAM is example where MCR register is
getting read before fully MCR init is done. Lets move
enable host l2 VRAM after MCR init.

V1(Lucas):
 - Reorder patch and reorder flow of L2 VRAM enable

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..238c7d1053f0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
 
 	err = xe_uc_init(&gt->uc);
 	if (err)
@@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
+	xe_gt_enable_host_l2_vram(gt);
 
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-- 
2.25.1

