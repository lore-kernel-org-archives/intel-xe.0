Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A93C98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1CA10E0FB;
	Fri, 16 Jan 2026 22:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBf92bC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9405F10E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601857; x=1800137857;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2QotagKAr/8mq8Cq0FDfsz8UCzAMd1z4KooJwQ2a4tQ=;
 b=XBf92bC1rCsLo8AF4zmOHfsPR71nh1um3uPbXsp09l6nbSzv2bTZF0lu
 DPukts32sGaKoh3yqx2glvFEjN0RubSGeFg7Y99Y1UUh6vqyg1062Dsu9
 JtItAHz1kx2HHkMAZFyDzx3ajS6iMYUpJVN0iCji8DK4UGl4EIyASe0fu
 XcDg+adRO4sePKFspAQMc4n30CrOv8wxCv5f39K1S+GQ7LkCS6pMSj3qS
 zHWedUabSm7B86kmI3WrTZ0I7B0bbmupDB5xE+OwELVIe+PfGtSVwNRth
 lG7I1LNUGmgX8XtBuvGDH/XnL/MjtZvVVpTlxB2r7kJVAJvei9LSQcVOm A==;
X-CSE-ConnectionGUID: Ss/v2Hl3T3+L8ulYxbSX/A==
X-CSE-MsgGUID: zifXi1m4QKWPeZH3TxDZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123339"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123339"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:36 -0800
X-CSE-ConnectionGUID: Lak6agqUSo2XO+9Risjgqw==
X-CSE-MsgGUID: P35+Eb/XRPmjGlATLGQM+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962690"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 00/11] Context based TLB invalidations
Date: Fri, 16 Jan 2026 14:17:20 -0800
Message-Id: <20260116221731.868657-1-matthew.brost@intel.com>
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

v5:
 - Drop HAX patch to enable context based TLB invalidations.

Matt

Matthew Brost (11):
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

 drivers/gpu/drm/xe/xe_device.c           |  25 +++
 drivers/gpu/drm/xe/xe_device.h           |  11 +-
 drivers/gpu/drm/xe/xe_device_types.h     |   9 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +
 drivers/gpu/drm/xe/xe_execlist.c         |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   9 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 238 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  33 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +
 drivers/gpu/drm/xe/xe_vm.c               |  64 +++++-
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  16 ++
 15 files changed, 377 insertions(+), 54 deletions(-)

-- 
2.34.1

