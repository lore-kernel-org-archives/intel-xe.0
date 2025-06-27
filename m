Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B86C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014810E323;
	Fri, 27 Jun 2025 13:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kS5mG/ZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D636E10E323
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751032400; x=1782568400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hIfCzA9LPCdKztOP9omnMm8C39mc1mYxnlPAo8Dw8k0=;
 b=kS5mG/ZUf2uUkbcxKE3litTMgaCfQfNWYnDLEUOix1nSjxGSkXiBLP0x
 78z0osGMTIAt1AdacUjtQ6i3r77WSaB00IUB4okVLtY4HZLi5IyJ1+cDz
 X4x8x2yMQXpYG3BgUGqB+PtiWLuBXoyaqGUmcnfhLZvM/Zjtowk2gBkH0
 lNwLkrWRZde57yJTO2EdavwvkJ0lwWPu8DUVzNXB7Hx1Gj6FF32a3d2I8
 vIPrBzMmvYKjqWy+P8tzF8nVSbA9bnfdFCG5yc8moDTDTm7RyU2vV2u8x
 i0D/RateMFYNGe+7zYgxVOGuNxPy9jvLVPvpt60AVoX4DopfFgl4yvnCL Q==;
X-CSE-ConnectionGUID: 6XqCmzgiQ2O3Rm/aq1UyPA==
X-CSE-MsgGUID: mLHt8E/tTYOXtA33MYU3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53207617"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53207617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:53:20 -0700
X-CSE-ConnectionGUID: KjP8+POqTkybbQfFTT6QiQ==
X-CSE-MsgGUID: e5NaADACQ72ospIbDiFFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="183708811"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 06:53:16 -0700
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
Subject: [PATCH v5 0/4] drm/xe: i2c support
Date: Fri, 27 Jun 2025 16:53:10 +0300
Message-ID: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
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

Heikki Krogerus (2):
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
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 464 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2

