Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A98FF5139
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A6810E4BA;
	Tue,  7 Apr 2026 20:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZysLIO6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2355E10E4BA
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775593230; x=1807129230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RrEm6pDIbC7/tHQCR6PrxaL6F8ze/D+WTtZozlQXLhU=;
 b=ZysLIO6N8KwqMvAhCKDB2wp9IPgHrsfTci6jVuQaI0c4KIg6yhz4Kn/o
 8qOfiBKfW5etdsA94aO1BFy6wYEQINgLfAyhAJ9EVYK/hvdwJx9/doqht
 yNC1VSKnfGTv9w5QyOysdippROA8NZv4Ztxwv50H7kd+PqhLngpJKKhYQ
 Jgob5juC0V2zfNZVZ5RI/5H/CaIxsGPSYYvxFy8bhPdFw2nJcUoHCTiFt
 cnku2RhelifE4Gl1zN4mtkVntQv3BahPBVnaW4nlCZQ7b+fIV6fTU6Igz
 SIPegX9Uu+JUu+bbzrgKCPdWhumFmBN97F1g8kWp6aW+vjFBg4JG7mHZo A==;
X-CSE-ConnectionGUID: fT2UkigBSLeD37VCg6V7GA==
X-CSE-MsgGUID: 2+DYuBEzR+2iN9q1/FtWtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87268144"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87268144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:20:29 -0700
X-CSE-ConnectionGUID: uX84IdTqQtmnjD3NQZLprg==
X-CSE-MsgGUID: Rr0Y7lUtROWtIRQpLP8E0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233231566"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:20:28 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/4] drm/xe: Fix resource leaks in bo init and dma-buf paths
Date: Tue,  7 Apr 2026 20:15:38 +0000
Message-ID: <20260407201542.3396317-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Fix several resource leaks in the xe driver's buffer object
initialization and dma-buf import paths:

Patches 1-2 fix xe_bo_init_locked() where two early validation error
paths return without freeing a caller-provided bo, violating the
documented contract that bo is freed on failure.

Patch 3 fixes xe_dma_buf_init_obj() where the pre-allocated storage bo
is leaked when drm_gpuvm_resv_object_alloc() fails.

Patch 4 fixes xe_gem_prime_import() where the dma-buf attachment is
leaked when xe_dma_buf_init_obj() fails.

Shuicheng Lin (4):
  drm/xe/bo: Fix bo leak on unaligned size validation in
    xe_bo_init_locked()
  drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
  drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
  drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()

 drivers/gpu/drm/xe/xe_bo.c      |  8 ++++++--
 drivers/gpu/drm/xe/xe_dma_buf.c | 15 ++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.43.0

