Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA5CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 17:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5385110E1BF;
	Tue, 26 May 2026 17:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEKdVjwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85AD10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779816666; x=1811352666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=spuASXwm5Pj0kQ3P+ODstVI45SDf9iieG+3vrNu7KTs=;
 b=gEKdVjwWeWZ/TyQJoa3FyB2Vru98g4inzHtGWsFNZo4WAPnT0E8dFH6U
 17nhPKFp4UK+U4iwAgJEaPNTOGrPlVOcpIypS3fz+y48XLlWE8h02xVyv
 e4pSUkZQq3C1VZz82xlGCrQ/qFM2qolvea6D9EdI7Gv4jnqwUsRuBB7KQ
 unMI2FRkVnDdMHbuHfXHX9VYJJUAWAbnlJNlqgQRxUd0xIy7LLKyz5SvL
 D8zUy9uWfxvWtZ7YsekAKBJB8OO7GGxIuSc+AmjEAypZw4M8CZTYGB6Ht
 kPqOH/32+m0hYNsmPzG2JR/fh7qZTvuhSr1iBKbFl9+qraH09U0CFUaAk Q==;
X-CSE-ConnectionGUID: xgf5qjwGR7yx1jyEhZcCpw==
X-CSE-MsgGUID: bG2QC7RVQ0Kubs4WRupI5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80751038"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80751038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:31:06 -0700
X-CSE-ConnectionGUID: fVIZ6UDwThKe6r5sCao6Xg==
X-CSE-MsgGUID: R/4G9zC8QX6XCcEk111puQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246954101"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:31:06 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v4 0/4] drm/xe/rtp: WA table context testing
Date: Tue, 26 May 2026 10:30:56 -0700
Message-ID: <20260526173056.967215-6-violet.monti@intel.com>
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
Changes in v4:
- Fix conflicts with main branch
- Link to v3: https://lore.kernel.org/intel-xe/20260522185609.2252126-6-violet.monti@intel.com/

Changes in v3:
- Removed unnecessary keywords
- Added gt_tunings[] to test cases
- Reworked tests to more easily identify an error
- Link to v2: https://lore.kernel.org/intel-xe/20260519193216.546048-6-violet.monti@intel.com/

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
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c |  93 +++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        | 147 ++++++++++--------
 drivers/gpu/drm/xe/xe_hw_engine.c             |  14 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   7 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  31 ++--
 drivers/gpu/drm/xe/xe_rtp.h                   |  16 +-
 drivers/gpu/drm/xe/xe_rtp_types.h             |  10 ++
 drivers/gpu/drm/xe/xe_tuning.c                |  46 +++---
 drivers/gpu/drm/xe/xe_tuning.h                |   6 +
 drivers/gpu/drm/xe/xe_wa.c                    |  92 ++++++-----
 drivers/gpu/drm/xe/xe_wa.h                    |   7 +
 12 files changed, 307 insertions(+), 163 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c

-- 
2.43.0

