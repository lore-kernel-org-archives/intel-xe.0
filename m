Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6DEE98DFF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 09:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FA610E2C4;
	Mon, 23 Feb 2026 09:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpD7vWOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADD010E2C4
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838911; x=1803374911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H2V7360J1MHWBig/Bh3XlOevBjFfgPTStue/duEHrqA=;
 b=GpD7vWOnKUIKEgDDH8p4UbwaRDj4GZSo93QrT90n6Iypli9DA5vVPZp7
 j7qS/jsoitN0DTWNJjHJ1loxD2dmO6BIqzFuMISkEE1S3ay+dBTzgrzfZ
 DmACObzXCXF4ryh+hwmIUi+P/qLxpk/LNbCYAtnh0+ZYhxyR1fEbZRYA5
 Z77gvo7HIDwWA0anng+G9lK2iXjl4n3rwu1DsHcsMIeepo/cZpUoUhlNU
 /J+Mdsj/B11/Q0b+jjQ/E/qfHxTNTOrc6C4YriyYW/MTi8uLPSXtRg3fk
 DmWif7qBAu3260JmuzJK8CgR6iDrph0XiLHpcWNoz9o2TjJIVX0EG7DDi Q==;
X-CSE-ConnectionGUID: qZs4OHH7SCiBSnG2iH/Hlw==
X-CSE-MsgGUID: +BGJR2MSSWSrrVZ/1BhLSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72891444"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72891444"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:28:30 -0800
X-CSE-ConnectionGUID: wl5DNCNsS0qUD8KOKyx5Sw==
X-CSE-MsgGUID: uxSk/2QFSr2e5vt5DPbq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214741579"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:28:29 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v2] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Date: Mon, 23 Feb 2026 14:58:15 +0530
Message-ID: <20260223092815.1500739-1-varun.gupta@intel.com>
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

Fixes: dff547e137be ("drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm")
Cc: stable@vger.kernel.org
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
v2:
 - Added Fixes tag and CC stable (Matt Brost)
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

