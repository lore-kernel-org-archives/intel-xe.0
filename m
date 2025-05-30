Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77826C5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 14:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6410E7EA;
	Fri, 30 May 2025 14:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfUPmghU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F1D10E7EA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748614670; x=1780150670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhnVt0QnfEI5gIUVP3wWJDi899FVeshy3p4Ui1JgNmA=;
 b=cfUPmghUj8zobHkiS3OWIaew+hWPZrgBbMxX0s9TAV5LU0bGrtJtt2cg
 Xr3YmbEZiUHx5yqPIQrXRNgf76gg9OgWwdBTbqjrbO85PWcoOPsVM0Waq
 xSUMQj3SDJ9d++VCu5J1wV0WuFvjW2N6arsJTtIbO2X7TMbiVfEXdVJdr
 Hp1BLyWFnyk6Zo2ACViWhg88zZAyX6QXa8DJ8JWClyR99yCHJPY3dVRCp
 KZ2DJYNoyzXhOpzHHUUEVYBQbOFQ7Py5ZlphPawmWR9py8A+YjMDXjKD9
 SZyfDBuoyEph9UdE1hzZcBLvhJk3IU8C638YAIJEqU91JCVut2NoQjw1Z g==;
X-CSE-ConnectionGUID: 3bKSA2RrSCuj84P+8T2Ezg==
X-CSE-MsgGUID: KBOzAx8CQW21fFpyX2VF6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53339233"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="53339233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:17:49 -0700
X-CSE-ConnectionGUID: 6uoBg92/RW+QSNuKEY3qAg==
X-CSE-MsgGUID: fQMZyfYTQym9V3XRiV1JZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144222531"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 07:17:45 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm/xe: i2c support
Date: Fri, 30 May 2025 17:17:42 +0300
Message-ID: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
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

Some of the future "data center GPUs" will provide access to the
on-board Synopsys DesignWare I2C host adapter. The i2c is used to
connect various microcontrollers. The initially supported
microcontroller unit is called Add-In Management Controller (AMC).

Thanks,

Heikki Krogerus (2):
  i2c: designware: Add quirk for Intel Xe
  drm/xe: Support for I2C attached MCUs

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  16 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/xe_device.c              |   3 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_i2c.c                 | 270 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  60 +++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 9 files changed, 369 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2

