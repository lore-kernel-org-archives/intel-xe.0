Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10ECCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11610E665;
	Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUDfzWuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC02410E326
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286182; x=1793822182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=69g007cHKgTZ2OfMDa5ZPq+XqwRHgDEMFme3K23wji4=;
 b=nUDfzWuKsLcyVShWzUPBGVAVpXAW7RIOpK6XcxDpNn8YFohgyBS1LH8n
 RZ5sPrj//TZTj8tQklupoaYLQtUNyHIILYXxylejSi7LFQ743EYW4h7xW
 yeyeQ+o1ET59/S6aF9VhZfvxq+9LMrFXEmJ+UZHoAuoo1Y27AUKvGb6Ih
 NWMkvFvn7qRotP6JHG04dc/Gwc4pjmFDLfJUuaovOLEO6gzUZsJyZVX7J
 EU8ipkzJse4d/JaTUu9w9OUTadq68G/soH2qV0bPbcEoJ+f+h/hq5MUsY
 4eyNjw5QmeGBH2NR+yR8E0GmUF5h0kI0staX5X+VilDYhNdoySN28jNQI A==;
X-CSE-ConnectionGUID: TWxgiHrrQo+awZQHINrCWA==
X-CSE-MsgGUID: QgwzuheLTb25UWoza6TmZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686104"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
X-CSE-ConnectionGUID: lbR7dk4CTEqFU9PsIzoOEA==
X-CSE-MsgGUID: zijf+swvR4GdLqSTVjrLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051122"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 00/12] Context based TLB invalidations
Date: Tue,  4 Nov 2025 11:56:04 -0800
Message-Id: <20251104195616.3339137-1-matthew.brost@intel.com>
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
  drm/xe: Add xe_device_asid_to_vm helper
  drm/xe: Add vm to exec queues association
  drm/xe: Taint TLB invalidation seqno lock with GFP_KERNEL
  drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
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
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 215 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  33 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h  |   1 +
 drivers/gpu/drm/xe/xe_vm.c               |  49 +++++-
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  13 ++
 16 files changed, 337 insertions(+), 52 deletions(-)

-- 
2.34.1

