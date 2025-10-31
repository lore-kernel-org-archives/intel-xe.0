Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2DECCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C50F10EBF9;
	Fri, 31 Oct 2025 16:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFnLNMa2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D047D10EBF5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929703; x=1793465703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eQd4QsYXsazbq9mDIzCbGA4JWInsikK02lVUgN+piLQ=;
 b=eFnLNMa2VZ1d97Mbo1Cy7Eo5aeBP8HvSnbfcXz5BPfKySnTgxLInXfRp
 r0YTeT5QVJg2QnL1Drhahp8fs+If8eFT9Jp2kLd/L7mk7BK/lH58mW08W
 qYx4rOoJrXuBr0zC9zviY7YpZyxDMRGaMQT2zr0LWFM85aMDK5RiH8rgM
 Pu1H3Z411eiFJwLedbpdE8PyFrbEoEraETE3P30ZgDS2RxhC0xfomJiQQ
 KoUfLwNwOoDUI1TZZiqJF3DOaFrU17WUOK6kvoqiZk7OPMW6b/pN4yYpu
 dXs8HpgBVlKgjwQ7xucECa0Nu+4EWKubeOkVQm/8fqf63D+5DkQ7/kGkF w==;
X-CSE-ConnectionGUID: GeujrX/hQsqMY6GbjQ6SiA==
X-CSE-MsgGUID: ZXuDgfvmRCOb3gsIoTFLHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67933047"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67933047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:02 -0700
X-CSE-ConnectionGUID: Y3fxwT6oTbC429DGTFAbBg==
X-CSE-MsgGUID: cc5+aGNxTO29QYS+shR/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186734395"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v4 0/7] Pagefault refactor
Date: Fri, 31 Oct 2025 09:54:09 -0700
Message-Id: <20251031165416.2871503-1-matthew.brost@intel.com>
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

We likely need multiple page fault producers feeding into a common
consumer backend. Additionally, our current page fault work queue
design—being per-GT rather than per-device—makes little sense. Clean up
pagefault handling with clear layers.

Matt

Matthew Brost (7):
  drm/xe: Stub out new pagefault layer
  drm/xe: Implement xe_pagefault_init
  drm/xe: Implement xe_pagefault_reset
  drm/xe: Implement xe_pagefault_handler
  drm/xe: Implement xe_pagefault_queue_work
  drm/xe: Add xe_guc_pagefault layer
  drm/xe: Remove unused GT page fault code

 drivers/gpu/drm/xe/Makefile             |   3 +-
 drivers/gpu/drm/xe/xe_device.c          |   5 +
 drivers/gpu/drm/xe/xe_device_types.h    |  11 +
 drivers/gpu/drm/xe/xe_gt.c              |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c    | 679 ------------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h    |  19 -
 drivers/gpu/drm/xe/xe_gt_types.h        |  65 ---
 drivers/gpu/drm/xe/xe_guc_ct.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  95 ++++
 drivers/gpu/drm/xe/xe_guc_pagefault.h   |  15 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 440 +++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h       |  19 +
 drivers/gpu/drm/xe/xe_pagefault_types.h | 136 +++++
 drivers/gpu/drm/xe/xe_svm.c             |   3 +-
 drivers/gpu/drm/xe/xe_vm.c              |   1 -
 15 files changed, 727 insertions(+), 778 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h

-- 
2.34.1

