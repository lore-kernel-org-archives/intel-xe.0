Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C740CEACC1
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 13:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5E710E61C;
	Tue,  1 Oct 2024 13:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOTF4g9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3250310E61C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727790209; x=1759326209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NFuUOg+q+yHGEMzi/8u03Lb1998n3G/6IzaDnUtT03I=;
 b=EOTF4g9OW72GdcHMG2V8OBdIxntKHeD6zZITN7yFzpqpuSCg4dJOG0fS
 0xFcxs0qeiMw44JDRVvlRQNBetGeYm2EjjgkRGiB+w3uQbucH5L7Gq+u9
 Tsl8YgyUgqC8JW6IvuywOLz1EuA+Ml1xBY4rK5qSfaFUQC7rnp1c3HNo8
 fe0M+DZpIdsbCdrlwqi0xKEW/Hj2dyCE3aosf7wD+l5masujwtZgnXeTJ
 LeFPQHue+eU1FkwVWFFDA1Ixsb/kJfONvJ3xedlQW6NxLreawxMMvPbnP
 qHpUmeSX6AfOvrQrh/NGqlcfSK3HW1Xgh9O0F7AVtIHSaT2Lck7Q2EP7y Q==;
X-CSE-ConnectionGUID: ZkyKip9+Rr2p9Xx+rdvT6g==
X-CSE-MsgGUID: hY7If+tLTEiyG2O4UeLJRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49446841"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="49446841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:43:29 -0700
X-CSE-ConnectionGUID: q333XGNJTQ636+Yqy8Nbug==
X-CSE-MsgGUID: IA+6RQT+QS2cIZ3JbC/awQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73791082"
Received: from suttanur-desk.iind.intel.com (HELO
 singhapo-Super-Server.iind.intel.com) ([10.145.169.90])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 06:43:27 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: oak.zeng@intel.com, Apoorva Singh <apoorva.singh@intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: [PATCH 0/2] drm/xe/uapi: Restore uapi for access counting
Date: Tue,  1 Oct 2024 19:24:30 +0530
Message-Id: <20241001135432.447074-1-apoorva.singh@intel.com>
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

From: Apoorva Singh <apoorva.singh@intel.com>

In order to enable access counters, this must be enabled in LRC for
the exec_queue. Add basic uAPI to set configuration of access counter
trigger threshold and granularity.

When access counters are enabled and threshold is hit, the access
counter handler in xe_gt_pagefault.c will migrate the buffer to that
to that GT's local VRAM.

The current implementation of access counters is incomplete in that it
doesn't manage the PTE_NC (No Count) bit. HW has finite number of access
counters which HW itself dynamically allocates/deallocates. As these are
a finite resource, don't enable access counting (don't waste counters)
for page table mappings which cannot take any action on trigger of access
counter threshold (cannot be migrated).
The logic for this decision is encapsulated in xe_bo_can_use_acc().

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>

Brian Welty (2):
  drm/xe: Add support for PTE_NC bit
  drm/xe/uapi: Restore uapi for access counting

 drivers/gpu/drm/xe/xe_bo.c               | 34 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h               |  3 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 46 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ++++++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 16 ++++++---
 drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
 drivers/gpu/drm/xe/xe_pt.c               |  4 +++
 include/uapi/drm/xe_drm.h                | 11 ++++++
 9 files changed, 120 insertions(+), 8 deletions(-)

-- 
2.34.1

