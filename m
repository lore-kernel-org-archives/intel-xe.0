Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40217CA0EC0
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E810E5C8;
	Tue,  5 Aug 2025 23:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+5DG7HF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB010E2C6
 for <Intel-Xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437377; x=1785973377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yDAgkTiufhV1/zCnVcJ90hJNZOL+8JP1V/ABj4RSrSo=;
 b=E+5DG7HFyKGOQVY/2gTw4lRqZRWZfEz/zSwAm7cuyFHRhkQ0FTPxY9aA
 JofuYKJvJmF1XwHaYowO1R9U7WTqlDX/1THlQriQ7jMyWKNJN1/8lplCd
 cbLcqz4KOBWcDzTL2c8bSvorhu8Y23dxezjaukk38tmu3I6uMYuBvWu4p
 mQOc0/wSz0pGYRHJmrdyfEXedqvvTWTzD9VMaCr79LtTHVpnLeBdteC3H
 Ah1+AsT9NMRPYaN7EH+TIaV5RqmBTUIjP/siFpqPIwlC7EiRf0M5c2kHa
 aDq9v0f1xpkOZQ47qLaLShCuYyTbCJz4v26YTRplzWaIYFAgqYKZoyq7C g==;
X-CSE-ConnectionGUID: AY30i21rQoOq7T7EgAdTTg==
X-CSE-MsgGUID: c2b/8/TkQeK563fCY8s1gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44340226"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44340226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:57 -0700
X-CSE-ConnectionGUID: jv2+VrmaSwuoHiVTuErYAA==
X-CSE-MsgGUID: Z70NABpvTL2ocHHKdQjRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163862590"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 16:42:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/4] Add test for G2G communications
Date: Tue,  5 Aug 2025 16:42:51 -0700
Message-ID: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
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

