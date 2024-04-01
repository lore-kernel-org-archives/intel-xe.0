Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F96CD1294
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 22:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FAE10F606;
	Mon,  1 Apr 2024 22:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZo7q+bL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CF610EBC3
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712009932; x=1743545932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dvb1Xd8osQ+xFNGH44B7VqW2JunvuwMfYD16n5TMel4=;
 b=mZo7q+bLqBCy3M9S9jDbYuK5NExTg4swTE2/fKyKfK9hP+bx8zaTlXvA
 1mB4qe1h01NYNNLjhLOz5mkgYVeHBCyhxgFaKFZnZMPnq/iAGxay+0hes
 aqFkQPcrky+YvMZrYllhQXKbacF2NDV2byYxFXM60GfIElGGcZRBk7OZ1
 IAKSVvdoIKvpNPb0M2yCW4LFmjbfT1cl1o0ZL8WT39jEU+jtPFCVkMBHL
 1bhr37WZXMHupe1dDdmIkzDfP8KXLY8f9LjrhdKFdnmvUN3l+NYLwPKMJ
 SL2hVPdC+rOtFTm7vdEoQ1ED2O1YnkwVAcGOGhZrGa+uSrCcSEm4ruqBM A==;
X-CSE-ConnectionGUID: pFUm4xWvTv+XK/MR+tZc2w==
X-CSE-MsgGUID: 0/gpfTfvTUybqthaMlfcwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7022993"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7022993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="17805016"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: lucas.demarchi@intel.com,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/3] Rework work queue usage
Date: Mon,  1 Apr 2024 15:19:10 -0700
Message-Id: <20240401221913.139672-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Avoid sleeping or grabbing locks in work queues shared with the system.
Recent changes to work queues [1] have exposed deadlocks [2] in Xe.

I believe only patch #1 is required to unblock CI in 6.9rc1 [2] but
likely all patches should be included in stable kernels.

Matt

[1] https://lore.kernel.org/lkml/Ze7Jz9cQcUMtCqfk@slm.duckdns.org/
[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-984-093d82c02921344d8d400989af156aaf79b9d961/bat-adlp-7/igt_runner0.txt

Matthew Brost (3):
  drm/xe: Use ordered wq for preempt fence waiting
  drm/xe: Use device, gt ordered work queues for resource cleanup
  drm/xe: Use ordered WQ for TLB invalidation fences

 drivers/gpu/drm/xe/xe_device.c        | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h  |  8 +++++++-
 drivers/gpu/drm/xe/xe_execlist.c      |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h      |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c    |  2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  4 ++--
 8 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.34.1

