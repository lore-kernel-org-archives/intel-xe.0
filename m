Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0161FC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9AD10E290;
	Tue,  1 Jul 2025 12:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5takPFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9538610E290
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751372579; x=1782908579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pk8XTvC6m8aWy9SCNK/idClWZ2ydB+F9rftUq3vUTac=;
 b=k5takPFdbqVW63TY6sMhJEEFSUTqXBEMDVh9GmA3/g27kUO7LZ3HKcF+
 ltzSiJxpxn5/gJlKZWWObOiBbHT64yuzMYbykfweHSWtS9SAVEOaqJ93o
 cOailg2AwDuJzOZmX8iy7WgbBofsXikf7uC4a8L6X7uMQDCWCY/f2NQAU
 YiiLKXkA9tiEqJv2dVGGlunKJY9bTpTyK7iyuivyP9tKMw4fK/CtBaZNQ
 E/Z6mY4t3aefKKiV06ldd4OiYxntEMbkiJxX8GtsSfTUWk4ZVOQsWVyBS
 QgZXQjMTIFlohLkjh/rB/TlbVEdqgVe1C1pS0YL4Ibf9n5uBSFcsZ9vnl w==;
X-CSE-ConnectionGUID: wF6lPTlpSQ6kCByliNVkmQ==
X-CSE-MsgGUID: iSzvBv/kTJ2QwH/0vLJAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196699"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71196699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:22:58 -0700
X-CSE-ConnectionGUID: KYIYoOxQQrq+i7lF1qP9xg==
X-CSE-MsgGUID: AZplPiDWRiK6z4C6CNyR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153157359"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:22:53 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] drm/xe: i2c support
Date: Tue,  1 Jul 2025 15:22:47 +0300
Message-ID: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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
2.47.2

