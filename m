Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440A1EE0205
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 15:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EBE10E90B;
	Tue, 30 Dec 2025 15:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6SXgAtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DAE10E90B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767107870; x=1798643870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FqX0t8trcSAm4itKshdiyzCE0Tnq50tmcWuYXpJ6gm8=;
 b=b6SXgAtY/6S6qIArF+o+UKPd/K3zVQO5PI1EsFomLZbv4sIp+XRhI8ST
 XLOmwVoVp2pcnnevmE6v+y8oQJ1k4PrwWdk/ijr9kKBDcTQH1jJg9s5vB
 HHq5PiRZ7BqYSVcLM2+vMxYkDUrfzW7RzKhtHnl1Ag0YY2wp6LOTHcLmM
 aBih43amTrVHPAE608fLvuey8S9xrY6nctX8BimuNiFUP+TS+sWxybj48
 qeDo5o1Px7sOOsaF2m5EqZ6yBlu1NpAbSb7QdMcjt4PPljj4No4HhGXnf
 4PhKzrLbmoynHX1MMl7PMpHdi7kZq3ka4loQDHJ8ZK+tIvOXyY6tZNIx9 w==;
X-CSE-ConnectionGUID: ZyCpwf1XQb2KZ/sJ18dlgA==
X-CSE-MsgGUID: HYxkHiTGRWKy4t1GM1XaDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68586969"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68586969"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 07:17:49 -0800
X-CSE-ConnectionGUID: 4w0VkeNfQ3GSkrQQepEvhA==
X-CSE-MsgGUID: igFM5KnsRpWQ8kByR9g4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="200874622"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 07:17:46 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v1 0/1] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Tue, 30 Dec 2025 07:17:22 -0800
Message-ID: <20251230151722.293657-3-anoop.c.vijay@intel.com>
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

This patch introduces System Controller (sysctrl) component for Intel Xe3p dGPU platforms.

This component provides the foundational infrastructure for communication
with the System Controller firmware using MKHI protocol over a mailbox interface.

Key features introduced:
- Detection and initialization of System Controller interface on Xe3p dGPU platforms
- Mailbox communication with System Controller firmware
- Fragmented message transfer for large command payloads

This implementation establishes the base for future System Controller feature
enablement and firmware command handling.

Anoop Vijay (1):
  drm/xe/sysctrl: Add system controller component for Xe3p dGPU
    platforms

 drivers/gpu/drm/xe/Makefile               |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
 drivers/gpu/drm/xe/xe_device.c            |   5 +
 drivers/gpu/drm/xe/xe_device_types.h      |   6 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c           |  64 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h           |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 438 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  61 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h     |  25 ++
 11 files changed, 661 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

