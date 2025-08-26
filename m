Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C4BCA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E027610E6B2;
	Tue, 26 Aug 2025 17:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0uHwOgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFDB10E6B1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756230653; x=1787766653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NVrngxD4B30w+qaQEolskCL7au5kV4/7vnjtb5zSYhg=;
 b=F0uHwOglrQwUItEFfSQGcTJi4TruH0z3XEwmpw9BRNUogetspCJVdzjm
 IQkxEJghQms2w2iwqL2CN/GV4G5X9hNeu2XKNlDwzlij6I00i4Yoxgc0T
 ICe72BNjmS/8cW/CgX9tWgPNG6tK9fGTzcam9Tc3pnZaBQxm+W8xRVGVQ
 E99hgFQ2rkgCCOpLZ6c8oMOpQuLKdvv/GeZmDk4AT7nYfUL8UCea28/xu
 oKfyOyt605EYVw64PkQiXiXLu3un/GrJS7VXzihcB4Lvi4FDmiV9GYXMx
 I6gVcAV5cb2i6Yll9282lgCJCRbGLdWG7KblLvKjHq2dq+ISceBu8gMhv g==;
X-CSE-ConnectionGUID: Oolp77lBSFah2sxii7cHgg==
X-CSE-MsgGUID: W4VB+J+yT8GYyp16fKprTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61110841"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61110841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
X-CSE-ConnectionGUID: zuGNw61tST2Ko0Fyrfxyvw==
X-CSE-MsgGUID: HKtR+6RGQMO3wjkMLvN13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169150385"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/2] drm/xe/xe_vm: Add error injection support to lock and prep
Date: Tue, 26 Aug 2025 17:50:52 +0000
Message-ID: <20250826175051.92563-4-jonathan.cavitt@intel.com>
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

Error injection should use the error injection interface, and should be
decoupled from CONFIG_DRM_XE_DEBUG.  Remove TEST_VM_OPS_ERROR from the
code, and add error injection support to the function
vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
as noinline.

Jonathan Cavitt (2):
  Revert "drm/xe: Add VM bind IOCTL error injection"
  drm/xe/xe_vm: Add error injection support to lock and prep

 drivers/gpu/drm/xe/xe_device_types.h | 12 -----------
 drivers/gpu/drm/xe/xe_pt.c           | 12 -----------
 drivers/gpu/drm/xe/xe_vm.c           | 31 ++++++----------------------
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 -------------
 4 files changed, 6 insertions(+), 63 deletions(-)

-- 
2.43.0

