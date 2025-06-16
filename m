Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0651EC7115A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAA010E28B;
	Mon, 16 Jun 2025 06:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsM84zqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4A210E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055330; x=1781591330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AD0elqTZR5FWd7eNPveL0Gif0o/LCts64EA/nS3WXPo=;
 b=NsM84zqHlvZCMDdFTr4QyWI+PwntjfNyZEVvdsldrcXB/yxgN2u6hJI/
 jh5QhocznV082bL4j82cnb9xQCj4ftKGMKEVC2iTHoxU8N+xRJKfHPZ9x
 wPBCgX5oAT38aQp4GWVLt0sUZnYhSIN7mVro0+0r7rQmfE0ZcFbq8gcP/
 Lsj+iF0ERGNNicuYx2Bc+P2V3XstdRNJn3xbrxhJuCG86R9ma9Pf1XkhB
 qdYwFH4zg1LfCJDB3vBeUUSw5No6cd3ZjHfgU8cyHHr3q/gBKAXjCYVNw
 5WZM0MaMDi9PJB/fleiab33aaXJ6AGuo7HL84OKAHfWAWtWodSV3sdbYl w==;
X-CSE-ConnectionGUID: X4XD3EaoQ9aIO41gLECAgw==
X-CSE-MsgGUID: wnRSsennSSm0XTzwre8BRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51298102"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51298102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:50 -0700
X-CSE-ConnectionGUID: Vl+yGrOKQwGs7hccq5QS4A==
X-CSE-MsgGUID: DgrIy1LSSQ6XVJ7m9+6bdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153257149"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 0/2] Opportunistically skip TLB invalidaion on unbind
Date: Sun, 15 Jun 2025 23:30:22 -0700
Message-Id: <20250616063024.2059829-1-matthew.brost@intel.com>
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

Add xe_vm_has_valid_gpu_mapping helper and Opportunistically skip TLB
invalidation on unbind.

This version has been thoroughly tested, prior versions failed extensive
runs of xe_exec_system_allocator while this version passes.

Matt

Matthew Brost (2):
  drm/xe: Add xe_vm_has_valid_gpu_mapping helper
  drm/xe: Opportunistically skip TLB invalidaion on unbind

 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-----
 drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_svm.c          | 16 ++++++------
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 drivers/gpu/drm/xe/xe_vm.h           | 19 ++++++++++++++
 5 files changed, 62 insertions(+), 21 deletions(-)

-- 
2.34.1

