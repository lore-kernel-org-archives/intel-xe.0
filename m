Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16426E6781B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 23:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6910E126;
	Mon, 22 Dec 2025 23:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGy787+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA63510E126
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 23:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766445488; x=1797981488;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TDNkWtnRXs5AjngkbG+tzW+7XNjd4oqSagLyy3vCtDo=;
 b=eGy787+sPhirZYKOZ5ryKOXAbzIlcRmtn4D0wu5Cta53UM/NAXtQ8scY
 LZRixEk69GeCDgt5DDUBAz/Dnun0Uzjp20trPXBMwSxg6T8GvWc8jnRCO
 3UZpCvxXDrj5TW23H4gQYHs07qrnImgEeODmp0nQlDZM9eEj9bbJumKSS
 FVAgEICLyLkreRlOe20MNiPiSuZk+uOXr49qLmfkgUAWty9/Om6gcO8o4
 qMd7Wv0iGoiprQE5pA6teGL9IHWwbGN+tWDahGb67QmnJK+CXmGWP4uv2
 Fj4ctR0kTFlEek6uoxZD+TMvl2laIZWzf68MDidevOyuuBnfWldykv8Gc Q==;
X-CSE-ConnectionGUID: UaPYqBn8TpqDg2DzdVUrig==
X-CSE-MsgGUID: LAq24r3QRKSE8jG1qqt8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68184643"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68184643"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 15:18:02 -0800
X-CSE-ConnectionGUID: /ZofXNnXRo24Yese6uV5Rg==
X-CSE-MsgGUID: YnwK+qSMT/e5Xoph5fGfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="199290447"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 15:18:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 0/3] Add SoC remapper support for system controller
Date: Mon, 22 Dec 2025 15:17:56 -0800
Message-ID: <20251222231755.3131809-5-umesh.nerlige.ramappa@intel.com>
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

v3 and v4 with review comments incorporated.
v5: Rebase since patch did not apply for CI run
v6: Review comments from Badal
v7: Review comments from Shuicheng

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper helper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 --
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 14 +++++
 drivers/gpu/drm/xe/xe_device.c                |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h          | 16 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 52 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h          | 13 +++++
 drivers/gpu/drm/xe/xe_vsec.c                  |  6 ++-
 10 files changed, 112 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

-- 
2.43.0

