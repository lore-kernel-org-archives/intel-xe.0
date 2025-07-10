Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE15C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 07:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761CC10E88D;
	Thu, 10 Jul 2025 07:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6kZC78V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62E010E88D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131980; x=1783667980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sTj8F07ltYz+pOqSRXp3fqHxLiNdJSBXIcxMIWwOzZQ=;
 b=M6kZC78V/HyW/ewuIpsr6Sb7fAblmwGku4hd0QpFxLTd/NGzXyqRRr2C
 ZVsO1uXjjGu/NnPxpddl2ClbE3MT5+n0NS3I41n+BevYqPYr8QoGeX3Tb
 Ie7DhLzav4czUtOkqoa60nJWhAh7UIPR5XIOv+d4waO3DDXEbU3ORqVvV
 ckv2FEuBOwO6+SL9/T0RDXTuQWKVT9Dm9yll5AkOxXgZ13KM4gEXUxEBs
 NLXFRVz66BrqC8swBm8SS8Ic+n3USbU4guaatF6/R/125JEAB11/oaS1Y
 +1zL2CdkjD010ULB/0mLWx9+5yB9ewmNa87p2uw6VkuLa63495+xSh12n A==;
X-CSE-ConnectionGUID: SVgesapJQ5q5EUkreUmXRw==
X-CSE-MsgGUID: tjyvHBNRR4S38bWhkWtrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256668"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54256668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:19:39 -0700
X-CSE-ConnectionGUID: 680oKYe2TZiGAqUL3CWdPQ==
X-CSE-MsgGUID: DfopCRj9Qj6QmkluSWyU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160323923"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:34 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, raag.jadav@intel.com,
 riana.tauro@intel.com, srinivasa.adatrao@intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] drm/xe: i2c support
Date: Thu, 10 Jul 2025 12:46:07 +0530
Message-Id: <20250710071612.2714990-1-raag.jadav@intel.com>
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

Hi,

On behalf of Heikki, since he's on vacation.

Changed since v6:
- Fix SPDX checkpatch warning.

Changed since v5:
- The modification to the dw_i2c_plat_probe() is split into its own
  patch as proposed by Andi.
- I removed completely the comment from the last patch in the series
  ("drm/xe/xe_i2c: Add support for i2c in survivability mode").

Changed since v4:
- Cleanups requested by Andy.
- Casting the PCI power modes to make sparse happy - Raag.
- Limiting the use of this thing to Battlemage again. But I'm not sure
  if this is the correct thing to do.

Changed since v3:
- Cleanups as requested by Rodrigo.
- The licence is now changed, but still need confirmation for it!

Changed since v2:
- Added dependency on regmap when i2c is enabled.

Changed since v1:
- Now rebased on top of drm-tip.
- No longer ignoring errors from xe_i2c_probe().
- Cleanups pointed out by Lucas.

I've also included followup patches from Raag and Riana to this
series.

Original cover letter:

Some of the future GPUs will provide access to the on-board Synopsys
DesignWare I2C host adapter. The i2c is used to connect various
microcontrollers. The initially supported microcontroller unit is
called Add-In Management Controller (AMC).

Thanks,

Heikki Krogerus (3):
  i2c: designware: Use polling by default when there is no irq resource
  i2c: designware: Add quirk for Intel Xe
  drm/xe: Support for I2C attached MCUs

Raag Jadav (1):
  drm/xe/pm: Wire up suspend/resume for I2C controller

Riana Tauro (1):
  drm/xe/xe_i2c: Add support for i2c in survivability mode

 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_i2c.c                 | 329 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  19 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 460 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.34.1

