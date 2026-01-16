Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D127EC98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9851F10E00E;
	Fri, 16 Jan 2026 22:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7dTbCXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AF410E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601562; x=1800137562;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=i3K/HrPceMIvbMrkG2EqCYp1qTQH1AmRLZfN/596Nck=;
 b=h7dTbCXKCtDBwJIZsFpZFDgfCcekydwGmN96jOFI92qWZYyKIVAmcaZo
 qMEL4f5lNs5VPOWndYhhYWVu/Ttawwf5HDPmXE6foAS4s66/TFf9EHkde
 27pcMaSMdVwWLtFqkodTVx7vrqLUljcKoI7teUUtFbMgQOvCsmvtJfwqk
 aMZPYa+74+u4qMsLU5/xYeX8tmw8NsjeaNpDCud/VKjhVVxiIp3GskrYr
 mFsbOAF3dfJCeaNJCq/6QVgQGbypA0BmQ2Gwh6xyr/CzlqGjRG5oR8XX+
 Y67TCvBITORvrtXybPpYU2/zd/Yw1t76obyFTdbmTtC25TY91gAZsygaw g==;
X-CSE-ConnectionGUID: X5xgA5yHT++AEnoN40HPcw==
X-CSE-MsgGUID: yRTpoyCZQVacetGVMj6s7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123016"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:41 -0800
X-CSE-ConnectionGUID: avhq9iJOTdqLf/lZFP2z4g==
X-CSE-MsgGUID: 57TbLtgJS6GoCAawR1fJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961765"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:40 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 00/12] Fix MCR inconsistencies in RTP tables
Date: Fri, 16 Jan 2026 19:12:08 -0300
Message-Id: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALm3amkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mj3aKSAt3c5CLd5IzU5GzdNEtzs+Qkw8SUNEsTJaCegqLUtMwKsHn
 RsbW1AIuNwy9fAAAA
X-Change-ID: 20260112-rtp-mcr-check-f976cb1adf94
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

This series fixes those mistakes and then goes on to update our KUnit
testing to prevent them from happening again.  It is organized as
follows:

* drm/xe: Define CACHE_MODE_1 as MCR register
* drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
* drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4

    These patches fix the existing mistakes found in our RTP tables,
    which were found by running the Xe Kunit test xe_wa with the patches
    that follow.

drm/xe/kunit: Add xe_kunit_is_live_test()
drm/xe/kunit: Abort test if MMIO operation is attempted
drm/xe/kunit: Allow intercepting MMIO operations

    These patches add a framework that allows Xe Kunit tests to intercept
    MMIO operations or aborts the tests otherwise.  This was
    implemented to allow including hw_engines in we_wa_test.c, since
    FUNC(xe_rtp_cfeg_wmtp_disabled), used by one of the RTP entries,
    uses a MMIO read.

    Further workaround/tuning conditions that do MMIO reads could be
    added in the future, so this allows xe_wa_test.c to intercept them
    without intrusive changes to the code when that happens.

    Note that the implementation is generic enough to allow usage in
    other tests when necessary.

drm/xe: Extract xe_hw_engine_setup_reg_lrc()
drm/xe: Extract xe_hw_engines_setup_runtime_mask()
drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
drm/xe/kunit: Include hw_engines in xe_wa test

    These patches include hw_engines in xe_wa_test.c for greater
    coverage.  The first three patches of this seires, which fix
    existing inconsistent MCR usage, are for entries in RTP tables for
    hw_engines.

drm/xe/mcr: Extract reg_in_steering_type_ranges()
drm/xe/reg_sr: Do sanity check for MCR vs non-MCR

    These final patches add a sanity check in register save/restore
    logic to prevent the mistakes from happening again.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (12):
      drm/xe: Define CACHE_MODE_1 as MCR register
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4
      drm/xe/kunit: Add xe_kunit_is_live_test()
      drm/xe/kunit: Abort test if MMIO operation is attempted
      drm/xe/kunit: Allow intercepting MMIO operations
      drm/xe: Extract xe_hw_engine_setup_reg_lrc()
      drm/xe: Extract xe_hw_engines_setup_runtime_mask()
      drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
      drm/xe/kunit: Include hw_engines in xe_wa test
      drm/xe/mcr: Extract reg_in_steering_type_ranges()
      drm/xe/reg_sr: Do sanity check for MCR vs non-MCR

 drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   4 +-
 drivers/gpu/drm/xe/tests/Makefile            |   2 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c  |  25 ++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h  |   4 +
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.c     |  86 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_mmio.h     |  46 +++++++++++
 drivers/gpu/drm/xe/tests/xe_mmio_intercept.c | 116 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mmio_intercept.h |  26 ++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c       |  71 ++++++++++++++--
 drivers/gpu/drm/xe/tests/xe_wa_test.c        |  63 ++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.c                   |   7 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c               |  64 ++++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h               |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c            |  24 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.h            |   3 +-
 drivers/gpu/drm/xe/xe_mmio.c                 |  13 +++
 drivers/gpu/drm/xe/xe_reg_sr.c               |  36 +++++++++
 drivers/gpu/drm/xe/xe_wa.c                   |   8 +-
 18 files changed, 555 insertions(+), 44 deletions(-)
---
base-commit: 0f3aa82816dce3da347333a317ea112d16e5d237
change-id: 20260112-rtp-mcr-check-f976cb1adf94

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

