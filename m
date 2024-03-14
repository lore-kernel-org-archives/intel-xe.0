Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B0DC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890D510F88B;
	Thu, 14 Mar 2024 03:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckB+D5QB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEC010F82F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386627; x=1741922627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L1dkq/9AJf1Oyek1MyBE1urUqGMYXC5DqR+CXebjMok=;
 b=ckB+D5QBlP6XOQh6B9pC1HIG3UDXjMZ//7AGuCmom8Ae1scG+AlJ+qUk
 oSne8o4cnG5SNBbuB6ziTYP+XXcZzLZ3mnGEs/3C15zPXlC36D8poesf2
 0XGb4p+M5/ZJxs84AfT8W8ckrGiWO7btAEPwOTSe3HpUw9pq22uSWfXeH
 zYwi2AdRN6lHDHyG2ayOgzz74LWJzkXZzjSUmV/tCdcz/6rl5Qdt44Cqt
 lJPK/Cw7NDCGL2NrLZdez1E5wreKs2jrydhlfOb788QxzNKDU8VE0avra
 TMxYKXL4yQiNQtgrCxy+QC5Un8h2dn49ueKhqyQE8jW6E3nwDuROxkEIP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8966473"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8966473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12084613"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, airlied@gmail.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/5] Use hmm_range_fault to populate user page
Date: Wed, 13 Mar 2024 23:35:48 -0400
Message-Id: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Oak Zeng (5):
  drm/xe/svm: Remap and provide memmap backing for GPU vram
  drm/xe: Helper to get memory region from tile
  drm/xe: Helper to get dpa from pfn
  drm/xe: Helper to populate a userptr or hmmptr
  drm/xe: Use hmm_range_fault to populate user pages

 drivers/gpu/drm/xe/Makefile          |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |  22 +++
 drivers/gpu/drm/xe/xe_hmm.c          | 213 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h          |  12 ++
 drivers/gpu/drm/xe/xe_mmio.c         |   8 +
 drivers/gpu/drm/xe/xe_svm.h          |  14 ++
 drivers/gpu/drm/xe/xe_svm_devmem.c   |  91 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 105 +------------
 8 files changed, 367 insertions(+), 102 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c

-- 
2.26.3

