Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE94FCB624
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 16:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845C310EDA4;
	Fri,  6 Mar 2026 16:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MK7Cxupc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072410EDA4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772815942; x=1804351942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UWxLeokH4pcBS0o3QSecjR0YFOVOAc3wFkfRiEahMz4=;
 b=MK7Cxupc8/3PO2imCRHwgi0iL1UYaAod/s+UL7Y4NkGJ0thrMB+nGRQs
 qOfRLhV3za5Ts2pQaNJAVm0ejgMaMjZDy/0UUQv57vUog5B72d3ex0Tx6
 qrITAzTzoYfxwOpPwsXxS1VnwP45yGrWsnsckDRLIFfodsiXlZqqODepE
 57L3hNQZHKGYzSVboY7HOFGKvl5MC9M3tHWheVGjf2Th0kppxzHLL5cWU
 gzs7Jj4aF5mdM533XMxGdupI5esP5es2vy+x3BL9thCUdKdOtQTv5k3/c
 H8a0LEmRA7iWNF9CWnnmGc0B3dkqMWFNvtJcXyBOcbEaRuloz7IMs2wct A==;
X-CSE-ConnectionGUID: kGVeNcvDSbqJPC0HNmeI/w==
X-CSE-MsgGUID: uaGCGMAiRCKfxqPLEcBGCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73843743"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73843743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 08:52:14 -0800
X-CSE-ConnectionGUID: 7qUH6z7fSYG/xjab+hSyVA==
X-CSE-MsgGUID: e64BFpSASlS9nERH2hJemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="223753600"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 08:52:13 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 0/2] Fix error path of xe_exec_queue_create_ioctl()
Date: Fri,  6 Mar 2026 16:52:05 +0000
Message-Id: <20260306165207.176758-1-shuicheng.lin@intel.com>
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

v2: update 2nd patch to skip unnecessary del when add failed


Shuicheng Lin (2):
  drm/xe: Fix missing xe_hw_engine_group_del_exec_queue() in error path
  drm/xe: Fix exec queue unwind on hw engine group add failure

 drivers/gpu/drm/xe/xe_exec_queue.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
-- 
2.34.1

