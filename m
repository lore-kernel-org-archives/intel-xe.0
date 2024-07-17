Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A712C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1540C10E3CD;
	Wed, 17 Jul 2024 19:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tp5ALjcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699910E166
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245926; x=1752781926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8KnPo4feoNLypynvHSXxL4qLpyqLN9aa4BwqujQmbXI=;
 b=Tp5ALjcr6MctZVaSQyZRsdx0gkIbptQTYiBR08Qe5UG7YHMwcs3fMR+V
 /5cweQzpsmCJIufUIZVhtyFw7avf8xhdZvj/A/nK3USC/z1EUp8YRdzAB
 WuUkhZesU3zvi9nh1TnAOUwdd68tWpfY/mUV/mQdkIweK9Hwu7hkpL9Ad
 ff4SnTKGnkHvyQBEyyKuZsxtgXcKG2K9jQFrgPzBQS15abyuu6xaAyyrJ
 PLZ3deEiyyAGShnH+ut6GkpI0VvKwpumNeuzQCDv+84bCHcEzEk02ojOs
 nkNOQOY3vqy1QnO4iomYqK1Wkmgfn0vhVULNGsUPGe+6lT3f5u6EWI5Ti w==;
X-CSE-ConnectionGUID: /Gl9jkCrQbW1p0gsGIXRkQ==
X-CSE-MsgGUID: UJP/pmJcR/+OINGHcBTdLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472910"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472910"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:06 -0700
X-CSE-ConnectionGUID: gZWUKXf8RyiWh7fiybSHjw==
X-CSE-MsgGUID: 5U1G5gqxSAaPgAMx7L4Owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690348"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/7] Convert live tests to parameterized style
Date: Wed, 17 Jul 2024 21:51:48 +0200
Message-Id: <20240717195155.442-1-michal.wajdeczko@intel.com>
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

v2: can't rely on test->priv in .exit helper (CI)
    for cleanup use kunit_add_action_or_reset() instead

Michal Wajdeczko (7):
  drm/xe: Introduce const cast helper
  drm/xe/tests: Add helpers for use in live tests
  drm/xe/tests: Convert xe_bo live tests
  drm/xe/tests: Convert xe_dma_buf live tests
  drm/xe/tests: Convert xe_migrate live tests
  drm/xe/tests: Convert xe_mocs live tests
  drm/xe/tests: Skip xe_mocs live tests on VF device

 drivers/gpu/drm/xe/tests/xe_bo.c            | 18 ++++++----
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  8 +++--
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  2 ++
 drivers/gpu/drm/xe/tests/xe_migrate.c       |  8 +++--
 drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 ++++++++---
 drivers/gpu/drm/xe/tests/xe_pci.c           | 30 ++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
 drivers/gpu/drm/xe/xe_device.h              |  5 +++
 9 files changed, 118 insertions(+), 14 deletions(-)

-- 
2.43.0

