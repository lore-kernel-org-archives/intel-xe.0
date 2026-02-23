Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528B5EC1117
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032A610E128;
	Mon, 23 Feb 2026 17:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SI22GGSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AFF10E128
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771869131; x=1803405131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OtOrtqHnE6+/Ie2rMvi4pTmom/JSM0q3DMGm2RtyQeg=;
 b=SI22GGSo+m4O0tQmyWcv23H5eJKSZs58tBzNa4iMyxxK82EAa6KLxz7w
 49A9b3h6bgQEu+aL1e4tbmYyub7HlI4UvUzPxJkJdE71seEJ8kVL4KpXC
 CME19OFzOcjtfRgh5Bxj0BxHUXJHOP683lT4FRmf9QI21OMdoYXqG4VDh
 0PEmAz22CwvsRu+msl//10xkYRyh8C/P246zN9Q2uOvTyQ0GCJjcDyueE
 qxRacm7UceHuZpGZfIFeBCyb48hfBBap5XbYyzETA9fTHglymwndo22nL
 02nluEFO9QdTGJP2qnVa1uCczGVCW5c1jRebpXo9DnR5W6sNdrQV4AZ4b Q==;
X-CSE-ConnectionGUID: eCJq10f7TsScHJCBDrsTYA==
X-CSE-MsgGUID: XSYQjJo9Qvy3xqUSDyWKfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72748065"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72748065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:52:01 -0800
X-CSE-ConnectionGUID: GSAxhmQCS3eCwnpwSFYFQA==
X-CSE-MsgGUID: UfOJQxTUT0eHihgqPXy2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214863039"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:51:58 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, shuicheng.lin@intel.com
Subject: [PATCH v3] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Date: Mon, 23 Feb 2026 23:21:45 +0530
Message-ID: <20260223175145.1532801-1-varun.gupta@intel.com>
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

Fixes: 293032eec4ba ("drm/xe/bo: Update atomic_access attribute on madvise")
Cc: stable@vger.kernel.org # v6.18+
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
v3:
 - Corrected Fixes tag to 293032eec4ba (Shuicheng Lin)
v2:
 - Added Fixes tag and Cc stable (Matt Brost)
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

