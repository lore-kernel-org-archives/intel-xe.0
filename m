Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98908E98DEE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73F10E24F;
	Mon, 23 Feb 2026 07:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp0eRwfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8030510E24F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771830535; x=1803366535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+xdG8pi/pXJ6RGCJjUBSi1ajiyG7O00stREe7T27Wac=;
 b=Xp0eRwfvQl9VEccOczL5J74+UGOgPSMUF08spyYwuFFHQ42sUoGNOlwQ
 ske6M8HrXzOl7NrWHMPM4GRL/Y9ZBgX9EbpqJs/AFcOsk0KyGUzPOuyP7
 RUATrezHkoUUSH6OYTDZSHBmoTO5zXv5Vdbg5YR0WbSp0i1GdP0XhPXA3
 Jx8JhNuykFohDalLRNBvAEZ0oPd9SbW1fYUWKv0x0Nhv+Xl+9pp1Ud8x3
 ozshS8Zsh1m9782Y7/NU23ING3sCfExG09PfFGuaKXS9gW1fLDr+/XgKd
 GsxYOG7rz7w1wQHb+rNwRWFX77yRO4Pf4sTnFPsQFbPBsP8NWiijmK697 w==;
X-CSE-ConnectionGUID: ycfTpmaVSR6IpINhP1PB4A==
X-CSE-MsgGUID: ICtPCOO0Rl6EOeRxTOGk0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72997267"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72997267"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:08:53 -0800
X-CSE-ConnectionGUID: MlI/04OlSCOQdh7bZ1SzEw==
X-CSE-MsgGUID: EfZQV1oUTuy1T9OX0xFMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="253189834"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:08:52 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Date: Mon, 23 Feb 2026 12:38:37 +0530
Message-ID: <20260223070837.1444335-1-varun.gupta@intel.com>
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

When check_bo_args_are_sane() validation fails, jump to the new
free_vmas cleanup label to properly free the allocated resources.
This ensures proper cleanup in this error path.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 52147f5eaaa0..0c92fed6c6a6 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -453,7 +453,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 						    madvise_range.num_vmas,
 						    args->atomic.val)) {
 				err = -EINVAL;
-				goto madv_fini;
+				goto free_vmas;
 			}
 		}
 
@@ -490,6 +490,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
+free_vmas:
 	kfree(madvise_range.vmas);
 	madvise_range.vmas = NULL;
 madv_fini:
-- 
2.43.0

