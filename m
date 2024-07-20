Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A517C3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC65110E160;
	Sat, 20 Jul 2024 14:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpZN4rLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E4710E002
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485542; x=1753021542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nxFXvzUhutXgs7POlhzFJB9HTBYbmstVSJ8I3HUXkjI=;
 b=TpZN4rLHZ4V4d1U4C4yFnL3QS7EvB/dfTRIChlws0HOtbn8xXebE+unB
 0hwr9gRgRe2ZqO20gH+RD5Zfna7OZKqzx1Abm+mcRoI7xkTAv4vptxYzd
 rCI28jkfTcpfrzMPuksgbph7dDX+EyU825wm7A7HyXin4cG9uCHSwFvFe
 o1J53dGWiMeM1N4GZdvSSEp+tOiuXdKCGvbDPkkr97QeLH5dkxLW8AtXK
 HnyyoljjP1hWb4md2oeZYbBY4fro8Smq7kDg6GBbctFdPMPKZQl8hyWDC
 YDEOXQDbrEDdLmYuAtkXMUGa+GAs1Y3uFWr+cQeL5SsKaBFqHLBbgTToU Q==;
X-CSE-ConnectionGUID: ZF17b6j4RVGEXhNTatr3Gg==
X-CSE-MsgGUID: MMbZAWN2TOOMZnH0jPwFpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624487"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:41 -0700
X-CSE-ConnectionGUID: xarwcVkFRxuuRfyThDm90g==
X-CSE-MsgGUID: 1vMDr2LETruklE7M8Abyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948449"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/7] Convert live tests to parameterized style
Date: Sat, 20 Jul 2024 16:25:21 +0200
Message-Id: <20240720142528.530-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Instead of iterating over available Xe devices within a testcase,
without being able to distinguish potential failures from different
devices on system with many Xe devices, introduce helpers that will
allow to treat each Xe device as a parameter for the testcase.

This will help update testcase logic when some features are not
applicable for certain devices (like non-DGFX or VFs).

  [ ] =================== xe_mocs (1 subtest) ====================
  [ ] ================ xe_live_mocs_kernel_kunit  ================
  [ ] [PASSED] 0000:4d:00.0
  [ ] [SKIPPED] 0000:4d:00.1
  [ ] ============ [PASSED] xe_live_mocs_kernel_kunit ============
  [ ] ===================== [PASSED] xe_mocs =====================

v2: https://patchwork.freedesktop.org/series/136163/#rev2
v3: just use cast (Lucas) + simplify kunit_skip() messages

Michal Wajdeczko (7):
  drm/xe: Introduce const cast helper
  drm/xe/tests: Add helpers for use in live tests
  drm/xe/tests: Convert xe_bo live tests
  drm/xe/tests: Convert xe_dma_buf live tests
  drm/xe/tests: Convert xe_migrate live tests
  drm/xe/tests: Convert xe_mocs live tests
  drm/xe/tests: Skip xe_mocs live tests on VF device

 drivers/gpu/drm/xe/tests/xe_bo.c            | 21 ++++++-----
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  8 +++--
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  2 ++
 drivers/gpu/drm/xe/tests/xe_migrate.c       | 19 ++++++----
 drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 ++++++++---
 drivers/gpu/drm/xe/tests/xe_pci.c           | 30 ++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
 drivers/gpu/drm/xe/xe_device.h              |  5 +++
 9 files changed, 125 insertions(+), 21 deletions(-)

-- 
2.43.0

