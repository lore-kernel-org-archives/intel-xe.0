Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FA0D597B2
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C9810E675;
	Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJrxwNII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585FD10E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448522; x=1762984522;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mir/cdNdXSXukBhHj+IX9zfZtexOZmPDZA2Mymmlzkg=;
 b=IJrxwNII2LH6dzWsArSA3SNTVL6aytq4CwId4XjGszygyJP+EmQ05NBh
 rPuByzny2KRyQsmeQ2JNocs/6U6edYEyrKq2Un2ChKsOLmb8Vfh8RbM4k
 htJfJz32yl2lKZp3SDo3Sp1Sl04bMW16MSL5GNPjKgRanfPXofy2F4SRx
 YvW5P2sxQFhq3Vx7Sb4ppIAXAqYQbWP3QrCGWD9lFu4uGZ/u2STWIBwws
 jycgZHKTdeeDt/P6Mhq/XpSAnujExpWd88pXcLz8wFBXQFpoV0iOz4BmI
 GxCkvyIu5FZGy7aV8LL2fgT/4wB/jJcUC9TN7RLJLcIi/U+/pFCmYrKuj w==;
X-CSE-ConnectionGUID: nGqtOBaiRnOLO9XU+w1zyA==
X-CSE-MsgGUID: Lu9xvNNVT8Kc54TcP+p10Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190106"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: J1BRud2KQg2Ce1oW3z4CLw==
X-CSE-MsgGUID: rCM+pY/VTJaiBMfm+r7pUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050229"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/7] Devcoredump Improvements
Date: Tue, 12 Nov 2024 13:55:46 -0800
Message-Id: <20241112215553.1369146-1-matthew.brost@intel.com>
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

Mainly enabling devcoredump for LR queues. Missing is engine capture
from Zhanjun worked on to find one manually or from the GuC. Can be done
in a follow up.

Matt

Matthew Brost (7):
  drm/xe: Add xe_ring_lrc_is_idle() helper
  drm/xe: Remove redundant rebind from preempt rebind worker
  drm/xe: Add ring address to LRC snapshot
  drm/xe: Add ring start to LRC snapshot
  drm/xe: Improve schedule disable response failure
  drm/xe: Add exec queue param to devcoredump
  drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue

 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h       |  6 +++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 --
 drivers/gpu/drm/xe/xe_guc_capture.c       | 29 ++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_capture.h       |  6 ++---
 drivers/gpu/drm/xe/xe_guc_submit.c        | 13 ++++++----
 drivers/gpu/drm/xe/xe_hw_engine.c         |  8 +++----
 drivers/gpu/drm/xe/xe_hw_engine.h         |  4 ++--
 drivers/gpu/drm/xe/xe_lrc.c               | 26 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h               |  4 ++++
 drivers/gpu/drm/xe/xe_vm.c                |  4 ----
 11 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.34.1

