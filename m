Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249A7D12688
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2B10E700;
	Wed,  3 Dec 2025 00:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVbpRwJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C25C10E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764722886; x=1796258886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szduZLgCkzV/05ceFkMWyRe8oZH/ovOfI/kQfXdHbJs=;
 b=FVbpRwJ8bHH2UzXyp8AVLQK+WrPNyIBYFsqAFtLg04RkxwbvBNy6oo9b
 FcNPxGW6dCfARrkiFgZDhlLt/CBx2A2+dghZWxT6GLFkuNXGQWvzp9iPH
 OU92AMe2Uw2spTqzGPFIJ7QGjpRLQ6k7hcXgScr/hgjs7d4WGkqXADU9u
 FMytDuV9OUIV8NTB4P6JUIJc/Tc2CiZf5BcQO9ur05F7cN4w6dxTEPR2S
 P8pnZRZSiFzRBx9oaFjfyIIFuIAPDRRnMnc8FcGaNmu8wKZweQgN6Uzph
 XoBUAW3M8MJXQ+rnKU1otoihu9WHwR0YkCox29ZR4vDlz+w9TMp9HVkqS A==;
X-CSE-ConnectionGUID: /QBHoqXHQjWd90afdkUZNw==
X-CSE-MsgGUID: a84x7B+mT2u9rwUlLeB0yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65895338"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="65895338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:05 -0800
X-CSE-ConnectionGUID: hWrHBnT9QQe4fehRoDZJ1w==
X-CSE-MsgGUID: jE4vUwCLTB61d/5WnLJVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194340513"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, ashutosh.dixit@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 0/3] Add SoC remapper support for system controller
Date: Tue,  2 Dec 2025 16:48:01 -0800
Message-ID: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
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

Add system controller configuration using SoC remapper for Xe3p

v2:
- s/remapper/soc_remapper/
- return status from init during probe
- reorder patches 1 and 2 from earlier series
- fix copyright year
- retain comment
- s/BITS/MASK/

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 -
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 14 +++++
 drivers/gpu/drm/xe/xe_device.c                |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  8 +++
 drivers/gpu/drm/xe/xe_pci.c                   |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 59 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h          | 15 +++++
 drivers/gpu/drm/xe/xe_vsec.c                  |  4 +-
 10 files changed, 108 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

-- 
2.43.0

