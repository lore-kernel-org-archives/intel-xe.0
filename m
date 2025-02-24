Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17293C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD0510E3FE;
	Mon, 24 Feb 2025 13:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmrZmzrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45CB10E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740369869; x=1771905869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1BIlE23NyOc17nFNSGaN2IiGGSAhOkoqEtliTAxSqLg=;
 b=CmrZmzrXZSJyvdKSeXanD0Pqs67FCl0jqAUdmq2zUJgtoU38uE1btorC
 KjKmpiTzUUsyWfXxQz3g9tW0rmExdwm1ksDo2qsO5LfYfmFDBC80XnaRw
 469vvXgnYO3yBMc3IWvRDQ2d1M6/JDt+KvG7qzD1HvzipBPw88FNAOrxP
 lCfPp6mfzUeMZ4/os3PQxxKU9GWJ1Jne8wqEaqXYWs5vbI5YOZaA32Q+8
 giMxZEfHj9SDjtJ8pFzH8Kzycq00ArbW8jm3ybFKBleonrbJl6Jegp+mE
 p4HMRCmbI5vXn2BQRqUaC2Ypg5XvA40A2D7ZTFtzkdIrbRBoLUWIjJu5I A==;
X-CSE-ConnectionGUID: o6YeR/YtRgObYP/QRrPWfQ==
X-CSE-MsgGUID: RtH8WBjjRQO21+m8x0qHkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="51740511"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51740511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:29 -0800
X-CSE-ConnectionGUID: pqqg3BsdQSe4KaFIoRoOnQ==
X-CSE-MsgGUID: R5oT+qbZR/C1c9mYZISmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115788471"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 0/3] Userptr fixes
Date: Sun, 23 Feb 2025 20:05:26 -0800
Message-Id: <20250224040529.3025963-1-matthew.brost@intel.com>
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

