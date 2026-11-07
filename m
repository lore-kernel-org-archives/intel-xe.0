Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A90606A32C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hk9ogthd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952A10E0E2;
	Sat,  7 Nov 2026 17:27:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012310E092
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794072464; x=1825608464;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ejxP8YVu8kNcYmZsePTVne41Cri51yVV8btgYCVvoAo=;
 b=Hk9ogthdHJs4OG3HMKYwD86GvZ95ZhQTHwXLcCIDIYWi1OVYVKIxbWma
 5spTqb6ovG8VRQRcWVo5KBlCpLgxBcDuEvbuX+mdjIDMffNaBDfZq/df3
 smI6Ewc1zp5g+XxzddyW59fVwbjd6BOJJ0/XtyjwJR8t0oGOxe2XwlEA8
 /kPjCVbXFRif8sX6bCxv1AD2QlUJTuKZuRGMvGJzgcoHdoLi++MeWhpJU
 j25YpGdMtEYigrcoqgJtphcfAJRrwSumNjXfUgQANFdSjp83h8lkwNTqH
 x2GojhgD/5wUwcTDFViU32/qVggdhvtH3VveoSvVPcoFBi/P/XsEYvR9I g==;
X-CSE-ConnectionGUID: t9MlYMtuRVeOclkHhj1IhQ==
X-CSE-MsgGUID: a5FzJBl7QUKkJCmEGX1HaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2901539"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2901539"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:43 -0800
X-CSE-ConnectionGUID: WE1zNxSlRdmZEp8kXyNWIw==
X-CSE-MsgGUID: 5AMoM/rkRoeNn6Fq+r5d9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9382476"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Spurious OOM with P2P dma-buf imports on multi-GPU systems
Date: Sat,  7 Nov 2026 17:26:49 +0000
Message-ID: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261107-oom-fun-20d9362a40cf
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On multi-GPU systems with large amounts of VRAM, huge multi-GPU
workloads can see device allocations fail with OOM even though there is
plenty of free VRAM on every card and host memory is largely unused.

The Level Zero runtime creates one context spanning all GPUs and, by
default, makes every device allocation resident on each P2P-capable
peer. Each allocation on one card is therefore exported as a dma-buf
and imported by every other card, so the amount of imported memory per
device grows with both the number of GPUs and the size of their VRAM.
Disabling P2P in the runtime makes the failures go away.

Investigating this with a standalone reproducer and some instrumentation
uncovered three independent issues, each of which can turn the P2P
import fan-out into an allocation failure:

1. Imports consume fake mmap offset space. TTM allocates a
   drm_vma_offset node for ttm_bo_type_sg BOs, but xe never allows CPU
   faults on imports. The offset space is 1 TiB per DRM device on
   64-bit, so with enough peer imports it runs out and the import fails
   with -ENOSPC.

2. Imports are charged against the host-RAM-sized TT budget. Each
   device's TT manager is sized to total host RAM, and imported BOs
   placed in XE_PL_TT are charged against it even though their pages
   belong to the exporter (peer VRAM in the P2P case). Once the
   combined size of the peer imports exceeds host RAM, binding further
   imports fails, while actual host memory use stays low.

3. Exporting a deferred-backing VRAM BO allocates host pages. A BO
   created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING starts in system
   placement with a ttm_tt. Its first move into VRAM has no source data
   and goes through ttm_bo_move_null(), which keeps the stale ttm_tt.
   ttm_bo_setup_export() then populates that ttm_tt on export, so every
   exported VRAM BO also pins as many host pages as its size, which are
   never used. These pages are neither accounted against the TT budget
   nor shrinkable, so with large exports the host runs out of memory
   and the OOM killer can be invoked. The runtime only uses deferred
   backing once VRAM use is above a threshold, so it is exactly the
   large allocations that are affected.

With all three patches applied the reproducer (based off customer
workload) passes with the runtime defaults, and host memory use stays
flat throughout.

Patches are posted for posterity and discussion, and not necessarily to
be merged as-is in upstream. Each issue can be fixed properly upstream
separately.

---
Himal Prasad Ghimiray (1):
      drm/xe: Exclude imported dma-buf BOs from the TT budget

Matthew Auld (1):
      drm/xe: don't allocate fake mmap offsets for imported dma-bufs

Thomas Hellström (1):
      drm/ttm, drm/xe: Drop the ttm_tt on null moves to VRAM

 drivers/gpu/drm/ttm/ttm_bo_util.c    | 20 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c           | 12 +++++++++---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_dma_buf.c      |  9 +++++++++
 drivers/gpu/drm/xe/xe_query.c        |  3 ++-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 38 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h  |  3 +++
 include/drm/ttm/ttm_bo.h             |  2 ++
 8 files changed, 85 insertions(+), 8 deletions(-)
---
base-commit: 5cd64b7b38f36620fbc117c53b4866b0590a3a93
change-id: 20261107-oom-fun-20d9362a40cf
