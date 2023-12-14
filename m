Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E2AC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4310E2EA;
	Thu, 14 Dec 2023 19:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA610E28D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580424; x=1734116424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xOUoLf61XwNLoaHRcMdJ00ekYKvRWijXvE53pFA72cI=;
 b=B6cjtzinqdpIqtzhTnPo66kGIvIxdpelGQOoXQMM3vfk5d8SpUEbLg1n
 2s6jhecrqiOVQlycFfsL0ibLpxrzRafwTdJs/FnjGBzNjDBaxS7vchoGB
 CRTQYMzxRW7Szkn5sasxosJv5lZTLwLLTODpSCG+K4l/ySHUdqaaAghTw
 PFbehD6l8mE8xuiiV/m/vSc8o6Gj+wFqs9yHl7O2dD4qrDUIVUTip8lV/
 5xG9odFlvy/+E0wbsfbzCSUZr6G+gTuIEK9iiIxw0YndOkuXV4CRIiDTY
 3GCm13fgqiwOoCjhaeUlGdWquL5ImCJVWGV5bifm7/M6crYBcS34IbDlH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006361"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964765"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/10] Introduce VF specific interrupts handler
Date: Thu, 14 Dec 2023 19:59:45 +0100
Message-Id: <20231214185955.1791-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are small differences in handling of the register based
interrupts on the VF driver as some registers are not accessible
to the VF driver. Additionally VFs must support Memory Based
Interrupts.

v2: drop explicit has_memirq flag (Matt)
    drop unnecessary prefixes (Matt)
    allow to dump new LRM command (Matt)
    add support for UC mode (Matt)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>

Michal Wajdeczko (10):
  drm/xe: Add command MI_LOAD_REGISTER_MEM
  drm/xe: Define registers used by memory based irq processing
  drm/xe: Update LRC context layout definitions
  drm/xe: Update definition of GT_INTR_DW
  drm/xe: Define IRQ offsets used by HW engines
  drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode instead WB
  drm/xe/vf: Introduce Memory Based Interrupts Handler
  drm/xe/vf: Update LRC with memory based interrupts data
  drm/xe/vf: Setup memory based interrupts in GuC
  drm/xe/vf: Add VF specific interrupt handler

 drivers/gpu/drm/xe/Makefile                   |   4 +-
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   9 +
 drivers/gpu/drm/xe/xe_bo.h                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device.h                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  12 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  28 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_irq.c                   |  71 +++
 drivers/gpu/drm/xe/xe_lrc.c                   |  38 ++
 drivers/gpu/drm/xe/xe_memirq.c                | 430 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.h                |  26 ++
 drivers/gpu/drm/xe/xe_memirq_types.h          |  37 ++
 18 files changed, 690 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
 create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h

-- 
2.25.1

