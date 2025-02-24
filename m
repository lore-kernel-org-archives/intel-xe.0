Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFC1C021A6
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F0410E412;
	Mon, 24 Feb 2025 13:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiEeg3F7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64E710E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 03:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740367416; x=1771903416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1BIlE23NyOc17nFNSGaN2IiGGSAhOkoqEtliTAxSqLg=;
 b=kiEeg3F78NP9o6I9dYq29xyBZ5K8w62+/0EYxCk/aFq/rHVZBhSFQaBx
 HoUz3Kajo1fq5BBPqcEGygkBPoY6mwLhSKWsuDIu3Thr51Uz9qDG3qOVm
 wXB+KNX1SEDOKykIGMfahwVFpNuZHPxYfTsU1VzRvIHC03nsdjobNmNT+
 zuSXv2c63cI+C2Jliq6+wVVQwHTVR+8pQFeFY8RHKTE4JZfyQKXx6Ugej
 4ZEHKHQJSLeJULZZGJRoWl0e0y8b1fMNCl32elrp720S5XAE7XhM4uT8F
 tYvBwFVix+D5ff6YHJYvjxiLFH7XzgnwOGm9FGiHswoypgW72gOraavRZ A==;
X-CSE-ConnectionGUID: ecHe7E8zRsyI83ZnwJ9oOA==
X-CSE-MsgGUID: L3eck7L4RWujcGscvNb84Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41126880"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41126880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:23:36 -0800
X-CSE-ConnectionGUID: s7KJKnm0QGaMV+5ecp8tiA==
X-CSE-MsgGUID: P5cJngUvQ6evBhD0URoSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115907814"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:23:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 0/3] Userptr fixes
Date: Sun, 23 Feb 2025 19:24:35 -0800
Message-Id: <20250224032438.3025464-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tested with below tests on BMG + CONFIG_DRM_XE_USERPTR_INVAL_INJECT
xe_exec_basic; xe_exec_compute_mode; xe_exec_fault_mode; xe_vm; xe_exec_threads

Including a patch from Matt Auld as it required for above test case to pass.

Matt

Matthew Auld (1):
  drm/xe/userptr: fix EFAULT handling

Matthew Brost (2):
  drm/xe: Userptr invalidation race with binds fixes
  drm/xe: Add staging tree for VM binds

 drivers/gpu/drm/xe/xe_pt.c       | 194 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_types.h |   3 +-
 drivers/gpu/drm/xe/xe_pt_walk.c  |   3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h  |   4 +
 drivers/gpu/drm/xe/xe_vm.c       |  16 ++-
 5 files changed, 170 insertions(+), 50 deletions(-)

-- 
2.34.1

