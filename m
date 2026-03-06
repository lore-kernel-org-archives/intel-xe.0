Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545AF513ED
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 03:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7741910E2F4;
	Fri,  6 Mar 2026 03:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTBKAUxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A5510E2F4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772766020; x=1804302020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bRQUn3z7QGhSQCw1C3rZMqjGJtWAitupRZ+3P4UuifI=;
 b=HTBKAUxrB8R5V9FxgFMvqIERvg/2X8Ow8Ztq8ZRs77QU901ub+AFod3N
 LadkJHiohTWa0CC42P78OW6xQA9w4fcvrwFZAitVfuuYIsx1uuMsCcIm0
 rV5KcloBdi9NpNP47USaXWjFJjM0uXvpTzpkwGf8kxoxyfq2I2boHCT0o
 XjKJ9Q3GIfSPntrCMFKrxPJghIZrX3bnsItBz41VZbkhGpVTYnk1zuCLe
 RmxwOr8c96na/nFIGZSWH2KfmOjK2Ohqt8DsDBmPLzXLezDDhtLon3hO2
 vfbZ+0X3fUpDITJI+5PEkARZUYsp1tLvg0TZfZiURfQCBO5mSANlb7bMj g==;
X-CSE-ConnectionGUID: 9vGUfWazRFi5PiChgb1h9A==
X-CSE-MsgGUID: q6WW5BA1RKKMaWOGqfTpZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73773769"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73773769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 19:00:19 -0800
X-CSE-ConnectionGUID: u/3iJIDLQUebPL8Rpa4qsA==
X-CSE-MsgGUID: wmkPEAKhTgiFBNyXfbh9zA==
X-ExtLoop1: 1
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 19:00:19 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] Fix error path of xe_exec_queue_create_ioctl()
Date: Fri,  6 Mar 2026 03:00:08 +0000
Message-Id: <20260306030010.11041-1-shuicheng.lin@intel.com>
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

Split to 2 patches due to different Fixes tag.

Shuicheng Lin (2):
  drm/xe: Fix missing xe_hw_engine_group_del_exec_queue() in error path
  drm/xe: Fix exec queue unwind on hw engine group add failure

 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

