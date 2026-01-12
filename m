Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD95ECF45D7
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1C710E1DA;
	Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyPOMwFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5910E1DA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260456; x=1799796456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l+sFPWNhw29d6QAVnYo/BoV6UkU+azHI+6mZ2QAneyM=;
 b=YyPOMwFxsSwZNFXIJf7xTK9HJdGG9obXjs2Ev4jLjahinZ23Xk2Jkb48
 tAPC9+JBDtxEZC71a2QmxR0MPv8v/snE+Or74DSgIWeZ6K4u3HxoLGtQp
 0jgwBx/iD+8y2jzEx1DvHHOHsLUn2HF+hOJpMeBYOj6GXp9CHI/zwAhB4
 uG9LNnfkKXRQEHKUPTc2bWfYb5+Dtrl7/NIWYhMNuDSWJxkxRvc/Kemd3
 a0r+TH3BQSwtQD2630rkVGA41JwNVKWMDs3Kb1M6az3ZeA+vG4VkAo1dw
 r5vIOZC0UsqM5UkBynTLYXM37bf1dWnX3vPZ3MDb151Z+vyhw9O29xSuJ A==;
X-CSE-ConnectionGUID: YkA/582lT1+UJGOH43Hl2w==
X-CSE-MsgGUID: B1I3Bu5nT+2LKqhJ4UmA7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594763"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
X-CSE-ConnectionGUID: 76DrVLE1S3i6iTAwuJEMDw==
X-CSE-MsgGUID: 8VxS0i7TSRWPRBefGPQkrQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 00/11] Context based TLB invalidations
Date: Mon, 12 Jan 2026 15:27:19 -0800
Message-Id: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Add support for context based TLB invalidations.

Matt

Matthew Brost (11):
  drm/xe: Add normalize_invalidation_range
  drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
  drm/xe: Add xe_device_asid_to_vm helper
  drm/xe: Add vm to exec queues association
  drm/xe: Taint TLB invalidation seqno lock with GFP_KERNEL
  drm/xe: Rename send_tlb_inval_ppgtt to send_tlb_inval_asid_ppgtt
  drm/xe: Add send_tlb_inval_ppgtt helper
  drm/xe: Add xe_tlb_inval_idle helper
  drm/xe: Add exec queue active vfunc
  drm/xe: Add context-based invalidation to GuC TLB invalidation backend
  drm/xe: Enable context TLB invalidations for CI

 drivers/gpu/drm/xe/xe_device.c           |  25 +++
 drivers/gpu/drm/xe/xe_device.h           |  11 +-
 drivers/gpu/drm/xe/xe_device_types.h     |   9 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +
 drivers/gpu/drm/xe/xe_execlist.c         |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   6 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 238 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  33 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +
 drivers/gpu/drm/xe/xe_vm.c               |  48 ++++-
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  13 ++
 15 files changed, 356 insertions(+), 54 deletions(-)

-- 
2.34.1

