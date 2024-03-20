Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C44C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBD10E7FF;
	Wed, 20 Mar 2024 03:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+SMiHfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A261C10E0A8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710905530; x=1742441530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a2BVWUIrs+dWu/1nHNxrIg1D4tZ5bqX8INyCyilSWV8=;
 b=R+SMiHfBjR5dYGCOtrQasOrqfgR5SRmT9fV1x1vG4ELOkuOACWZvTDlc
 hdXJIFfVZwLZEm+bBJ5ayqcylH8BkeHFptnZvXo+cUCkJdOy3V2bEKcqg
 QzRPCeuJiubqE+4ofOQvuR9t55cO6rL7R551xvNoabwoy13s2LSgeZBqJ
 wCdb5017t8AO9pdJS5C1Grf6OdRvKWgc7Y9oy9U4HmFMz2pggE+bUFgke
 K3GCSoomlkgwqrsal0gBPJRGJnAbUG/b1FFKD7rGwXj2hngzqg8rcMfB3
 iP1xArwbXiIj3tdXw94+GyIfkFFe5MauWbTSmgzcbeOloqkz/jikdObMb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5688802"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5688802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18599082"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:08 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/8] Use hmm_range_fault to populate user page
Date: Tue, 19 Mar 2024 23:44:17 -0400
Message-Id: <20240320034425.1785007-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This is an effort to unify hmmptr (system allocator) and userptr.
A helper xe_hmm_populate_range is created to populate a user
page using hmm_range_fault, instead of using get_user_pages_fast.
This helper is then used to replace some userptr codes.

The same help will be used later for hmmptr.

This is part of the hmmptr (system allocator) codes. Since this
part can be merged separately, send it out for CI and review first.
It will be followed by other hmmptr codes.

Oak Zeng (8):
  drm/xe/svm: Remap and provide memmap backing for GPU vram
  drm/xe/svm: Introduce DRM_XE_SVM kernel config
  drm/xe: Introduce helper to get tile from memory region
  drm/xe: Introduce a helper to get dpa from pfn
  drm/xe/svm: Get xe memory region from page
  drm/xe: Introduce helper to populate userptr
  drm/xe: Introduce a helper to free sg table
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Kconfig           |  21 +++
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.h       |   9 +
 drivers/gpu/drm/xe/xe_device_types.h |   8 +
 drivers/gpu/drm/xe/xe_hmm.c          | 255 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h          |  11 ++
 drivers/gpu/drm/xe/xe_mmio.c         |   6 +
 drivers/gpu/drm/xe/xe_svm.h          |  49 +++++
 drivers/gpu/drm/xe/xe_svm_devmem.c   |  89 ++++++++++
 drivers/gpu/drm/xe/xe_tile.c         |   6 +
 drivers/gpu/drm/xe/xe_vm.c           | 122 ++-----------
 11 files changed, 468 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c

-- 
2.26.3

