Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F9C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2465E10EA4E;
	Thu,  3 Apr 2025 18:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1IZ5Cg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2E10EA43
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706580; x=1775242580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JxSEeIlIN41isciYHg1s7GctC+96BMRo+KPG8tawL8M=;
 b=H1IZ5Cg/WS/HN5hxuydkjr0lCjR5kp4RL6Mhue/C3guiSXLbpVU+nSR3
 k5BzCUyzxI2plOTLSoKxxEOWDxTxL639SnCUu+53nJckYpnTKAiv/EyRw
 HRaMEULyd7we0YH7iRAi6yBfhKFJG1T1jocz1NW33uI25h9rh9b9jnWXj
 V+RHk2pgNGRu2FJ7tMpjURHAOpk9OVNEuAx+qE0QRq+zWQ1jXLVRXaGor
 D/e9tgLk5v92opN4nTfla/LpuytdytGkLVYG/o4cc9MWuXK4ZWef6Swkb
 Hfox/t2m+yuvxyJyZdZBY726CEfO7/D5aoCFhA98RYR/nC/OR697lFvNc A==;
X-CSE-ConnectionGUID: coW6G1TnRrqz2gg5aku73A==
X-CSE-MsgGUID: 3BVF6z61RKOdGxGzPKF5Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737756"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737756"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:19 -0700
X-CSE-ConnectionGUID: n29n5j8fSuaWYu0UL+DY3w==
X-CSE-MsgGUID: Y+xQ5PM5SqynSfhTi6JKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895837"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/8] Enable w/a 16026508708
Date: Thu,  3 Apr 2025 11:56:10 -0700
Message-ID: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
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

Enable workaround 16026508708, which is relevant when SRIOV is enabled.

The w/a is implemented in GuC, so also bump the recommended GuC
version to match. Note that PVC and PTL are not merged to upstream at
present, the GuC definitions for those only exist in the for-ci topic
branch. So this patch set reverts those patches, then adds the bump
for the fully upstream platforms, then re-adds the CI only platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Clint Taylor (1):
  drm/xe/ptl: Add GuC firmware definition

Daniele Ceraolo Spurio (1):
  drm/xe/ptl: Define HuC FW version for PTL

John Harrison (5):
  drm/xe/guc: Enable w/a 16026508708
  Revert "drm/xe/ptl: Define HuC FW version for PTL"
  Revert "drm/xe/ptl: Add GuC firmware definition"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Bump the recommended GuC version to 70.44.1

Julia Filipchuk (1):
  drm/xe/pvc: Add GuC firmware definition

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       |  5 +++++
 drivers/gpu/drm/xe/xe_uc_fw.c         | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  2 ++
 4 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.49.0

