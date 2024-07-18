Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C48FC3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 21:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED910EB20;
	Thu, 18 Jul 2024 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIGMMI82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C510EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721336752; x=1752872752;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vLhc+DWn46JrWhj554eYuxG8zDjy/XHU6FkN+1ul1UQ=;
 b=UIGMMI828vOKxa0gpO1TL4M2mxIDdJ50gRRcdrf+ogUU9owukri2J+ke
 gWmKI4T1Fcz2aj21Qda9Xz5ITBjiGWKhySePsJRhA3FtryASh+hC2yToT
 IATY91UUR7qZZ/j5k5U24nHbSpCyaNdwPVRKpeQLSzhJFdtRMeOMcPafS
 cgWRfjCX/p+VfPZ40TwIWTpst6RP99bS5aStr/wY4UPTgwdDHKsg5dXu2
 rSO5qCF8EdIbrzxMwj/gXrY/Em0fbJxhMfE8Su+rdEm4GVYgE9wzkoQF6
 9oAwGHEQ19W1p405fH5bI0tfyxwS0mf+jRKf29kZeROe5T3uVHPBR7ldS g==;
X-CSE-ConnectionGUID: o8IIBj6uTcWii7OorACJEw==
X-CSE-MsgGUID: mmc8sgDxS/+X522rk/q+Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30349945"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="30349945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
X-CSE-ConnectionGUID: k7dJIaPbRZCMt/Fq2gCk1g==
X-CSE-MsgGUID: fSHwYf6WRVqET7buK0U7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="88385250"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/4] Have xe_vm and xe_exec_queue take references to xef
Date: Thu, 18 Jul 2024 14:05:44 -0700
Message-Id: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Just posting the revision that will be pushed for reference. This rev
only has documentation changes compared to v2, so will not run CI on
this.
-----
xe_file_close triggers an asynchronous queue cleanup and then frees up
the xef object. Since queue cleanup flushes all pending jobs and the KMD
stores client usage stats into the xef object after jobs are flushed, we
see a use-after-free for the xef object. Resolve this by taking a
reference to xef from xe_exec_queue.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

The series adds xef refcounting and ensures all consumers of xef take a
ref to it.

v2:
- Include review comments from v1
- Squash patch 3 and 5 from v1 to add Fixes/Closes tags

v3:
- kernel-doc fixes (Lucas, Matt)

v4: Rebase to drm-tip

Note: Patches 1 - 3 can be merged independently

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe: Move part of xe_file cleanup to a helper
  drm/xe: Add ref counting for xe_file
  drm/xe: Take a ref to xe file when user creates a VM
  drm/xe: Fix use after free when client stats are captured

 drivers/gpu/drm/xe/xe_device.c           | 58 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.h           |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c       |  5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
 drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
 7 files changed, 71 insertions(+), 21 deletions(-)

-- 
2.38.1

