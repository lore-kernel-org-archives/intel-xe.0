Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D154C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECDC10E7E8;
	Tue, 13 Feb 2024 15:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzKns5DZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68310E7CB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839053; x=1739375053;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bhy7uYKhs/ObmmJ/yBEx8iopflFtC+7vpaqHu5KpaN4=;
 b=YzKns5DZ2vREqcO6iE2jyoGa8w/f3CQzvGFY/oDpMQyy52xY3wimbDLe
 z11Ieukeh7zes6S5pRY3KwJMbvjo9Hq92Wfqaoyq3Qp4+2UKP6ltl366v
 fgs7ECyVz0OfDKaoZrLxI8XInbJG6cMaaB4M6bb2EHM1EHnPs9WWMCxXk
 aeii1g3baP4r34+cHw58K4Y+f/rK9TN2Cg7Y8nh4bZx+YCvRYPQszMG53
 9xrlZs4ax9msuTSvP1SM9ltNyl9RSl+yCeWgGtaSX/Nx4fULUGBlRbqWm
 CL7t8DSOru9FXhLyh65nRncTwrOdh7hyBVdjsvE7DKSA2XMZq8oIQgeQ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262916"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564492"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/8] VF Tweaks
Date: Tue, 13 Feb 2024 16:43:47 +0100
Message-Id: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

Virtual Function (VF) has limited access to the registers.
Start avoiding using them if we run as VF driver.

v2: just rebased, already reviewed at [1]

[1] https://patchwork.freedesktop.org/series/128727/#rev1

Michal Wajdeczko (8):
  drm/xe/vf: Assume fixed GSM size if VF
  drm/xe/vf: Don't try to capture engine data unavailable to VF
  drm/xe/vf: Don't program MOCS if VF
  drm/xe/vf: Don't initialize stolen memory manager if VF
  drm/xe/vf: Don't check if LMEM is initialized if VF
  drm/xe/vf: Don't enable hwmon if VF
  drm/xe/vf: Don't program PAT if VF
  drm/xe/vf: Don't support MCR registers if VF

 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.c         | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c      |  5 +++++
 drivers/gpu/drm/xe/xe_hwmon.c          |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c           |  9 ++++++++-
 drivers/gpu/drm/xe/xe_mocs.c           |  4 ++++
 drivers/gpu/drm/xe/xe_pat.c            |  5 +++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  5 ++++-
 8 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.43.0

