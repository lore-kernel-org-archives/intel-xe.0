Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A32CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79C310E081;
	Fri, 24 Oct 2025 15:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwsDWEYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1655710E081
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761319409; x=1792855409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TkxMxLalGFiNBvptWbKb+sqCRHDBmz8uu3RzC8fRxt4=;
 b=ZwsDWEYPwsS0dEwFEwZoLhNT6GBpevf3+oC1KIApmElKxfJpA/SvgvlR
 1MR3INko0t1AW8Oa4xysTkDmIEKLzfv2WL4I3AoahnBNI5MryJwQzNCmG
 LSE4yFagt/l+px2zRpbl9cAKw2QXi9AYwZXtK6xIwfEu3t3NdMuXSbCrk
 mT1A+BXBFuwOc33u6trviqIdyvfX7kuv8V7tXBjGSRnoQXE/Yvaqv0dlj
 9epOoDPxtLfRCy1d4ghHvIq9vSm7kBEAH0+KHWyesxZ5/1aFh0JrCA3TT
 f3ELU5Xd2zpN8bf4oL8ClN3o0Xdtxytfn+yZ2KKsRXX6s38kxSfPLVPGD A==;
X-CSE-ConnectionGUID: DnNGushPQjGPzgTH+SYTcw==
X-CSE-MsgGUID: kRiR46lcSQ2sx8jCXBokMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74621848"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74621848"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:23:28 -0700
X-CSE-ConnectionGUID: gWFCmTogTbe7OJayQM78BQ==
X-CSE-MsgGUID: jVywmFDLTF6UtY7gflkfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="184351299"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:23:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 0/2] Fix serialization on burst of unbinds - v2
Date: Fri, 24 Oct 2025 08:23:21 -0700
Message-Id: <20251024152323.1281242-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Attempting to resolve part of [1]; this solution differs than v1 [2] by
changing last fence semantics detailed in the patches.

Overview of issue in [1]:

When a burst of unbind jobs is issued, a dependency chain can form
between the TLB invalidation of a previous unbind job and the current
one. This leads to undesirable serialization, causing current jobs to
wait unnecessarily for prior TLB invalidations, execute on the GPU when
not needed, and significantly slow down the unbind burst—resulting in up
to a 4× slowdown.
 
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
[2] https://patchwork.freedesktop.org/series/156144/

Matthew Brost (2):
  drm/xe: Add last fence attachment to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations

 drivers/gpu/drm/xe/xe_exec_queue.c       | 100 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  18 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
 drivers/gpu/drm/xe/xe_pt.c               |  64 +++++----------
 drivers/gpu/drm/xe/xe_sync.c             |  62 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c               |  60 ++++++++------
 6 files changed, 232 insertions(+), 77 deletions(-)

-- 
2.34.1

