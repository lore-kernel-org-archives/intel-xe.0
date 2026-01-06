Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CECEFCF6
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 19:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E634210E549;
	Tue,  6 Jan 2026 19:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N00/56mP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5DE10E548
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767726657; x=1799262657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B+vizo1usCki9rWyvyR0B88ZC86e6mwS86TvZsknixY=;
 b=N00/56mPU9eulU4yUB2TJF7ydKZo7Nmv+GW3RG5U1z5n72ShxESNvC7U
 QYB/QKMVH7sHFJMNTdH3i/ewgT55XvRibagoFZAB6VgLV+o2zK74dpC0y
 kIkVzh/TGKplMINh8KEs2OTm3olSZGH8ZNXyXQTTE2h7eWRdRySRftkh2
 xD3QLqXKSJe2fdxQOL9jB31r42l2TNZ8C+BuSFSbAxpvc7PZUNOoZnXfj
 1+ZD97sacKAFzjsCevPSOxkgjY5h0BLYGDaoa3gs5entp+CU8R40C4QVb
 wvp/uWXoKcHd63Svc7ovtK141mOtJ/IZJUDxqpothOT5SB+lCRC0rokeB w==;
X-CSE-ConnectionGUID: JsBQ4aFUQBa5Rg91hDLfSA==
X-CSE-MsgGUID: F9RQYBseRnW/AXV39M7qyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="71671915"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="71671915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:10:56 -0800
X-CSE-ConnectionGUID: 1f5KgIUfTR2gk/m3IjiG/A==
X-CSE-MsgGUID: 2ev5KVTRS9e1XEr1m+1ouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202493297"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:10:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/2] drm/xe: Remove multi-queue KEEP_ACTIVE feature
Date: Tue,  6 Jan 2026 11:10:49 -0800
Message-ID: <20260106191051.2866538-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

There is no must have requirement for this feature from Compute UMD.
Revert it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Niranjana Vishwanathapura (2):
  Revert "drm/xe/multi_queue: Support active group after primary is
    destroyed"
  drm/xe/doc: Remove KEEP_ACTIVE feature

 drivers/gpu/drm/xe/xe_device.c           |  7 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 60 ++----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 --
 include/uapi/drm/xe_drm.h                |  4 --
 5 files changed, 5 insertions(+), 72 deletions(-)

-- 
2.43.0

