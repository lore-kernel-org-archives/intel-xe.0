Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED110F995C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5310E6B3;
	Wed,  8 Apr 2026 17:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRj5frNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5817110E6B3
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671003; x=1807207003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zYB2zHXjH+7Nx/d8xzlBvOP5d3dm+E1pUPslws3rqeg=;
 b=mRj5frNxMAJdgyMshl0yHsZm/O96uJ/yahblrPVzgkCaKcCS0J4vJCfP
 bxAeQZ5TN4ZhfHoEYKPOmYxGnKGCXC13UpOsQfiZOf01jMtMXrmpFCmuF
 66kx2GFcYmw/oxy5n497/HGurBSB+loogZJtmjzHb4NuwRQmaGffbn30/
 5UGet6lcJZ42oelbNfI1viHB5sKfuTnV1pppdT/SCpstp6Gt7tpIsr5+q
 rCxYcX/onPTnkFDaUMwTrSUsyYomxcknmxQTOuMEKp71q6ihCsn9EFGxA
 +plG0ISMbMeyJgSGwmz5mRH+QLl+essEKRdfO8VXqVX4Kp1BWJxpZg5O9 Q==;
X-CSE-ConnectionGUID: s2Bwq4W4Ry+LEfnVqUNH4A==
X-CSE-MsgGUID: VWzNWo3FT4aLBY2KHIA02w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76567652"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76567652"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:56:43 -0700
X-CSE-ConnectionGUID: ciLESweyTmyB1zrRK3900g==
X-CSE-MsgGUID: 6+rZGjnkQQyeTg5/nxbkVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233418775"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 10:56:41 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/4] drm/xe: Fix resource leaks in bo init and dma-buf paths
Date: Wed,  8 Apr 2026 17:52:51 +0000
Message-ID: <20260408175255.3402838-1-shuicheng.lin@intel.com>
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

v2: Add comments in patch 3.

Shuicheng Lin (4):
  drm/xe/bo: Fix bo leak on unaligned size validation in
    xe_bo_init_locked()
  drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
  drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
  drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()

 drivers/gpu/drm/xe/xe_bo.c      |  8 ++++++--
 drivers/gpu/drm/xe/xe_dma_buf.c | 23 ++++++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.43.0

