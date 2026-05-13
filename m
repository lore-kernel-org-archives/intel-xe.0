Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73617CD4F25
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3209310F095;
	Wed, 13 May 2026 21:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sgt7OFc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7258F10E09B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778707323; x=1810243323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BZLgRPkc+32t6Cv88p2AhH+4TmdtRIIyBo6ZUxew51w=;
 b=Sgt7OFc4xuA7Bf9iEbjpm+SoTOgdE63esIRwemRxxWwvuYXUdc3XtS7f
 Uh0sWc98W5BjS/mLXfLppuTdEXstMhzmK/DPjs3my66tTTWqvHVicz0O2
 vLcLRhDqm/1+kpJ6BGztYU8sQmfRCzWhrDBWeJpiaH3NslfmUZXOCS++K
 w+W0boclL5Mv+hyOoQHPG4eWmt6p+fqMhsQ5q2bbTpL/FeFS6IP/Le7DC
 LynvjfpPIpieDQMZfkl2gNqewoWUGJxHx8bJbhGAXwEQedagm9n07T7HH
 t3mDoi5VrlA8l667l/f+PAUG3n0jm32OfP3nRYEbX0V8dyA8zwaKeeskv w==;
X-CSE-ConnectionGUID: eQe7VAECTBihFIcTCDRFgg==
X-CSE-MsgGUID: bxTSEhAzRW+208tQ7tbvqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79679039"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79679039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
X-CSE-ConnectionGUID: 6njhaBV+RcG0DZj3lupIQQ==
X-CSE-MsgGUID: QTCcQtMXRfGi8WAUQNUDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276295784"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH 0/4] drm/xe/rtp: WA table context testing
Date: Wed, 13 May 2026 14:21:24 -0700
Message-ID: <20260513212129.691628-6-violet.monti@intel.com>
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

Gustavo Sousa (1):
  drm/xe/rtp: Add struct types for RTP tables

Violet Monti (3):
  drm/xe/rtp: Add GT WAs rule checking
  drm/xe/rtp: Add OOB WAs rule checking
  drm/xe/rtp: Add Device OOB WA checks

 drivers/gpu/drm/xe/tests/Makefile             |   1 +
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 133 ++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h |  35 +++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        | 118 ++++++----------
 drivers/gpu/drm/xe/xe_hw_engine.c             |  14 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   7 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |  31 ++--
 drivers/gpu/drm/xe/xe_rtp.h                   |  16 ++-
 drivers/gpu/drm/xe/xe_rtp_types.h             |  10 ++
 drivers/gpu/drm/xe/xe_tuning.c                |  45 +++---
 drivers/gpu/drm/xe/xe_wa.c                    |  89 ++++++------
 drivers/gpu/drm/xe/xe_wa.h                    |   7 +
 12 files changed, 338 insertions(+), 168 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h

-- 
2.43.0

