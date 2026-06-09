Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF0CD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92C10E209;
	Tue,  9 Jun 2026 20:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UftHajTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5293610E209
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036268; x=1812572268;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=8hE+HxqiUxsI6vMyNrr8BGZbNkQBzHmoKvLHe/izxCM=;
 b=UftHajTu4CBTa5QBVilwARWAY7tzekDxKGuwBU0mIBySn+xPON/DH18D
 XACJ4SaBQSf3tfoKtLTssSJuiNTEdfIxNf0UIaqPa7iDXSTUCLeX06Cih
 L7S5yRLFTTBbDdPWdeEUQ9FdLHekV4Vq5EfxBzZ+gEkUm4ZX9TTkyjZy6
 prm7aIY7G+20wfG2JB+gz/TnDfNTx0MI9SwwDwh8ZwXlECzNxKkNP4avq
 TFEHvRtZPIFdWsWkaQgsaYaoFiZjXEVqg4f8ql8pMr9rTzAsiT5CrqRAe
 dPq+HsB+VDSZcceeQgE4De5XX0mnLpsAYg63wtEIsxe/OuaQ0nlYjIH1I Q==;
X-CSE-ConnectionGUID: ws+OxaQ5QjOOZ5ovCt6L2w==
X-CSE-MsgGUID: Q1bvs0t2TtGjk1Gt8XPc1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383291"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383291"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:47 -0700
X-CSE-ConnectionGUID: 4qs0pxvzToCDiYYJYGwfqg==
X-CSE-MsgGUID: 7lq/4HHvQBqIZwLhVLdXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027517"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:48 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/9] drm/xe: Probe info outside of xe_info_init() and
 xe_info_init_early()
Date: Tue, 09 Jun 2026 17:17:32 -0300
Message-Id: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TjA1i74SHcrW2ouKQgji35OOM
 zBTIWMizLCyCglfyhR8h3FgYJ/D38jp6gxSSCOM0Lwgjymc3XsXuJqcFnrWi0UFvYkJHZX/t+2
 tfcCucp9fAAAA
X-Change-ID: 20260604-xe-probe-info-35f404748ce3
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Functions xe_info_init() and xe_info_init_early() are meant to
initialize fields of xe->info, but they also probe the hardware as
part of the process.  This mixed responsibilities issue makes kunit
testing need to rely on static stubbing in order to initialize the
fake device info.

To make the design cleaner, let's do the necessary refactors so that
those functions don't try to poke the hardware and receive and info
that needs to be probed as parameters instead.  The end result is that
functions xe_info_init() and xe_info_init_early() become better
reusable and we have a cleaner tests/xe_pci.c.

This will also be relevant for an upcoming series that is likely to
attempt to do fake device initialization outside of tests/xe_pci.c.
Nevertheless, even without it the refactor is arguably good in itself,
as observed by the end result of tests/xe_pci.c.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (9):
      drm/xe: Add framework for info probing
      drm/xe/step: Pass xe_step_info to xe_step_*_get() functions
      drm/xe: Add devid and revid to xe_probed_info
      drm/xe/step: Make xe_step_platform_get() independent from xe->info
      drm/xe: Add platform-level step info to xe_probed_info
      drm/xe/tests: Set non-GMDID graphics step in xe_pci_fake_device_init()
      drm/xe: Add graphics/media IPs and their step info to xe_probed_info
      drm/xe: Don't initialize tile_count in xe_info_init_early()
      drm/xe: Add tile_count to xe_probed_info

 drivers/gpu/drm/xe/tests/xe_pci.c     |  53 +++++------
 drivers/gpu/drm/xe/tests/xe_wa_test.c |   3 -
 drivers/gpu/drm/xe/xe_pci.c           | 160 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_step.c          |  38 ++++----
 drivers/gpu/drm/xe/xe_step.h          |   8 +-
 5 files changed, 164 insertions(+), 98 deletions(-)
---
base-commit: 3806de1666bcca0525d737e3849c602cbe98fb1a
change-id: 20260604-xe-probe-info-35f404748ce3

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

