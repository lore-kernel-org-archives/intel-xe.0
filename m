Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E658C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4E710E573;
	Thu, 18 Jul 2024 06:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px2Xv8cH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9D410E573
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285687; x=1752821687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u0QhidDopR5jSppa5ngIuBb16F1xfGOD1k2YTpJ6OxQ=;
 b=Px2Xv8cH4zDRYAw3tK59Y3LSR64K+e8gWYxW8QjYcFzMm+IRSpG/WoE3
 phUhlnSulGcjoQ9qdtV4wVRTOW5H86NtfXmFNhEkJUh0UQl80Vozs2PG4
 mhSX3LAqC2Qd9GidDo+DXCe0JPQH60iBSS8gIYxuvW8j9c1HU0vamWZ2d
 G84Ol0x+iWZMITOj5NV17VGSGD4/lGomYJVcXX6GCvlQTM+93Igj2e3Oc
 EcwdHp+Wo45+7PAhDafdHtRWa6ukRZiXUWeXpBi59mFMSgK3iJTY8BSxX
 jXpDPqQ/esFSKwjVcwUy3I5Z1hrXtAaRLC5Bx5Sxh3+0yhX1ZAGCud8cW w==;
X-CSE-ConnectionGUID: QEfHOpZ4SjWxQNcbFDA7tA==
X-CSE-MsgGUID: FKYVtaoXSR296aw2YibPaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22597490"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22597490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:54:47 -0700
X-CSE-ConnectionGUID: PUBWi/muTd23EvM4r2Xjyw==
X-CSE-MsgGUID: vMgJvyYvT6qdcZXSRUJBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="81697528"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:54:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v2 0/3] Keep device awake during GT TLB invalidations
Date: Wed, 17 Jul 2024 23:55:28 -0700
Message-Id: <20240718065531.1450775-1-matthew.brost@intel.com>
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

Matthew Brost (3):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight

 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 201 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  12 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  30 +--
 5 files changed, 142 insertions(+), 131 deletions(-)

-- 
2.34.1

