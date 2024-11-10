Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406D7D3C931
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 12:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D213C10E2CD;
	Sun, 10 Nov 2024 12:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N92nUAGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C5010E2CD
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731242018; x=1762778018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=So1TcLdm7sE/O7LohE8GEMEaI7EoPZeZmbD1vM/7yBE=;
 b=N92nUAGdXuUvkasu1+7K8TmtfdYLwAjGQjq5umalrcVahNjQv4v6Eo3F
 p0jBtplQA4bEJ5FqUnVHPta3Yn+Mllqij5GWlbxJ/QmwhgFeMcIOgzr8O
 NHNufjYxdmQjNB6n5L1OYP1sXmKo9OfJY1hrAg02n0l4qJWmQkgTXBWHJ
 gF1al52nbZasNKSVYWh31moWIStPaNmT3nIGh6TT10Iak8VP/988uVvmy
 pT4mjxndVNrh8AaJJcSAZ9GZ0bmjc94lNIlklLrB6H1LKSRVhRecLVE0e
 i3EqQfilckwfSevN+us4jtr72RLzKHU37SlVp0p31SJ2g/3qauxIK/hFv Q==;
X-CSE-ConnectionGUID: a4OGFyxqR0CsO/rQzh3PWw==
X-CSE-MsgGUID: JOSjZ4Y/QdKob9gJphiKqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31286893"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="31286893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:37 -0800
X-CSE-ConnectionGUID: ZYsI3PlxQnCOT4UdHnEtjQ==
X-CSE-MsgGUID: j2dUDutWRaiW3bk1VJLlew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="123996760"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:35 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v3 0/3] MSI-X support
Date: Sun, 10 Nov 2024 14:33:25 +0200
Message-Id: <20241110123328.202229-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch set introduces MSI-X workflow.
This is a rework of previously published series 135422
(https://patchwork.freedesktop.org/series/135422/).

It includes:
1. Basic MSI-X workflow with GuC-to-host and "default MSI-X"
   interrupt handlers.
2. MSI-X interrupts allocator to allow dynamic resource management.
3. uAPI flag to xe_exec_queue_create_ioctl that allows creating
   an exec queue with its own MSI-X interrupt.


v2: Rebase + fix kernel doc issue
v3: Rebase + fix sriov_basic test failure

Dani Liberman (1):
  drm/xe/uapi: Support requesting unique MSI-X for exec queue

Ilia Levi (2):
  drm/xe: Initial MSI-X support for HW engines
  drm/xe: Manage MSI-X interrupts allocation

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   3 -
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  12 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  59 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 115 ++++++++----
 drivers/gpu/drm/xe/xe_irq_msix.c         | 216 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  22 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  24 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 16 files changed, 438 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

-- 
2.43.2

