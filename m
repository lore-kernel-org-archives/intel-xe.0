Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE6C3DA41
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E725F10E1F8;
	Sat,  6 Jul 2024 00:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVEPxJir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A591410E008
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224137; x=1751760137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UFBDaJotvU9mFHGv8AGly54ivIygqMGt6O/7LBlQ2Qc=;
 b=GVEPxJirs8mh7gkwcnn86+ut5K3qIWmAy+Z/T4nHDZ+36R2++k3K/FbS
 ZLHc0N6U1ckIfy9KJvsLA/YEeVRRU5jISIly8qkWbyj1UHAXk6ZGEiXZ1
 9VgVp3FjdejcpROGDQ7JkZ+L+XLm/04Dds76RQlPaTPIxVb2PlLfVAuXX
 ii8r3sBbKdHPFeStEyqNjW/7BrOYF6zbgPuDzmih8WWDUj+KOoAk8syMi
 3Wos5MpAnIBs9wodsdaPBJRyf04R5XLLksB1Z5yWRglySqF6wSAYFc3QQ
 eyzeRXApO+XYZ7id/jcCpUU5JqvpJVaub2bmyYejfczeL8DTiWPkANvx/ g==;
X-CSE-ConnectionGUID: +sZws/ZATN2wRlr7QVrbNQ==
X-CSE-MsgGUID: 8hiNe4a/TfGcRSXJz5MbyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464652"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:13 -0700
X-CSE-ConnectionGUID: ofx+9Q7YTK2rf2rL+HpPYg==
X-CSE-MsgGUID: mN3COTPrSs+WY3hckICAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128233"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 00/11] Proper GT TLB invalidation layering and new coalescing
 feature.
Date: Fri,  5 Jul 2024 17:02:41 -0700
Message-Id: <20240706000252.702044-1-matthew.brost@intel.com>
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
TLB invalidations in the past.

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
  drm/xe: Add GT TLB coalesce tracepoints
  drm/xe: Add GT TLB invalidation watermark debugfs

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 637 ++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 151 +++++
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
 drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  10 +
 drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
 17 files changed, 800 insertions(+), 282 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h

-- 
2.34.1

