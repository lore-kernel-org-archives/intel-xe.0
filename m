Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8ECFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E18810EB1E;
	Tue, 28 Apr 2026 14:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAviczn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901710EB1E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386456; x=1808922456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcuELHhRwsj+QCczXqrPWwVqJFc/NZVDYhAehVzNi5M=;
 b=oAviczn6392vCohkGlwU6gOiNV8GnF5D4tZSbBRElWe/UESgBTpuZEOU
 MexByxM2PXLOSyWAwM3OQqEY9WGJXw3apVMq01V0aTo24+CmpMKwCMp+x
 ciNMvVHkKPUfgMAjyx4P0QzTcA30PbTjsbcg1Ajp/MM0GRGcH1BCNPIJU
 ZlO2Bo7EssQbCOv87TTWzg4LZp3VNnU6j7JDqYkQO9K6hGzk0QwOskpBp
 CR0j4Kmg/SBWSgGCr1sOtOyBY9hFb+eWTQr8xMy1P6PAo3ME6q3Up3vr1
 Xib4F3F+BrTgyWMY0n953QE/jioGzozj0rgqmmtGfBt7ndFJukNiFWot3 A==;
X-CSE-ConnectionGUID: j5yQKHguTniengRXQQrCzw==
X-CSE-MsgGUID: MKcLAyfDRiyQs6GNgsMHaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862307"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:36 -0700
X-CSE-ConnectionGUID: qLc5h9zlSSOefue1jG71Mg==
X-CSE-MsgGUID: ZkE81MiwS1OleKnvrzEP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942333"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 00/13] drm/xe/tests: Add kunit tests for memory based
 interrupts
Date: Tue, 28 Apr 2026 16:27:07 +0200
Message-ID: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

And improve our kunit helper to create more functional fake device.

Michal Wajdeczko (13):
  drm/xe/ggtt: Rename parameter name in xe_ggtt_init_kunit()
  drm/xe/guc: Allow to replace xe_guc_irq_handler() with stub
  drm/xe/hwe: Allow to replace xe_hw_engine_handle_irq() with stub
  drm/xe/mmio: Allow to replace xe_mmio_read32|write32() with stub
  drm/xe/kunit: Promote GGTT initialization to test_init() helper
  drm/xe/kunit: Promote fake BO activation to test_init() helper
  drm/xe/kunit: Activate empty MMIO stubs in test_init()
  drm/xe/memirq: Make page layout macros private
  drm/xe/memirq: Introduce helper to calculate source page offset
  drm/xe/memirq: Introduce helper to calculate status vector offset
  drm/xe/memirq: Refactor xe_memirq_hwe_handler
  drm/xe/memirq: Dump additional source pages if MSI-X
  drm/xe/tests: Add kunit tests for memory based interrupts

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  42 +--
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |  96 +++++++
 drivers/gpu/drm/xe/tests/xe_memirq_kunit.c  | 276 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |   3 +
 drivers/gpu/drm/xe/xe_ggtt.h                |   2 +-
 drivers/gpu/drm/xe/xe_guc.c                 |   3 +
 drivers/gpu/drm/xe/xe_hw_engine.c           |   3 +
 drivers/gpu/drm/xe/xe_memirq.c              |  95 +++++--
 drivers/gpu/drm/xe/xe_memirq_types.h        |   9 +-
 drivers/gpu/drm/xe/xe_mmio.c                |   6 +
 10 files changed, 471 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_memirq_kunit.c

-- 
2.47.1

