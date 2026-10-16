Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D47CCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB262112602;
	Fri, 16 Oct 2026 07:18:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA61112602
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135122; x=1823671122;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3SBRsQRymmTuEleYBHVnRBUNxpQ9eB2AivP/qD/nHb8=;
 b=HLNO5ZYGGULDZ56t31PQ9+7HhvpO7/+jkJYmcV5wrQ3iRIq/sIjcjw8B
 0g+uwQ3rFgwPw7MCntiV07u9xoH1NktiCvuz562p8/sey6IXvr5iYll23
 AA2vU/6aMmwoIJBPeyKT9FYe3Xx67gkxtAShCdhXBeqx+QvydO2cUkdzy
 v9WWDVaa7f0rMtO12Egp7yAwxo4i+WNy05o6Mv5u8R5WOdm+EpQZEqRpy
 xP2MVFACQ18a7RCS9GNSHqhGJ6YQD0wBXBwILsXTfnzAzaQ5KB4Mdv9K3
 xenUGsCJU502bZBdQDvW8mVgkxbZ4+jUcIahdl6eLGYVU/7uYmJPIzEZw Q==;
X-CSE-ConnectionGUID: o9DSxRyNSZ2+kFVCZ+hTPA==
X-CSE-MsgGUID: gvA/JzYqRIugVhWz/jyaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813626"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:41 -0700
X-CSE-ConnectionGUID: v29mQa50SHCLY1KBRpuHnA==
X-CSE-MsgGUID: kFyEpYwJRcuODMe9kDEGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787234"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:40 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only 00/18] [CI 00/18] drm/xe: Isolate permanently wedged devices
Date: Fri, 16 Oct 2026 12:48:10 +0530
Message-ID: <20261016071832.222574-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

DO NOT REVIEW

Arvind Yadav (17):
  drm/xe/irq: Always free requested IRQs on uninstall
  drm/xe: Separate AER reset state from device wedging
  drm/xe: Protect device I/O with DRM device SRCU
  drm/xe: Keep software waits outside the device I/O gate
  drm/xe: Drop queued page faults when device I/O is blocked
  drm/xe: Stop VM work when device I/O is blocked
  drm/xe/ggtt: Skip GGTT updates on a wedged device
  drm/xe: Skip VM close hardware access when device I/O is blocked
  drm/xe: Send wedged notification from a worker
  drm/xe: Reuse one dummy page per BO after wedge
  drm/xe: Invalidate existing VRAM mappings on wedge
  drm/xe/irq: Protect IRQ state during wedge isolation
  drm/xe: Isolate a wedged device before notifying userspace
  drm/xe/ttm: Reject VRAM allocations on wedged devices
  drm/xe/guc: Skip timeout recovery on a wedged device
  drm/xe: Skip PM notifier preparation when device I/O is blocked
  drm/xe: Block BO VM access when device I/O is unavailable

Thomas Hellström (1):
  drm/drv: Export drm_dev_srcu_synchronize()

 drivers/gpu/drm/drm_drv.c               |  17 ++-
 drivers/gpu/drm/xe/display/xe_display.c |  39 ++++-
 drivers/gpu/drm/xe/xe_bo.c              |  72 ++++++++-
 drivers/gpu/drm/xe/xe_bo.h              |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h        |   4 +
 drivers/gpu/drm/xe/xe_device.c          | 187 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h          |  41 ++++++
 drivers/gpu/drm/xe/xe_device_types.h    |  25 ++++
 drivers/gpu/drm/xe/xe_ggtt.c            |  26 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c          |  24 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c          |  10 +-
 drivers/gpu/drm/xe/xe_guc_rc.c          |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  22 ++-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   |  36 +++--
 drivers/gpu/drm/xe/xe_irq.c             |  29 +++-
 drivers/gpu/drm/xe/xe_pagefault.c       |  15 +-
 drivers/gpu/drm/xe/xe_pci.c             |  51 ++++++-
 drivers/gpu/drm/xe/xe_pci_error.c       |  25 ++--
 drivers/gpu/drm/xe/xe_pm.c              |  12 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c             |  26 +++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c    |   4 +
 drivers/gpu/drm/xe/xe_vm.c              |  21 +--
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  12 +-
 include/drm/drm_drv.h                   |   1 +
 25 files changed, 593 insertions(+), 113 deletions(-)

-- 
2.43.0

