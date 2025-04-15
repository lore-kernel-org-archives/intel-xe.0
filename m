Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE00C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 17:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8E10E13D;
	Tue, 15 Apr 2025 17:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPQaagYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4210E131
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744738499; x=1776274499;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vteeEPD7zNXx3uYbkWIAFvLzHBsqGXRwN69qu/sJOx4=;
 b=TPQaagYrDJ1v489DMCJJtAEp6+O92QOsBrKk0J4336Ho2lbjfZSmA7sQ
 jdRWgIkyIiH3a6yrtzUXfOhcGYyXzHKr5C0gEzBgeJZZIfDv+C8y0t81m
 QASnAic7tFh938UZ8AnmrT9yPXoh7xHJRUj74ZncquWlZC0zZc3Vkm3RR
 AFwCTYN6E3BzOHlUf+4miiotG4pC2lJPo7KoPGOWLNdzFP8NJ8biXqWka
 suQmAMb2ykhv9MtVWkcI+sGRHSnNArSdDjILJJ9rwPWu4wCCl/Q50gFD3
 qwO4ktgghdABB4BXtLLKqsJDvWnnpWM5OJoYS9X9wdHDUxjptK3NHh2Ei Q==;
X-CSE-ConnectionGUID: cIpE1aXjQv+3nIPI+dqpFA==
X-CSE-MsgGUID: npz23Z8VR+ScB28ZYDkZHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56441684"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56441684"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:59 -0700
X-CSE-ConnectionGUID: cG24kZJqRCWzUQ1sZN2I/g==
X-CSE-MsgGUID: alnVNplSQZeuNzRMlvIyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131085216"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/4] Large devcoredump file support
Date: Tue, 15 Apr 2025 10:36:09 -0700
Message-Id: <20250415173613.294522-1-matthew.brost@intel.com>
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

Devcoredump were truncated at 2G, remove this restriction. While here,
add support for GPU copies of BOs to increase devcoredump speed.

v2:
 - Fix build error
 - Abort printing once printer if full
v3:
 - Actually fix build error
 - Address a few nits from Jonathan
v4:
 - s/drm_printer_is_full/drm_coredump_printer_is_full (Jani)

Matthew Brost (4):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/print: Add drm_coredump_printer_is_full
  drm/xe: Abort printing coredump in VM printer output if full

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c           | 218 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   3 +
 include/drm/drm_print.h                   |  17 ++
 8 files changed, 288 insertions(+), 32 deletions(-)

-- 
2.34.1

