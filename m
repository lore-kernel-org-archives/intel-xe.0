Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA4FE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A69A10E593;
	Mon,  9 Dec 2024 23:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlhOJkeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199110E58B
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 23:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733786881; x=1765322881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lm+FF7LVSoKSkHYAL4sqMGtn/tyJ3xs9sXOSZTF9M4M=;
 b=PlhOJkeQtlwIMwPXGNtzwolqISURJkcqRyepN7E6UjVyEmZO7ae0lD/K
 gXYyUV4MnoJNfHK5N5p59cvgdCJkZdMHViClKgzy1CKx9VmLiQ7Xyj+nn
 sJf2mjwcApGKqmOt7pVVmUXvviirL9D+dX0PwgJekqYNReWCnP2vvgucy
 o72jN7k0SyYxiZoURp4xmCRVbt/sfIO278Do4qgKgaZolIqeJmf6vuBWU
 YYS/7XnH/H6jxSZYWdrefZw8HFUJhH2xkwSgXZYifZTst5BbEcwZF49ci
 7bi16k4CaI10JhfrktrzMq5LYFkGQHejXGMlaDllkwczzbyg4KDVDNyHj A==;
X-CSE-ConnectionGUID: wzm1L4C0S9qIxJ3CzaqhAg==
X-CSE-MsgGUID: svgtoVlgTSKY6DdrujakcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44581850"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44581850"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:01 -0800
X-CSE-ConnectionGUID: LtymWbzlQgid8RQZ0vDXeg==
X-CSE-MsgGUID: gWO1PNXWQz6DxW2nXL7sSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="100268948"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/5] reg_sr/whitelist fixes and refactors
Date: Mon,  9 Dec 2024 15:27:34 -0800
Message-ID: <20241209232739.147417-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

First patch is an important fix that we could eventually trip on (and it
did in this series because it increases the amount of save-restore
registers).

Stop writing the unused NONPRIV registers and use the HWE save-restore
so it doesn't need a separate mmio application and handling for GuC.

v2:
  - Fix "Fixes" trailer in first commit
  - Replace xe_gt_dbg() with a previous patch by Michal Wajdeczko
  - Replace patch that was making all registers to be written with one
    that make sure that non-used slots are not written
  - Simplify last patch now that unused slots are not written

Lucas De Marchi (4):
  drm/xe/reg_sr: Remove register pool
  drm/xe/reg_sr: Convert whitelist to gt logging
  drm/xe/reg_sr: Stop setting all whitelist slots
  drm/xe: Apply whitelist to engine save-restore

Michal Wajdeczko (1):
  drm/xe: Introduce xe_gt_dbg_printer()

 drivers/gpu/drm/xe/xe_gt.c            |  4 +-
 drivers/gpu/drm/xe/xe_gt_printk.h     | 31 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ---
 drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
 drivers/gpu/drm/xe/xe_reg_sr.c        | 84 ++-------------------------
 drivers/gpu/drm/xe/xe_reg_sr_types.h  |  6 --
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 37 ++++++++++++
 7 files changed, 75 insertions(+), 95 deletions(-)

-- 
2.47.0

