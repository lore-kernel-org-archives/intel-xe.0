Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF0CD5BAB
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 19:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665110E304;
	Tue, 19 May 2026 19:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWEm6X/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DCB10E304
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779219219; x=1810755219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vH09DgAnz8D782b/D1itSgSIrOt3TFpbbJdZbBFUhu8=;
 b=mWEm6X/gk1G/rtCiJ2Qb9xMk31OgDe+BQ8tzCtWiyFqoOtlQhaweekTq
 VJy4+uQDbyXEfAdQw+I+wqYqmBcps2Efds67RFKJUIpYwc0Vg5Av2ta4b
 u58JBqYO9IRvI+Ef6cHsXMjzrLDR06s4nUbQF4bgm38pc8qiNISfAfj6m
 dC2fkfP6LwBqKYzlu1bU5m3wIiTm1I6Ei5SPgHnTd13jt/YUsVRvxZEVO
 GqqdRN/s9xnzTCQquumEIk+A+qPjNZjjOozRVfNB4RH9uGWakv4fgWdDA
 8fvsSRnv3t/snAsUf/zwghoa0mNhlx2AHPrIPCkiguYvu2sbxWBjEwAQS Q==;
X-CSE-ConnectionGUID: 1HbdRDztQVCpBVCWC6ckxQ==
X-CSE-MsgGUID: gkcC8EyPRgCkgucG6s4yuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91214946"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91214946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:39 -0700
X-CSE-ConnectionGUID: 2vjG4Sz+TfWX1qzLmW1HkQ==
X-CSE-MsgGUID: r/Je6I/MTkyBFCqLf3rRQw==
X-ExtLoop1: 1
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v2 0/4] drm/xe/rtp: WA table context testing
Date: Tue, 19 May 2026 12:32:12 -0700
Message-ID: <20260519193216.546048-6-violet.monti@intel.com>
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
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c |  89 +++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        | 126 +++++++-----------
 drivers/gpu/drm/xe/xe_hw_engine.c             |  14 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   7 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  31 ++---
 drivers/gpu/drm/xe/xe_rtp.h                   |  16 ++-
 drivers/gpu/drm/xe/xe_rtp_types.h             |  10 ++
 drivers/gpu/drm/xe/xe_tuning.c                |  45 +++----
 drivers/gpu/drm/xe/xe_wa.c                    |  92 +++++++------
 drivers/gpu/drm/xe/xe_wa.h                    |   7 +
 11 files changed, 266 insertions(+), 172 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c

-- 
2.43.0

