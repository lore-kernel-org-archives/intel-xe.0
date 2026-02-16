Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D742E7BDBB
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250E510E046;
	Mon, 16 Feb 2026 13:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEKtlDMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D082D10E046
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771249685; x=1802785685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6il58Bzrwl8/KnuvlbzNXdnH8O4DXzfeKTDCu0sb38=;
 b=gEKtlDMAD/DgBk8aI0MDz0aSgS9s3gqPR0dhtUpmEgm9MHdMPQTfhjE4
 ViqvTynmjsGonxfN/RSL8CbSVrsPacaWI7h0W30Am4axCG7JcIYtFu5S5
 TyGwXlDu85tZ7CtEZ04KQx4ZbDMoDXjd4tnfwM0Qzz8lvG7fJ7caVaehN
 0cs3od0z66QkE9dXJRSOLH5wOikOFwtlRq0cbwcmLklMmgFm8vrhrOf82
 8W9m/rxqOXSGF77fQjerXXORVuyrQ1GQRtwSb3iXEmLUTA7upDENgHeK2
 Ho9oX7AKclKfmcRRgOSbZ26Tlzexk3zvSnfU2ISUq5NKmXbbPg9T1Wzm9 A==;
X-CSE-ConnectionGUID: 9GZbFjjxRWyHeeRQ59UHsw==
X-CSE-MsgGUID: eYI1HJBCRg6tPhGlBdijkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72398333"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72398333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:05 -0800
X-CSE-ConnectionGUID: d8LnPAn3S96U2D7gEvUP9A==
X-CSE-MsgGUID: kV059zMdSSuICWJpjy3I7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218147852"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:01 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v1 0/4] drm/xe/sysctrl: Add System Controller debugfs
Date: Mon, 16 Feb 2026 05:47:57 -0800
Message-ID: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
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

This patch series introduces initial debugfs infrastructure for System Controller
(sysctrl) component.

The patches add necessary debugfs hooks, interfaces for loopback testing and
RAS error injection support for sysctrl.

Key features introduced:
 - debugfs interface for System Controller
 - loopback testing of sysctrl mailbox
 - RAS error injection through debugfs

Anoop Vijay (4):
  drm/xe/sysctrl: Add System Controller support
  drm/xe/sysctrl: Add sysctrl debugfs infrastructure
  drm/xe/sysctrl: Add loopback test debugfs interface
  drm/xe/sysctrl: Add RAS error injection interface

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  90 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  15 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 304 ++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  52 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 384 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  42 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         | 100 +++++
 15 files changed, 1080 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

