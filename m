Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47221C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 17:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75110E264;
	Mon,  3 Jun 2024 17:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbKeq7gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C98E10E264
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717437164; x=1748973164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7RiY7iCEcP9ZQAec8XAiUTSRCn7j/OquBUZlIDtRagg=;
 b=fbKeq7gHdFMBPwStDky/KP7nbi3r341EIw468zD5NoWxneBmEQ4yCoIf
 N+b02wsISfyN+pu4h4VLp8F1JPvhE5B+1/jnbE462MOXjB2yvkGyWvzrn
 9pwVipGgH7YQehFDJhz1kB1uBhI+siaE0j6fYjlVbl7k609kO0iV9jH8h
 oEilDiCLYzdqGqBU8Cq1pgErfzqsO/g7cVslGjT27svQxnbJnt5GVYO6c
 AsP5pEdnwpqTUO1pSQiCj/rtd8lPsC4RACDu++Ry8HHBytM0V9qbdFtz/
 E2DAnsQY+zW1YKbyvbIRCIP6FBf3Vq/5RMQHbCn+LNmXu0gCIRtfzaSHd A==;
X-CSE-ConnectionGUID: ENYafZqARMWFlxQ1i87G0g==
X-CSE-MsgGUID: GvuidG6eQdiL3CpfrU3wdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14103394"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14103394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 10:52:44 -0700
X-CSE-ConnectionGUID: o6lOeMmcQzeG32RNxpintg==
X-CSE-MsgGUID: JALQqogjRW2URFqsFdQ+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36977745"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 10:52:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Restrict user fences to long running VMs
Date: Mon,  3 Jun 2024 10:53:12 -0700
Message-Id: <20240603175312.1915763-1-matthew.brost@intel.com>
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

User fences are intended to be used on long running VMs, enforce this
restriction. This addresses possible concerns of using user fences in
dma-fence and having the dma-fence signal before the user fence.

Fixes: d1df9bfbf68c ("drm/xe: Only allow 1 ufence per exec / bind IOCTL")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 drivers/gpu/drm/xe/xe_vm.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 97eeb973e897..a145813ad229 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -168,7 +168,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			num_ufence++;
 	}
 
-	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
+	if (XE_IOCTL_DBG(xe, num_ufence > 1) ||
+	    XE_IOCTL_DBG(xe, num_ufence && !xe_vm_in_lr_mode(vm))) {
 		err = -EINVAL;
 		goto err_syncs;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 26b409e1b0f0..85da3a8a83b6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3226,7 +3226,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			num_ufence++;
 	}
 
-	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
+	if (XE_IOCTL_DBG(xe, num_ufence > 1) ||
+	    XE_IOCTL_DBG(xe, num_ufence && !xe_vm_in_lr_mode(vm))) {
 		err = -EINVAL;
 		goto free_syncs;
 	}
-- 
2.34.1

