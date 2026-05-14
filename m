Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D43CD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708310E5F7;
	Thu, 14 May 2026 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHvWOXgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65AA10E5F7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795114; x=1810331114;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=7TEVS3aUHEx/9/XIlT+hs4MIv+FjMnPYn+9GxK3Sp2A=;
 b=dHvWOXgRsK8PvRLpEzEUF8zD7EWyg21Inw7fj5sVtdRWS9H8Ek9gkzWr
 V2jurNjaWsvXHHM7213PLMlYkUGoPWkuNlnEyB4D8oaAvogg4Wn2uiNDJ
 DPFye8doJSGXNcH4XQzVjT7/bimG+epHVbjqoRtJ9WSK/FwcdUz9YzxZ0
 dZF6BTtLK+8JrGz0lrzYjGbaM2rruIucchjjJt/Lt4w7XUVvBfUPkIhVB
 Oi+9TKxlmb4IWajNvxPaEV4qWXRQ4/aFflIAVzwRx42NrdL+XeY2KeDMX
 S8lU8lhEakgErbpJPed+izgYP0c/Z1q87Hx2LfXn8Mw3lY5hHcJfAN6Rj w==;
X-CSE-ConnectionGUID: 6pWT01ttSsac93uEStuy3Q==
X-CSE-MsgGUID: lqY+bwVGTnWLgAXTOl4kmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277253"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:13 -0700
X-CSE-ConnectionGUID: yDgjttscSkSI57MFtQWeGg==
X-CSE-MsgGUID: QQe5lmRgQsuWdZxsOGxr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613176"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:11 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/7] Fix MCR inconsistencies in RTP tables
Date: Thu, 14 May 2026 18:44:43 -0300
Message-Id: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MSwrCMBSF4a2UOzaSe/tI48h9iIM0SW1Q25KUo
 JTu3bQgSofnwP/NEKx3NsApm8Hb6IIb+jTyQwa6U/3NMmfSBuJUcURifhrZU3umO6vvrJWi0g0
 q08oCUjN627rX5l2uaXcuTIN/b3zE9f1K1U6KyDgzBfFGalQ5ibPrJ/s46uEJqxTpV5e83teUa
 llL0WAhVGnov16W5QNuGF+96AAAAA==
X-Change-ID: 20260112-rtp-mcr-check-f976cb1adf94
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
X-Mailer: b4 0.15-dev
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

The Xe driver uses struct xe_reg as base type to represent a register
definition, and defines struct xe_reg_mcr as a sort of subtype to
represent multicast replicated (MCR) registers.  It uses this subtyping
to "force" the use of the correct MCR-based API for MMIO operations on
MCR registers.

In regular driver code, usage of those MCR registers usually need some
reasoning about whether the access will need to be steered or a
multicast; and the correct MCR API will be selected.

For RTP tables, on the other hand, that's not the case.  The developer
when defining an action the developer can either select a regular or a
MCR register and the register save/restore logic will make the selection
between regular vs MCR MMIO access depending on the register instance
defined in the RTP action.

That allows some mistakes to go unnoticed: a non-MCR register instance
could be used for an RTP action against a platform where such a register
is actually MCR; and vice-versa.

This series fixes those mistakes.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v3:
- Dropped patch "drm/xe/kunit: Add xe_kunit_helper_is_live_test()",
  which became unnecessary in v2.
- This version is being sent mainly to get fresh CI results before
  applying, just in case any new inconsistencies were introduced in the
  meantime.
- Link to v2: https://patch.msgid.link/20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com

Changes in v2:
- Incorporated review feedback. Please see individual patches for the
  respective changelogs.
- Dropped inclusion of hw_engines in xe_wa test.  We will implement a more
  focused test to check for MCR inconsistencies in the future, which will
  iterate over all applicable RTP tables.
- As a result of the above, dropped MMIO interception patches, as they became
  unnecessary.
- Link to v1: https://patch.msgid.link/20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com

---
Gustavo Sousa (7):
      drm/xe: Define CACHE_MODE_1 as MCR register
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4
      drm/xe: Extract xe_hw_engine_setup_reg_lrc()
      drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
      drm/xe/mcr: Extract reg_in_steering_type_ranges()
      drm/xe/reg_sr: Do sanity check for MCR vs non-MCR

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  4 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 14 ++++++-
 drivers/gpu/drm/xe/xe_gt.c             |  8 ++--
 drivers/gpu/drm/xe/xe_gt_mcr.c         | 67 +++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c      | 15 ++++++-
 drivers/gpu/drm/xe/xe_hw_engine.h      |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.c         |  2 +-
 drivers/gpu/drm/xe/xe_wa.c             |  6 +--
 11 files changed, 186 insertions(+), 40 deletions(-)
---
base-commit: 2edbd77a2045d12d30c95dbb5842b831e3da0035
change-id: 20260112-rtp-mcr-check-f976cb1adf94

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

