Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B38BC4345F
	for <intel-xe@archiver.kernel.org>; Sat,  4 May 2024 23:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63AC10F1F2;
	Sat,  4 May 2024 23:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCUpml81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4403F10F1F2
 for <intel-xe@lists.freedesktop.org>; Sat,  4 May 2024 23:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714865708; x=1746401708;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbSKszTXFl7WEoKBL3GqyA0ihgQHo3ZTNnsjBtVK6YQ=;
 b=ZCUpml81IQfWYHc8rIDlJuBR0dwyt0bmRHLtL99jfQ4dgBIZcVrhe+Lk
 CobfryzoxE7oiqJcL0rBgszTW5I+XTWNtgTiKKIcqTIgkmW20Fdzz1Mn4
 aasiOzNkrfYARBaIlDVoTl5DLWnSvqFVPLgnaMoE+Aq+K1vmE1TL8ftqd
 QGttTpw9s8UjEf32JNxSRA1g813C4Kx52XmLVoqfvKcQzCnuSgo6hkvRk
 6fNoeMERfYbP17zEjmoKcf6ksOeNuA2ki7hWb2qypiLyold85E+S+uezz
 aUC3f72bOQV/eZRL3OC5YdCWMqytg3J9Ct10to0Os/JYPcitJt0sRY3sj A==;
X-CSE-ConnectionGUID: pb7E+kj2ShqhpkTDcAROTg==
X-CSE-MsgGUID: 6HTv7qgkSCOjrT6utMDygA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21196777"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; d="scan'208";a="21196777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 16:35:07 -0700
X-CSE-ConnectionGUID: 0dsEQ2RvQEej5qcQ3MobmA==
X-CSE-MsgGUID: bYDqQGpGSjuQ+ttOwKSdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; d="scan'208";a="32606611"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 16:35:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/xe: Add Indirect Ring State support
Date: Sat,  4 May 2024 16:34:57 -0700
Message-ID: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
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

When Indirect Ring State is enabled, the Ring Buffer state and
Batch Buffer state are context save/restored to/form Indirect
Ring State instead of the LRC. It is the recommended mode for
Xe2, hence enable it by default for Xe2 platforms.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: Minor cleanup in LRC handling
  drm/xe: Add Indirect Ring State support
  drm/xe: Dump Indirect Ring State registers
  drm/xe/xe2: Enable Indirect Ring State support for Xe2

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   9 +-
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 +
 drivers/gpu/drm/xe/xe_gt.c               |   6 +-
 drivers/gpu/drm/xe/xe_gt.h               |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h         |   6 +-
 drivers/gpu/drm/xe/xe_guc_ads.c          |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  11 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   4 +
 drivers/gpu/drm/xe/xe_lrc.c              | 187 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |   5 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_pci.c              |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   3 +
 14 files changed, 220 insertions(+), 39 deletions(-)

-- 
2.43.0

