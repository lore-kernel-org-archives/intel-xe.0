Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3378EC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 05:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4F410E52B;
	Thu, 18 Jul 2024 05:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn1N28fR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948510E52B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 05:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721280409; x=1752816409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3TQSLeRlQpgiHpMbSdoAbyM2T5IBBiE6SyI+PvOmtT4=;
 b=Qn1N28fRnH4H0s5E3RiDrRC0E/rsAc2FoHdK/13fuj7LWVtgwe7tNvBd
 o3bsJCZ+KHoKn30yvkfkc3H88w2/xz99cY7ILI9DdyDIYCfIRB0lzGiyG
 Sm/xLIhPlqGb0BaNfTfuarA6v8JLvdFGVgv+Mrt1ubL5b4Y3Dg871ZeRc
 vVOwZpeKjgLmiSnTPktESu0Aer4DFWh1LVGCu5vJeeOH0QPC9w6N2xPKD
 DZ+wPcBkU8GnJt/eWoOFRGvHI/viIvgNW1VFcLJBYs6xZMhp1Q9tXa15S
 KHJAuHKh9h+MxNRexAk+BY0n1TyMLNKM1dZBJkr99SyOwZUaV3smwdZS8 A==;
X-CSE-ConnectionGUID: 6uHm01LGSWaNIkcBEAx/HQ==
X-CSE-MsgGUID: W/T+vsAiQmG73fmXOTBu7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18671184"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18671184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 22:26:48 -0700
X-CSE-ConnectionGUID: ts841T3bS1ayvuZo5IdurQ==
X-CSE-MsgGUID: ML26amJoTyejFVkF8D/Lqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55777608"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 22:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 0/3] Keep device awake during GT TLB invalidations
Date: Wed, 17 Jul 2024 22:27:30 -0700
Message-Id: <20240718052733.1434755-1-matthew.brost@intel.com>
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

Issue was raised in [1], attempt to fix this by holding PM ref when GT
TLB invalidations are in flight. An alternative solution could be hold a
PM ref when any H2G are inflight which expect a G2H.

Including two patches from [2] as they a prerequisite for this fix.

[1] https://patchwork.freedesktop.org/series/136145/
[2] https://patchwork.freedesktop.org/series/135809/

Matthew Brost (3):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight

 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 191 +++++++++---------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  11 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  30 +--
 5 files changed, 131 insertions(+), 131 deletions(-)

-- 
2.34.1

