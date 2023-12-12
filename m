Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC7C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C410E685;
	Tue, 12 Dec 2023 21:01:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A44C10E685
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414872; x=1733950872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vMVc/V+hw+8fdgT8K1LucWT3L/KH9V2emKtR4vFzzVk=;
 b=HrokkaF15FazuJarG9Kz2RHhf22yYMNtsl10StSIKr8Z8QwxPwo0t+GN
 jkupAeI7Uh2H7YgoCMmi+gsBS5ONOZGefc3mxW/krKblkLDLlZVwNCPPB
 uoKshgxFwgk7540JclNtUdAGC0g7uFuhFSITEvG6C2TGcFc/YbVAmMlCf
 RQhGmeLav0kJ6uwB8jjB5qaQ49tBLXrxvvHcmLN96eviotqJn51xlZUdd
 pvrTG2y9Y4v94Y11ij87+nKQ+fxY5TBeXV6Hrgth6qSmBG6zYq0jcr2Yq
 znb4QE7ZEM7IOSygS/4MOgRx2ojmjAtYyof0wAw0D1gimEPEsVmm8kQ9B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654572"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654572"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417135"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417135"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/10] Introduce VF specific interrupts handler
Date: Tue, 12 Dec 2023 22:00:44 +0100
Message-Id: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>

Michal Wajdeczko (10):
  drm/xe: Add device flag for memory based IRQ support
  drm/xe: Add command MI_LOAD_REGISTER_MEM
  drm/xe: Define registers used by memory based irq processing
  drm/xe: Update LRC context layout definitions
  drm/xe: Update definition of GT_INTR_DW
  drm/xe: Define IRQ offsets used by HW engines
  drm/xe/vf: Introduce Memory Based Interrupts Handler
  drm/xe/vf: Update LRC with memory based interrupts data
  drm/xe/vf: Setup memory based interrupts in GuC
  drm/xe/vf: Add VF specific interrupt handler

 drivers/gpu/drm/xe/Makefile                   |   4 +-
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   9 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device.h                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   7 +
 drivers/gpu/drm/xe/xe_guc.c                   |  12 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  28 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_irq.c                   |  71 +++
 drivers/gpu/drm/xe/xe_lrc.c                   |  24 +
 drivers/gpu/drm/xe/xe_memirq.c                | 429 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.h                |  26 ++
 drivers/gpu/drm/xe/xe_memirq_types.h          |  37 ++
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 17 files changed, 676 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
 create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h

-- 
2.25.1

