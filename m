Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308CCCCF9F1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594E010E84A;
	Wed, 29 Oct 2025 20:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVIprP8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0910E848
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761771445; x=1793307445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6sp/cphPhpbrxOfa9kTIIQcPhUfJ3vLiUC+rtSWLtxs=;
 b=XVIprP8WWVIYv/89V8fRBCmNLyJHwEKvjzNi6EJbUZaeWaIkI1rzkslb
 TO7QT/IbWCePDjNcSak4WXvMfQjzfIT4AWj68NUdaQ+FT9J8J7jNma7hs
 41EuTTZ3m/8eTxI+96B4uHd41k2vSkyjDHBDI8fQ57vp9Sm4fZ1P+DCo9
 jVQHRHZG86y5VIpHUuGV0vv/lB3bbkDQXshOUWPdAtZ2krUeHMh3k2oW9
 ucUrynrRK7F/tO/ILzCkpxmN2LcHdMs8+vYuyOecNEF7CQ63feBoeBssz
 M0fOEOZkzq7y2K1XIm3+MKBrFv7vSo0gDvBninXhbJ7XNL7NiYM/IhqwU Q==;
X-CSE-ConnectionGUID: GszLU2s4SdKd9Wa/WIKfJQ==
X-CSE-MsgGUID: c9+ur7+2SoK7RiKknmXKzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86533173"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="86533173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
X-CSE-ConnectionGUID: 3VKzXnuDTjuqVPZvsDtpvg==
X-CSE-MsgGUID: 5xMAqLauTFiXQtF9AVxOKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190128883"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 0/6] Fix serialization on burst of unbinds - v2
Date: Wed, 29 Oct 2025 13:57:13 -0700
Message-Id: <20251029205719.2746501-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Attempting to resolve part of [1]; this solution differs than v1 [2] 
by changing last fence semantics detailed in the patches.

Overview of issue in [1]:

When a burst of unbind jobs is issued, a dependency chain can form 
between the TLB invalidation of a previous unbind job and the current 
one. This leads to undesirable serialization, causing current jobs to 
wait unnecessarily for prior TLB invalidations, execute on the GPU 
when not needed, and significantly slow down the unbind 
burst—resulting in up to a 4× slowdown.
 
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
[2] https://patchwork.freedesktop.org/series/156144/

Matthew Brost (6):
  drm/xe: Enforce correct user fence signaling order using drm_syncobjs
  drm/xe: Attach last fence to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations
  drm/xe: Skip TLB invalidation waits in page fault binds
  drm/xe: Disallow input fences on zero batch execs and zero binds
  drm/xe: Remove last fence dependency check from binds

 drivers/gpu/drm/xe/xe_exec.c             |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 119 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  23 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  12 +++
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
 drivers/gpu/drm/xe/xe_oa.c               |  45 ++++++---
 drivers/gpu/drm/xe/xe_oa_types.h         |   8 ++
 drivers/gpu/drm/xe/xe_pt.c               |  80 +++++----------
 drivers/gpu/drm/xe/xe_sync.c             |  91 ++++++++++-------
 drivers/gpu/drm/xe/xe_sync.h             |   3 +
 drivers/gpu/drm/xe/xe_sync_types.h       |   3 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  31 ++++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |  97 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h         |   6 +-
 16 files changed, 376 insertions(+), 172 deletions(-)

-- 
2.34.1

