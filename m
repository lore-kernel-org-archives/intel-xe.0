Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42247CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F290510E7CC;
	Wed, 24 Sep 2025 20:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8ljh60S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F58710E7CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744544; x=1790280544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bWC5BWBtljf47ZnM007ns9ostHn7PhUnFI8lFIOfqLw=;
 b=R8ljh60SIQUOmmke5dXAmhOWZgYxF4WIZP969huteGXwHtovBTNWTUoo
 5r/j8FVGS4ExcLNNAjyCI7Bp9Ek2iIA31N2jK8eF1eqcW55idwMqR6ck7
 1+jAdMzhKw0IHz0MRb/0bEe6lnJerYkzW3kQBGImEdAnIo8QDRaKHvZTj
 jTE5r03fKKoQq1f4xug3d6QH3Xb6ih7ZDpxZzaGIIunxMfJLt+lXLSlJV
 3enUeayEshnqVh14EZgLaQql4oWXoOqUXi63FfGokkGdCKHjKl6LBUxnb
 hxvvnMBiu3L+lY7UZc6c2u50EwiweFY4Ouvu1qb65+YrKGCRcFVVN3byJ Q==;
X-CSE-ConnectionGUID: ZtbX7dIISJitDAsjYn4Y8Q==
X-CSE-MsgGUID: RukbglUHQTa2u7ZVG+rzJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86498792"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="86498792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:09:04 -0700
X-CSE-ConnectionGUID: yMAskveRSPC9lc21D6Bg+w==
X-CSE-MsgGUID: 5mXRlYR/QbWCh3WDQXjIiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="182402406"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2025 13:09:02 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/2] Wire up reset/postinstall for I2C IRQ
Date: Thu, 25 Sep 2025 01:38:33 +0530
Message-Id: <20250924200835.3143173-1-raag.jadav@intel.com>
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

This series wires up reset/postinstall handles for I2C IRQ so that they
can be routed to SGunit or PUnit when needed.

Raag Jadav (2):
  drm/xe/i2c: Introduce xe_i2c_irq_present()
  drm/xe/i2c: Wire up reset/postinstall for I2C IRQ

 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_i2c.c           | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 4 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.34.1

