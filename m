Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CA2C87FCD
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 00:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C345B10E35A;
	Fri, 25 Jul 2025 00:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0Bdtf1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0636210E0E4
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753402872; x=1784938872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vysdA2hZQ2jw06aUp38nyUGLpozADIeSMsJqyiPZ3HA=;
 b=I0Bdtf1EBzT7C2MlnvB8yVbIk88z0QkMzxJ7sN7reZ0DCiICw4YWgjQg
 JJvHTp7+zrIx/TvxySEqBhefpy40GL61xlrj1Ls1ViVkKuxV+MFwNgA5j
 oMY8P2pBPQsmvoy1QbVeti08gcTUDYuS+D1qD4XZVHXGE8kBJzvPVpo9h
 TpojIkLsARoSs0tUfFGbeV5NefnPBrBI8+cBy7K7ja23hZ1Kldj0QDD5c
 iHjrx23vY3Kaa6isx2iGZ3wk3XLJEv+c1unACNvQ+N6XdyoriTrw4SYEW
 ql8ibON6JFT7BVJhL68p8CmGJRJcXxVm7EbULtEkOM+DV9HXCwxnB0JTM A==;
X-CSE-ConnectionGUID: 5uT10i7UQYKuWfPINMtPOA==
X-CSE-MsgGUID: j6m+cGofRxCZkvmc6D1NTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59549818"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59549818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 17:21:11 -0700
X-CSE-ConnectionGUID: lI9/sku0Ru+KVGFK0HFStQ==
X-CSE-MsgGUID: hoiws/CYQLy2ejZ5XxQZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="191462856"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 17:21:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/4] Add test for G2G communications
Date: Thu, 24 Jul 2025 17:21:01 -0700
Message-ID: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Platforms with multiple GuCs (multi-GT and/or multi-tile) have a
mechanism for sending messages from one GuC to another. This relies on
the KMD configuring buffers correctly and informing the GuCs about
them. Support for that was merged a while back. So add a test to go
with it.

Also, improve the firmware CSS header structure and defines to better
match the spec and to add missing fields that are useful.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/xe/guc: Update CSS header structures
  drm/xe/guc: Add firmware build type to available info
  drm/xe: Allow freeing of a managed bo
  drm/xe/guc: Add test for G2G communications

 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   2 +
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c  | 759 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |   5 +
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_device_types.h        |   7 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +
 drivers/gpu/drm/xe/xe_guc.h                 |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |   5 +
 drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  21 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  64 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   3 +
 13 files changed, 845 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c

-- 
2.49.0

