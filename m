Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BE5C41513
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933810E8C2;
	Tue,  7 May 2024 22:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFoizzqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13F410E163
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121779; x=1746657779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zQmbbD+fJLPIYIz9+i/LFX5N+UN8bOV7hZ8qlNXIOeY=;
 b=RFoizzqveu6k0KsS5XLtrPxATjR0xabJBVBwVjAePkJU8HTEzEyYCtw3
 GJ/v/Anhcl1HNdx0kufiV+a5UImt5H7H31il4Z/Vyy5CbbPeMpFfZIYOE
 oJO5h6FT3L2mYj7Kj91b3uShAE7qnU44wYrfiE9jCagNLTfbOrAkyAdhp
 aIooqwDf0X/enfg0mdqVLKYy/jFevf08Mr6V4O68acYK63Ek7FdlWuU5u
 u9jiWehIDifsUKoIc5/XA3kxcgwznAg8wbE6y7UynVKFsXR2D6CzrUa9V
 ZYtUQ9sCwOTRf+GC7asXy+QI1WRxzWn9omOM+AXeLG7PA9SIuxb/o4N62 A==;
X-CSE-ConnectionGUID: cX4Sly2+TkeHnMg3Za6spQ==
X-CSE-MsgGUID: ViR8vQCJSGulgP08uinYvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108369"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
X-CSE-ConnectionGUID: dbUY3fBKQ8muETyZrPZpZQ==
X-CSE-MsgGUID: wN9jmjwGSxertjtNjmf3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33156983"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 0/4] drm/xe: Add Indirect Ring State support
Date: Tue,  7 May 2024 15:42:49 -0700
Message-ID: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
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

When Indirect Ring State is enabled, the Ring Buffer state and
Batch Buffer state are context save/restored to/from Indirect
Ring State instead of the LRC. It is the recommended mode for
Xe2, hence enable it by default for Xe2 platforms.

v2: Rebase, kernel-doc fix, add bspec reference
v3: Fix typo in commit text,
    set has_indirect_ring_state to '1' instead of 'true'

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: Minor cleanup in LRC handling
  drm/xe: Add Indirect Ring State support
  drm/xe: Dump Indirect Ring State registers
  drm/xe/xe2: Enable Indirect Ring State support for Xe2

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   9 +-
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 +
 drivers/gpu/drm/xe/xe_gt.c               |   6 +-
 drivers/gpu/drm/xe/xe_gt.h               |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h         |   6 +-
 drivers/gpu/drm/xe/xe_guc_ads.c          |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  11 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   4 +
 drivers/gpu/drm/xe/xe_lrc.c              | 187 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |   5 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_pci.c              |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   3 +
 14 files changed, 220 insertions(+), 39 deletions(-)

-- 
2.43.0

