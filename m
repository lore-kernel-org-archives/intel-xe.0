Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBD7CAC58E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4510E9E7;
	Wed, 10 Sep 2025 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaXl+5w8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7F10E9E4
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757538158; x=1789074158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMwAOotczoJghzHAnCc3dKjdQXdx2LPebFy1g6TO8/Y=;
 b=DaXl+5w8Yjoh1GLVBwy2XGjjePmD1NXGv7gXbRoZATEm1Yq4k36YFDov
 H6nGsuX9k9KaCKlVt1Xt96vqpSZZu3b5wBUdgRkCrJuVriqqEYzrINZLA
 vm2HvyMWqUd9xrdRx9HVjhrhJogSG90fCUborq0eyPiom4uA/dl0NZj3V
 idoW7ewSXSom/vg2zD6T0C5aPG4TAWuBF9j00+dmuQJjPjc5d1a5cyr8E
 AsM7w/GGYL1ibs4JcTSwQIB9xl1mB+x8YzaDIyoPt6ZPoEiZhMOERYZwK
 +zSfWBxcoNDMKGEspiOVcsXJM+agUQcOE00orP8lcnbiEafAyhVy/iEsv w==;
X-CSE-ConnectionGUID: 1efma/6pSFC1mSIIy0Sjrw==
X-CSE-MsgGUID: hAoxkf1ySnS1LPPYVWhO0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70958642"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70958642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:02:38 -0700
X-CSE-ConnectionGUID: l+k41HYdQaKoz9dQGFIvSg==
X-CSE-MsgGUID: ePtMiRawSmi6PNQWFXPrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174311948"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 14:02:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/4] Add test for G2G communications
Date: Wed, 10 Sep 2025 14:02:31 -0700
Message-ID: <20250910210237.603576-1-John.C.Harrison@Intel.com>
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

v2: Tweaks for review feedback from Daniele
v3: Rebase to latest drm-tip.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/xe/guc: Update CSS header structures
  drm/xe/guc: Add firmware build type to available info
  drm/xe: Allow freeing of a managed bo
  drm/xe/guc: Add test for G2G communications

 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   2 +
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c  | 776 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |   5 +
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_device_types.h        |   7 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +
 drivers/gpu/drm/xe/xe_guc.h                 |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |   5 +
 drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  25 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  64 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   3 +
 13 files changed, 864 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c

-- 
2.49.0

