Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E17C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65A10E57B;
	Thu, 18 Jul 2024 06:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYtU/2TM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330B10E579
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285934; x=1752821934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=poog9ctyxzpt0xqCc8qcGMzXoS7eKMxhSjnFq/7TFVY=;
 b=kYtU/2TM2rVCyvKaTzVnzzj9rAAqz4Hw/b6SCG78suIM4l1PD+rSG2bO
 c22hWZvClP1/uSthEXK5Xj2T0W7IIQ4Tx10pISDDfLPRTWRIYz2slvL9Y
 ZCIydUbb/Iz+c/KpfDnI/yfYVSsw1JrxszGiW5l3Ysa60QlmELFHclsmR
 LSHNMjfgduWmcpP5IzuDyR5tpNXWrugRMQw/zgs12Q0szkTsEV09bJvnn
 q2wBTgzQ6jsnQbQyQP3eZj49jqQV75bZUbN3BovCD4eMQK3I/8TxdL97e
 5jM0zqudQcz2wZ18/eTEGNwzQ1AQE0TPn02rQt9sXdX1tf9ofWbHIB/EH A==;
X-CSE-ConnectionGUID: l/aT/SUmRqWR9OQaYuq/+g==
X-CSE-MsgGUID: WJHMqNFiSFGwXKNLo3dQtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18639347"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18639347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
X-CSE-ConnectionGUID: XluVd3mQQSe4FDcpPQMBCg==
X-CSE-MsgGUID: ha/xWPtMQs6bLkI89gyfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="51279279"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 0/3] Keep device awake during GT TLB invalidations
Date: Wed, 17 Jul 2024 23:59:32 -0700
Message-Id: <20240718065935.1451330-1-matthew.brost@intel.com>
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

v2: Fix CI failure
v3: send correct patches

Matthew Brost (3):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight

 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 201 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  12 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  32 +--
 5 files changed, 143 insertions(+), 132 deletions(-)

-- 
2.34.1

