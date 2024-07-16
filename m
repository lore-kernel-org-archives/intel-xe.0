Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAEAC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F7010E8E1;
	Tue, 16 Jul 2024 21:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQ02o3HN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0B10E8DF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165996; x=1752701996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jw4GTA2+8wN5y2vTMi5gQV1hbFowYetrIvpo1yo3ysc=;
 b=XQ02o3HNOLs/WDoXtePmWD7Tcs59IO1Cu5njj3ojQziOHrdNpyxZfSrD
 kyIwN4Su+2VRk0sf06Fux3p2NAbElSUDdtAiuS0AAyglBHVMAxwaidgME
 oszhbc47T7fFt0CCOYqIfMxReB9dr42zFgtpGyOofdeas7Hfn8JKT18LX
 9O/JMGg8oHuKL9kv/DgreXgPfX09Vez12uJLL/YWyZmLGjTBhOGQknnjl
 Le/nGWCfeIjVG2itb/H8bJKjV20ywgmk7u8sP5f1vwaE+9X9TM1Da8W84
 nKcNE+c0q5W196BGaXLiGMSJqVw8DgMOsSsU/ZDm55580DAemkuRHVYfE A==;
X-CSE-ConnectionGUID: jaogdstiRWSzQwKlbSiX+A==
X-CSE-MsgGUID: zpeD8r8jTqybMvNLQGq2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063147"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:56 -0700
X-CSE-ConnectionGUID: P227jUw1SR6r7z9LVXKkXg==
X-CSE-MsgGUID: UISbBUrYSoGarCVgL35GYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364349"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/7] Convert live tests to parameterized style
Date: Tue, 16 Jul 2024 23:38:54 +0200
Message-Id: <20240716213901.398-1-michal.wajdeczko@intel.com>
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (7):
  drm/xe: Introduce const cast helper
  drm/xe/tests: Add helpers for use in live tests
  drm/xe/tests: Convert xe_bo live tests
  drm/xe/tests: Convert xe_dma_buf live tests
  drm/xe/tests: Convert xe_migrate live tests
  drm/xe/tests: Convert xe_mocs live tests
  drm/xe/tests: Skip xe_mocs live tests on VF device

 drivers/gpu/drm/xe/tests/xe_bo.c            | 19 ++++---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  9 +++-
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 55 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  3 ++
 drivers/gpu/drm/xe/tests/xe_migrate.c       |  9 +++-
 drivers/gpu/drm/xe/tests/xe_mocs.c          | 21 ++++++--
 drivers/gpu/drm/xe/tests/xe_pci.c           | 30 +++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 +
 drivers/gpu/drm/xe/xe_device.h              |  5 ++
 9 files changed, 139 insertions(+), 14 deletions(-)

-- 
2.43.0

