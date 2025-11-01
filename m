Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F3CCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BB10E058;
	Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LA/X34U0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B89110E058
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958953; x=1793494953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K3VSViTmn8R1II6kimY7kPYg/pyshhfFEKqjy7yvBks=;
 b=LA/X34U0L67jxEgDut9ISj9xVC5TYDeYBmqE6kqIbhm/RunXuS/U+f6j
 Lm9DOypNV7pk4m0qXzgXz/ESEnB6fdPOWMZIWLZt7L4GR6ZwaVYlAgaT9
 xg8Xy7JhFi0D3lE1nZRbQUdsiksRlzZu9BawNA5ZcmkqHj0+AU/6wpHjn
 0FvHXJrJ7xW1NFy7O3DvjGElAQj/HmM5zA0/cGKd1LPDkz7YuLrcXYz4I
 WLQ/Fnez656Nj/+TYOQ34hnXtWxNNzok3uugrYfowqzyksWs9mdMkFLqD
 Bipzg4EEj3AEg3TadDjs+CO9TgMag6p4+z/Xw2HtyyyJ2vjWKnD7WtTWh w==;
X-CSE-ConnectionGUID: bOjOPX4TQteRbzPz2k+GzA==
X-CSE-MsgGUID: VGh1VdWlRUCLZID1BoT2yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575693"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575693"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: Tkmzo2fURwKcqpZ+ZleH0g==
X-CSE-MsgGUID: OctZEM3eQX60EISQnTxrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020158"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 00/12] Context based TLB invalidations 
Date: Fri, 31 Oct 2025 18:02:13 -0700
Message-Id: <20251101010225.3095457-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  38 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h  |   1 +
 drivers/gpu/drm/xe/xe_vm.c               |  49 +++++-
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  13 ++
 16 files changed, 342 insertions(+), 52 deletions(-)

-- 
2.34.1

