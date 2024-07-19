Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AFEC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E874710EC70;
	Fri, 19 Jul 2024 17:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQSrDYkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19B10EC70
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721410100; x=1752946100;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J2/upmzNJ3DVzG4K/fOBOnrVqb1XofecObPwMzer5fU=;
 b=TQSrDYktuRvHMLVqfZI4Shpy2INzwmYATU9SajNEzqUlL9+C0Vez7uQF
 u5/SNTz85mvrAKYbEBgQeteOUdm+8CCrChYko34m8+LXgv77tA0aWLkLT
 CqtiJzS+tZSTMEAazHL73bNwn3qjKC+zFbz7jbv30G9dzyl0fH38/dbSv
 64stjJjtCJR9yYES0gR8bWlhvBtOPeO8vtz44KIHTP7ddMa95ziRaTVjL
 ppL6Y42xbcVmuvn2jEBQ1C49xlIpFrdXqlQ9HmqPvsvNJMVZ6DUW/O6oC
 k6835HQagnyiud2i2KBqu1k6gGDleWGe21UkfVxyr22vL9uY8Fj8Ri0DG w==;
X-CSE-ConnectionGUID: Zzl74dYjRjWGSzR1B0yYEg==
X-CSE-MsgGUID: 8xXZATrpSQStvpJ7cBcUOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18854003"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18854003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:28:19 -0700
X-CSE-ConnectionGUID: bNkcwFK6RAeNWstLZ564sQ==
X-CSE-MsgGUID: OE/sBKBmQ0mMWtPLp97AvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55458674"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:28:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/4] Keep device awake TLB invalidations and G2H in flight
Date: Fri, 19 Jul 2024 10:29:01 -0700
Message-Id: <20240719172905.1527927-1-matthew.brost@intel.com>
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

Combine [1], [2] to fix PM issues

[1] https://patchwork.freedesktop.org/series/136226/
[2] https://patchwork.freedesktop.org/series/136219/

Matthew Brost (4):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 201 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  12 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  32 +--
 8 files changed, 161 insertions(+), 133 deletions(-)

-- 
2.34.1

