Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0733CF45DE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C4810E44F;
	Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knbXhh1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3128010E2FC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272758; x=1799808758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtlJWhJM0+ykkdVg7wIfA4q0Jzqf94dzrQczYB/TE8c=;
 b=knbXhh1wxiDI8f5JwIJfQyOzi+o2yL0EwJeD9QfGoS3TAI487qT2GdHT
 P6sggOW1fvgFD5XTsib9aUAqZIo/9FarahlzDiaV5weM023BoJfsGRYxq
 vPJ0Qwd/OdIX7P0Lgoij1U+OS24PPbyUcZZV7ahmNZc9QMGRBZ2BTfHkV
 6/gTYHfOOB8EvRvZxuzmNX/QYHj6kKfhidu2AtezafOvDCnfRlUaa/g/g
 69g/aQldmwe7qCldBemdMVBJ9akQG5kX1hAXUrvK+uCKKhZzNjvj+8Zd0
 WVj/v6VazegZctcedYenr2NHx9lcMyEVxO4DNvXowDnqUxO1wmZUEJKed A==;
X-CSE-ConnectionGUID: N+oA5SWFQXuuPAaSDSzRuw==
X-CSE-MsgGUID: vQmeEB6oTrKXXW+2QQx+3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714523"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: ClCcbHS/RJyO2sfvWvE6aA==
X-CSE-MsgGUID: 9enggcY8Qm6teQqoCr8IIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070304"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 00/12] Context based TLB invalidations
Date: Mon, 12 Jan 2026 18:52:20 -0800
Message-Id: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Matthew Brost (12):
  drm/xe: Add normalize_invalidation_range
  drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
  drm/xe: Add has_ctx_tlb_inval to device info
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
 drivers/gpu/drm/xe/xe_vm.c               |  64 +++++-
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  16 ++
 15 files changed, 375 insertions(+), 54 deletions(-)

-- 
2.34.1

