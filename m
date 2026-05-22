Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB1CCD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 18:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1810F65A;
	Fri, 22 May 2026 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOynaplB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FD810E27F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779476184; x=1811012184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HXTt5hklVGz46LwSSXZf8bw/J/Hgllus4Iok9YO/Bf4=;
 b=dOynaplBpWDYjDcIVNU1uMg81VZRMHEetZuXzqTExudL6XrEH+aRT9vG
 TrKFsAOPSNzo7BeuoJ9hqOGm82mAPD0ok2kMuhxnMqFcnYj9er7Zpiqaa
 ymJaBDLaL38lIJEzPrKl9Jip/ibNXiyFV0o73hhRXd1Tne9TW6jr/StkU
 t96h+p0e92RZXCDg1yMGf6JDUZpfuSTlNlaBk6hIntIHAEKz6r+vP50xa
 5dq2OuvoNwUQMvygzFoWEm/d7FUy6eJx63i1SDITTCNcw4lqWKLROqM4b
 FhZvPEQntnUAo/AyIs3XbRuGagAEHpl0YHvhjFBoIO+H2zhkFoOOzYFD0 w==;
X-CSE-ConnectionGUID: R3Pf23eiQgeJ5ktdtW/WYg==
X-CSE-MsgGUID: NFDpQRaWQbGdMJ2+zACXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84028463"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84028463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:23 -0700
X-CSE-ConnectionGUID: L2Fl7i2BQy2fMAFdPIzEOQ==
X-CSE-MsgGUID: SY7P4ciZTkaMDKY/WDWCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246061203"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:22 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v3 0/4] drm/xe/rtp: WA table context testing
Date: Fri, 22 May 2026 11:56:09 -0700
Message-ID: <20260522185609.2252126-6-violet.monti@intel.com>
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

This series adds testing for existing WA lists within
drm/xe/xe_wa.c, which previously were allowed to match
rules for contexts that were not valid at their initialization
time.

These tests function by parsing each target RTP table,
checking for invalid contexts rules determined by an
enumeration of match types, and raises an expectation fail
if an improper match is found

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
Changes in v3:
- Removed unnecessary keywords
- Added gt_tunings[] to test cases
- Reworked tests to more easily identify an error

Changes in v2:
- Cleaned up and refined code logic as per review suggestions.
- Link to v1: https://lore.kernel.org/intel-xe/20260513212129.691628-6-violet.monti@intel.com/

---

Gustavo Sousa (1):
  drm/xe/rtp: Add struct types for RTP tables

Violet Monti (3):
  drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types
  drm/xe/rtp: Ensure oob_was does not evaluate engine type rules
  drm/xe/rtp: Ensure device_oob_was only evaluates correct rules

 drivers/gpu/drm/xe/tests/Makefile             |   1 +
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c |  93 +++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        | 126 +++++++-----------
 drivers/gpu/drm/xe/xe_hw_engine.c             |  14 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   7 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  31 ++---
 drivers/gpu/drm/xe/xe_rtp.h                   |  16 ++-
 drivers/gpu/drm/xe/xe_rtp_types.h             |  10 ++
 drivers/gpu/drm/xe/xe_tuning.c                |  46 +++----
 drivers/gpu/drm/xe/xe_tuning.h                |   6 +
 drivers/gpu/drm/xe/xe_wa.c                    |  92 +++++++------
 drivers/gpu/drm/xe/xe_wa.h                    |   7 +
 12 files changed, 277 insertions(+), 172 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c

-- 
2.43.0

