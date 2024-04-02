Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C78CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 21:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CFA112090;
	Tue,  2 Apr 2024 21:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWXNhV1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE373112090
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 21:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712094861; x=1743630861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0DG/KvWG0AUlwZsCSvY/IFbaQ7w2yhv0/TiCsLeREDs=;
 b=EWXNhV1EjnB74XCcz9WMJ8WFHhAOLel2NgkdlAvTTIpS/f8tqhA2WWnL
 RJlsFGnFXBL0oGKNM1A3nW8fwiIiIXFWY4B5ppjr/+NFj/MZh2ZQWx7JM
 Tsu+/AheupWIxEu+iLLguUFmCu7bPasxsjk4ZpHeP4XQ/ouDsb3rPmlvt
 /Vc5q5UARkShJoK71Fr+3wYeZR0UXtLzGxQ4CMfR4P0vUHM4TFKpbQ+Fb
 pF8QWjzJavvd2gem5H6Siz4AQb27abJGXd58GGPP0hHSExr8udkaoobJF
 bwHw+1QKvUTZZbRer2Y5c39CpUnA4QsBJVZOwkzr7PmME58ErTxajOE2A A==;
X-CSE-ConnectionGUID: sqq83oMjSEKkBN1IfVNJqQ==
X-CSE-MsgGUID: ZRBiP+1PTEOxCuSx9qPuhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24754032"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="24754032"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 14:54:14 -0700
X-CSE-ConnectionGUID: YJP/e4h3QL6O4k2OvAXodw==
X-CSE-MsgGUID: N4QXxErLS1WOia7EFC3d9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="49206652"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 14:54:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] Refactor BO flags, batch 2
Date: Tue,  2 Apr 2024 14:54:53 -0700
Message-ID: <20240402215455.1839828-1-lucas.demarchi@intel.com>
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

Follow up to https://lore.kernel.org/intel-xe/20240314052619.2628396-1-lucas.demarchi@intel.com/

This is mainly removing XE_BO_FLAG_VRAM_IF_DGFX, moving the logic to the
initialization. Build-tested only and up to discussion if it is indeed
less error prone than the current approach.

Lucas De Marchi (2):
  drm/xe/tile: Set default memory placement for BOs
  drm/xe: Drop XE_BO_FLAG_VRAM_IF_DGFX()

 drivers/gpu/drm/xe/display/intel_fbdev_fb.c |  1 -
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c  |  1 -
 drivers/gpu/drm/xe/tests/xe_bo.c            | 12 ++++--------
 drivers/gpu/drm/xe/tests/xe_migrate.c       |  3 ---
 drivers/gpu/drm/xe/xe_bo.c                  | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h                  | 11 +++++------
 drivers/gpu/drm/xe/xe_device_types.h        |  9 +++++++++
 drivers/gpu/drm/xe/xe_ggtt.c                |  2 --
 drivers/gpu/drm/xe/xe_guc_pc.c              |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c           |  1 -
 drivers/gpu/drm/xe/xe_lmtt.c                |  1 -
 drivers/gpu/drm/xe/xe_lrc.c                 |  1 -
 drivers/gpu/drm/xe/xe_migrate.c             |  1 -
 drivers/gpu/drm/xe/xe_pt.c                  |  1 -
 drivers/gpu/drm/xe/xe_sa.c                  |  1 -
 drivers/gpu/drm/xe/xe_tile.c                |  6 ++++++
 16 files changed, 34 insertions(+), 30 deletions(-)

-- 
2.43.0

