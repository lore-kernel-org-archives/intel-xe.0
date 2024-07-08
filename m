Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46342C3DA45
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A7810E0A5;
	Mon,  8 Jul 2024 04:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKhRmlRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15810E012
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411370; x=1751947370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3L8TU9k9vP+0KvUjOeyqHU/GDCjm6PBUFI29+cO8IyM=;
 b=jKhRmlRHqO1VFj0BDBoIcFNkvQyBdifb2tDWUv1D69lXrkEfSNc8Wpx7
 jWBDkt+wlpIv2IL6J+0xsS0tCYFSmO3mCqXRqwX6dYkxmnRZUciXGAW+1
 +h0/9WuGxLhSoNpJvP8XBYoJ08QUrAjAyp3MEWa/FKOpHzxGazD6hIS1Q
 uThojZm5jvSLYqyAaiuWcIZjI7lg+K6h/6wNaGx2GjL6b+LkDwfb2ckxc
 T7scpPzQikvFFAfuSq2oMS20NGSOUboTEMLcotWHxaA1hptfaF9WoXH8G
 z8yEY0HiBxoRxOh0hCGVm89Dv37V29SIkX/IFe15UaKzcwC22KnaNBr/a A==;
X-CSE-ConnectionGUID: 8tK+eEphT9ynWKpS1B3Gvw==
X-CSE-MsgGUID: z4hnLb3DRtq6gZTY9VtW0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205297"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:50 -0700
X-CSE-ConnectionGUID: sOVa+GqxQC2Ok3rSqvPeqg==
X-CSE-MsgGUID: jDJ3jWc9TbWGGlVSmJv6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518760"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
Date: Sun,  7 Jul 2024 21:03:20 -0700
Message-Id: <20240708040331.766264-1-matthew.brost@intel.com>
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

While debuging [1] an issue was identified in which if too many GT TLB
invalidations are issued to the GuC, the GuC can get overwhelmed to the
point scheduling of jobs starts to stall. To avoid this, hold and
coalesce GT TLB invalidations in the KMD if a watermark of pending
invalidations is past. Add gitlab for this issue has also been opened
[2].

Layering issues with GT TLB invalidations are known [3] which needed to
be fixed first before adding this new feature.

- Patches 1-8 fix the layering.
- Patches 9-11 add coalescing feature.

We could merge these two as seperate series if needed.

CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
TLB invalidation issues in the past.

v2:
 - Fix CI issues
 - Clean up some of the series / patch structure

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
[3] https://patchwork.freedesktop.org/series/133001/

Matthew Brost (11):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
  drm/xe: Add tlb_invalidation.seqno_lock
  drm/xe: Add xe_gt_tlb_invalidation_done_handler
  drm/xe: Add send tlb invalidation helpers
  drm/xe: Add xe_guc_tlb_invalidation layer
  drm/xe: Add multi-client support for GT TLB invalidations
  drm/xe: Add GT TLB invalidation coalescing
  drm/xe: Add GT TLB invalidation coalesce tracepoints
  drm/xe: Add GT TLB invalidation watermark debugfs

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
 drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  10 +
 drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
 17 files changed, 801 insertions(+), 279 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h

-- 
2.34.1

