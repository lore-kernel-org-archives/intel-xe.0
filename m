Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E893CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 23:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BB110E401;
	Mon, 17 Nov 2025 23:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jhk/E3KC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0910E1DC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 23:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763423010; x=1794959010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JwOGizQpu4+kHCouUeaFq5hi2qp4nfclLAfAJQcPzzA=;
 b=Jhk/E3KCxxTD0izjZeP/OSDarfISSOk9adlOKBnigeg5eO4+OmhaX08y
 k6sGdkIv+WdeM/yQenYLiGXz8LWW5FxYx1cDJ72lqH5Z1OakaFPbLsodm
 KTG7u4a8sSsQcCypZkEet7BSGNnhQEfIm81xIPiMWEso5YFeHxQsHCSJQ
 +tq3Pv32+7WgDCQrIVimOud2fL8X6KxWvAGIaFpanN18KdD4dAk9n/sSQ
 oafuvGJzlwOF8Alzk+gyet7pUR2jyEFk6nnEotrZMjTbfCqPomfwZz9Sb
 bhil+VU9SK9kzKkEkyBD6GEGgK3QoU1eXCFQY5ir2qLEjI4yYZiAxK/ev w==;
X-CSE-ConnectionGUID: t9/BfhPuT+mk9QnbCGKgQw==
X-CSE-MsgGUID: 7I9fM8MvTJGcAJbECkfDJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69302087"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69302087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:29 -0800
X-CSE-ConnectionGUID: cG6z1BI3TdmPIF8b6py9cA==
X-CSE-MsgGUID: vijUkNlLTfCmtC7TExz6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190827322"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Add xe_pci_rebar
Date: Mon, 17 Nov 2025 15:42:44 -0800
Message-ID: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250918-xe-pci-rebar-2-part-2-766b5371fe09
X-Mailer: b4 0.15-dev-50d74
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

The rebar logic is closer to the PCI handling than to VRAM as shown by
commit 45e33f220fd6 ("drm/xe: Move rebar to be done earlier"). Extract
that logic from xe_vram.c to its own file.

First patch is something landing through pci/resource in 6.19 that also
touches xe. There were already some conflicts, we don't need more. Since
changes here are mostly cosmetic/cleanups, postpone them until
pci/resource shows up in drm tree.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Rebase on top of pci/resource
- Rename the resize function
- Link to v1: https://patch.msgid.link/20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com
---
Lucas De Marchi (3):
      FOR-CI: pci changes for drm-tip
      drm/xe: Move rebar to its own file
      drm/xe: Improve rebar log messages

 Documentation/driver-api/pci/pci.rst        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  18 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  24 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c           | 106 +++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h           |  13 ++
 drivers/gpu/drm/xe/xe_vram.c                | 121 -----------
 drivers/gpu/drm/xe/xe_vram.h                |   1 -
 drivers/pci/Makefile                        |   2 +-
 drivers/pci/iov.c                           |  25 +--
 drivers/pci/pci-sysfs.c                     |  19 +-
 drivers/pci/pci.c                           | 145 -------------
 drivers/pci/pci.h                           |  14 +-
 drivers/pci/rebar.c                         | 325 ++++++++++++++++++++++++++++
 drivers/pci/setup-bus.c                     | 126 ++++++++---
 drivers/pci/setup-res.c                     |  78 -------
 include/linux/pci.h                         |  16 +-
 18 files changed, 577 insertions(+), 463 deletions(-)

base-commit: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab
change-id: 20250918-xe-pci-rebar-2-part-2-766b5371fe09

Lucas De Marchi

