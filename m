Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64113C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086EE10E45A;
	Tue,  4 Jun 2024 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCvZQdit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE9C10E45A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499839; x=1749035839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LBhlUyzujiLzupN/w7KeerwnKtOaVl3rXwgBc9XbWqM=;
 b=ZCvZQditNyLW12gJDrQ+gfD1M16r+vSBJcEDXsXbHm/oEnuo1LNrMYuB
 FexVQFgoviHAjKX9JtS7Z7PXgRZyacXhKQQgvI/H7ZvCn04ugyS7Y7kEo
 R1LPBSHS8EhFa7jIBqqav/un+ixVK8HOcJ5QeSAN+bcLl9BFM9mhU2eG+
 yYYrKqPoTwY55EQrhT88WP33nN0EgDlQlMHONGcP0IyMD9irAtqilQxjw
 YRw/dW1mgROUPnXcGrZhbqmvv5tlbwUD7tIrnAVTswdUxDdr45aRPBJr9
 ndAZ436nSrTO78nuZ8E8g0ir0zkjwJGJM/R08MtmuU3dczBWEMLjsPkln g==;
X-CSE-ConnectionGUID: DAYoGr5QS4+H+yQcd1NS6A==
X-CSE-MsgGUID: CFVPCt9qTEGThvJREHC+7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701844"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:18 -0700
X-CSE-ConnectionGUID: 3V/BdRxmTcK2DPbuQK3WEg==
X-CSE-MsgGUID: /P1yAmOXTFqtOMXG67jjsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669654"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/9] Ensure xe_force_wake_put is always called after
 xe_force_wake_get
Date: Tue,  4 Jun 2024 13:02:16 +0200
Message-ID: <20240604110225.29495-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Cuurently there is inconsistency how we handle force wake get and put
calls. We have three cases: 
1 Return value of xe_force_wake_get is not checked.
2 Return value of xe_force_wake_get is checked but continue.
3 Return value of xe_force_wake_get is checked but the caller returns
  without calling xe_force_wake_put.

2nd case is perfectly valid but 1st and 3rd cases shouldn't happen. As
xe_force_wake_get() will increment the ref count regardless of success
or failure so xe_force_wake_get() should be followed by a
xe_force_wake_put().

For case 1, the last patch added __must_check attribute and rest of
patches are making sure we always call get and put in pairs even if
xe_force_wake_get() returns error.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Nirmoy Das (9):
  drm/xe/display: Always call xe_force_wake_put/get in pairs
  drm/xe/pat: Always call xe_force_wake_put/get in pairs
  drm/xe/xe_reg_sr: Always call xe_force_wake_put/get in pairs
  drm/xe/xe_gt: Always call xe_force_wake_put/get in pairs
  drm/xe/uc: Always call xe_force_wake_put/get in pairs
  drm/xe: Add xe_force_wake_tryget to simplify forcewake handling
  drm/xe: Use xe_force_wake_tryget when possible
  drm/xe/client: Check return value of xe_force_wake_get
  drm/xe: Add __must_check for xe_force_wake_get

 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
 drivers/gpu/drm/xe/xe_device.c           |  4 +-
 drivers/gpu/drm/xe/xe_drm_client.c       | 10 +++--
 drivers/gpu/drm/xe/xe_force_wake.c       | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_force_wake.h       |  6 ++-
 drivers/gpu/drm/xe/xe_gsc_proxy.c        |  3 +-
 drivers/gpu/drm/xe/xe_gt.c               | 27 ++++++-------
 drivers/gpu/drm/xe/xe_gt_debugfs.c       | 10 ++---
 drivers/gpu/drm/xe/xe_guc.c              |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c           |  8 ++--
 drivers/gpu/drm/xe/xe_huc.c              |  2 +-
 drivers/gpu/drm/xe/xe_pat.c              | 10 ++---
 drivers/gpu/drm/xe/xe_query.c            |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c           | 20 ++++------
 drivers/gpu/drm/xe/xe_vram.c             |  2 +-
 15 files changed, 98 insertions(+), 59 deletions(-)

-- 
2.42.0

