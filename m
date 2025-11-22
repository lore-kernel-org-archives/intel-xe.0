Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DD7CF64B1
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF09410E04D;
	Sat, 22 Nov 2025 04:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns21urFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417010E04D
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763787498; x=1795323498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fiKRpfGcZKKV1u5vgmSs2uCDofY5FrxJBb+9HRxU7L0=;
 b=Ns21urFJmPhC2dlATfRE24VQIatW6X/OaAmhtFsg/3hBlrbcjyXObof2
 AOpCohHEIydYLkwmmKIxKoqq9htvc7vNJ4JXxtyqp6y78nQ/qOdcP+L2/
 0IrTQgF+0oPOdE9ngxcFNBwldYpRAd5N3SueCM0NaOn7bc0Tx0Nmtg/dc
 j46N1UBz96CNLyJZNf7PoYv2a0Ng1JtsoIQZmCIHyT0OvBm+2965g7Rwk
 THqyLTIXOzVyeeKYqO21sjbeJI8aOR/ehkdY6KChb8RJVyrUhAyk1v3vO
 xZ/zSB8AalMMxPtcmquFAR5Bk1d5SzqhQMW6O1MF84WFK3/ItNS5jQK2z Q==;
X-CSE-ConnectionGUID: a9aeuZwsRiiYz0rkmE2HVA==
X-CSE-MsgGUID: 6UOz7P+hTKaEqAcJerKblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65921451"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65921451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:17 -0800
X-CSE-ConnectionGUID: Lxb5K4U5TaybyarnGUy9rw==
X-CSE-MsgGUID: 5g8qTGWYR6OrlrA2YBmVTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191976540"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:13 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [RFC 0/5] drm/xe: Add System Controller support for Xe3p dGPU
 platforms
Date: Fri, 21 Nov 2025 20:58:02 -0800
Message-ID: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Anoop Vijay <anoop.c.vijay@intel.com>

This RFC series introduces System Controller (SC) driver support for Intel 
Xe3p dGPU platforms.

The series includes:

1. SoC Remapper Infrastructure (Patches 1-4) - Memory mapping infrastructure 
   for accessing system controller regions and SoC components.

2. System Controller Driver (Patch 5) - Core SC communication using MKHI 
   protocol over a mailbox interface for firmware communication.

Key features:
- Detection and initialization of the SC interface on Xe3p dGPU platforms
- Mailbox communication with SC firmware
- Fragmented message transfer for large command payloads

Note: Patch 5 (SC driver) is not tested on simulation platforms.

This implementation establishes the base for future SC feature
enablement and firmware command handling.

Anoop Vijay (1):
  drm/xe/sc: Add system controller component for Xe3p dGPU platforms

Umesh Nerlige Ramappa (4):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper
  drm/xe/remapper: Reprogram remapper index on PM resume events

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   3 -
 drivers/gpu/drm/xe/regs/xe_sc_regs.h          |  49 +++
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h    |  14 +
 drivers/gpu/drm/xe/xe_device.c                |  10 +
 drivers/gpu/drm/xe/xe_device_types.h          |  17 +
 drivers/gpu/drm/xe/xe_pm.c                    |   5 +
 drivers/gpu/drm/xe/xe_sc.c                    |  89 +++++
 drivers/gpu/drm/xe/xe_sc.h                    |  15 +
 drivers/gpu/drm/xe/xe_sc_mailbox.c            | 374 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sc_mailbox.h            |  61 +++
 drivers/gpu/drm/xe/xe_sc_types.h              |  35 ++
 drivers/gpu/drm/xe/xe_soc_remapper.c          |  54 +++
 drivers/gpu/drm/xe/xe_soc_remapper.h          |  18 +
 drivers/gpu/drm/xe/xe_vsec.c                  |  56 +--
 15 files changed, 720 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sc.c
 create mode 100644 drivers/gpu/drm/xe/xe_sc.h
 create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h

--
2.45.0
