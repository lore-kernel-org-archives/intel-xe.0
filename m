Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3229CCA470
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 07:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ADC10E924;
	Thu,  9 Oct 2025 07:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhG1GLDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7410E930
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 07:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759993438; x=1791529438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ca87vi1zC27upHdk1jk5VYGwqShoeuToi3SGW8+2RP8=;
 b=XhG1GLDJiDc2BP0sCkVf0jVn0T4ftJDBCPvtsS+kauGWsVIUbYVxX85D
 fx279qYrhzg4URsbCSvtXJ9dxFk4glvjKfZ/Luo+UM7aynB1s5cCUsv6A
 SVtkYzHNfssFBwO8hIOLv1HC150/3RMushbxyqVlfiOUWqQLO3bhz7kyN
 aMY7FmPPAlYv3WbMek+To0jeP8nN4VA5qtvjtVDkXjLDhaGfGTeGx1gN6
 tn9+T7JBVQ94uTW25ydNycrkOkGrI31m7RWwNb1p7ssEADISFv/35eoHp
 9A+ugQCtLyUP39b1rDLVx4U9SSR2+A/9860dDV9SdkuovlRleypwvSFm2 g==;
X-CSE-ConnectionGUID: TrIu7MKiT2eyN+K1wF+zKw==
X-CSE-MsgGUID: X6BfCXA5ReSf3LIOpILO/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66023099"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66023099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 00:03:58 -0700
X-CSE-ConnectionGUID: 8WPM+xVbTX61xeg3cR4wkA==
X-CSE-MsgGUID: BpZH4HArSiinOktbC+YYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="180579968"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2025 00:03:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/2] Wire up reset/postinstall for I2C IRQ
Date: Thu,  9 Oct 2025 12:33:02 +0530
Message-Id: <20251009070304.3210101-1-raag.jadav@intel.com>
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

This series wires up reset/postinstall handles for I2C IRQ so that it
can be routed to SGunit or PUnit when needed.

v2: Integrate DISABLE_MSI_CAP changes (Heikki)

Raag Jadav (2):
  drm/xe/i2c: Introduce xe_i2c_irq_present()
  drm/xe/i2c: Wire up reset/postinstall for I2C IRQ

 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.34.1

