Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1743BC282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D889D10EC11;
	Fri, 28 Feb 2025 07:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NP+u4D1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00210E217
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740727873; x=1772263873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KPgZ9RvidcQ6evGqvytk/WTi38069iidp9nwhAIHpg8=;
 b=NP+u4D1a4DyaWk5hFY2n4RbWT1tbu+3ARHjgI2EMLnSHQvIvc5ypBcFq
 BgkuiAqG0jvEVHE/bDi+zB227ofSowx9w9IAIO4X/oBozy6ZH4krsYKCQ
 JpfMvRO0tuck6YSKrlL7/igh3A3OTYR/+JQodP/L0elyFIjCVMvs/UelA
 Vk48gX8udbRuYeyjkdBP3m23MAQFLu6oy6OUdn26P509PxlGQFFbr4Vjr
 +ZvIo6t9PkXAn6t0CasElTQxFJ0HG7PiDNR5a2tuqByEbXW7uedHFHYQI
 KSdsUNEWqEoR5VhlKKJ0KnT/PH0Cs8RddBDPYspg6XCV+m91lADrJML3B w==;
X-CSE-ConnectionGUID: 12pQA1BFRRmPSXilpo7Y/A==
X-CSE-MsgGUID: 8KmReTuQSvmdh+QH34CX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45297762"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45297762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:12 -0800
X-CSE-ConnectionGUID: md00EW2dQ5KIOJ9Hxj6liA==
X-CSE-MsgGUID: 1xxjuJLWQC+6pzrYCdhl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121386215"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:11 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/4] drm/xe: Fix userptr races and missed validations 
Date: Fri, 28 Feb 2025 08:30:54 +0100
Message-ID: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

A series that fixes a couple of userptr races and a missed validation.

Patch 1
- Fixes a missed userptr validation causing a potential infinite loop.
Patch 2
- Fixes a misplaced #endif in preparation for patch 3.
Patch 3
- Fixes a race between fault mode invalidation and unbind, where
  the userptr invalidation could attempt to traverse a page-table
  tree under modification
Patch 4
- Fixes a race between fault mode invalidation and multiple bind
  operation, where the invalidation could potentially get lost.

v2:
- Fix an unintended Fallthrough (Matt Brost)
- Don't recommend backport of Patch2 for older kernels
  than 6.12+ (Lucas)
- Update the locking requirement docs and asserts for
  forced invalidations

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Matthew Brost (1):
  drm/xe: Add staging tree for VM binds

Thomas Hellström (3):
  drm/xe/vm: Validate userptr during gpu vma prefetching
  drm/xe/vm: Fix a misplaced #endif
  drm/xe: Fix fault mode invalidation with unbind

 drivers/gpu/drm/xe/xe_pt.c       | 96 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_pt_walk.c  |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h  |  4 ++
 drivers/gpu/drm/xe/xe_vm.c       | 96 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       | 10 +++-
 drivers/gpu/drm/xe/xe_vm_types.h |  4 +-
 6 files changed, 132 insertions(+), 81 deletions(-)

-- 
2.48.1

