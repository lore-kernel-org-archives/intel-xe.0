Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12ACD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A3010F5F5;
	Fri,  8 May 2026 21:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDkJyBxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227ED10E26C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276571; x=1809812571;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=+1bxwEUi5bqZv8975G0VkA5sHKN/lD4HOb738eLBzYg=;
 b=bDkJyBxAXjMk2x38ty8tpFCBO9AlFtwUWr1dA0lZ+ADppD6FpOvd6XGo
 wefDd5ZdFv8faOUO1LuREkjjFJUIm9lSAbcx6HVHINYc01zpxSoKPKV9u
 hfDOtV8GhlwBb5jCowoLQTsfiyV5Oh8ZZShhCjpGJS0XqmWD02tnuObag
 o1pnj3tu55J2Zt7oAErMBddvlRrVnLmu7BxHYXpM1iZYG+fGjmdAEfr62
 ZdFyD/x7s/GpSNglfeZr1C5gNGSC8Od8+OQClxFqJiSnTalGXhVwGxO9y
 J/X7D90k3oCJM6YK3C8BIPcLmyoLWaKLU9F7lHZT64RCt3SwYYiN0knjy A==;
X-CSE-ConnectionGUID: 8WWjAoHwSEi17DsTVrJgpA==
X-CSE-MsgGUID: JCp0KjryS+yjqRTiLEtbNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635983"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:51 -0700
X-CSE-ConnectionGUID: P/czXr4BTLWx+tUNrlmBXQ==
X-CSE-MsgGUID: oIe/LySJT+WKFi5yCEc2bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244226"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/8] Fix MCR inconsistencies in RTP tables
Date: Fri, 08 May 2026 18:42:30 -0300
Message-Id: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrDslSUVJV72HuNBx0gytURKRF
 vHuTYVuuvwfvG+DxFE4wbXYIPIqSaaQw5wKIN+FO6MMucEoUymtDcZlxpEikmd6oLN1Rb3uBmd
 LyJ85spPX4TVtbi9pmeL74Ff9XX9S9SetGhUOpVG9Jd1dTH2TsPDzTNMI7b7vH7tmgJqqAAAA
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
Gustavo Sousa (8):
      drm/xe: Define CACHE_MODE_1 as MCR register
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
      drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4
      drm/xe/kunit: Add xe_kunit_helper_is_live_test()
      drm/xe: Extract xe_hw_engine_setup_reg_lrc()
      drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
      drm/xe/mcr: Extract reg_in_steering_type_ranges()
      drm/xe/reg_sr: Do sanity check for MCR vs non-MCR

 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  4 +-
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 26 +++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c      | 71 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/tests/xe_wa_test.c       | 14 +++++-
 drivers/gpu/drm/xe/xe_gt.c                  |  8 ++--
 drivers/gpu/drm/xe/xe_gt_mcr.c              | 67 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_mcr.h              |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c           | 15 +++++-
 drivers/gpu/drm/xe/xe_hw_engine.h           |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 36 +++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.c              |  2 +-
 drivers/gpu/drm/xe/xe_wa.c                  |  6 +--
 13 files changed, 216 insertions(+), 40 deletions(-)
---
base-commit: 18d2011d95002966c64980ab06f36ee9211d496c
change-id: 20260112-rtp-mcr-check-f976cb1adf94

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

