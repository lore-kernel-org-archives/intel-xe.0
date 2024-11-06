Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2744D59F75
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 22:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74FC10E1DE;
	Wed,  6 Nov 2024 22:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwBx+3c/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4C810E1DE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 22:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730933372; x=1762469372;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E2dKPbhKH93IevtqmTeRi9UrpFlc7CBBajHXpv2cbKE=;
 b=CwBx+3c/oBfOwfTEqsuT9CB+Qz0lo4gcyuClI0yr3vZwMXJFNjpBBF06
 BI43ZgyYZFxcGcfqejdi1k4cuQsHLxZD27bdMWQ6XShhRPZZPNI0XG/yz
 lfTccf879lC+fj8V9o8b0NDB0BU1fEyFbcDVFAc0dDeMDETr4kPewmLec
 N/dfXbSFRHSZcFUXHzkfML0g+RlsyfLQvmQQoqYOGvxOkRkbK+PSc3RDf
 vukUeIBXwZrNUwFqH4npd0YBh6Bs3kdEYRBlIjBL46eolo9M20taC1TEF
 53XlTQjYYI0UrdH8X9AWgzDIMLZG7W3hiJkMwm/5LdsbywNdFuJFCLUYy g==;
X-CSE-ConnectionGUID: 3AxuJ3UQSRahc7F76tVTfg==
X-CSE-MsgGUID: klm4kZp7Ql+tB29UfbNG0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30613476"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30613476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 14:49:17 -0800
X-CSE-ConnectionGUID: sIrZkYopSYyv1Q/FwT9djQ==
X-CSE-MsgGUID: sxieQ0lFSNucfh8Ft2lsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84899536"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 14:49:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Ensure all locks released in exec IOCTL
Date: Wed,  6 Nov 2024 14:49:44 -0800
Message-Id: <20241106224944.30130-1-matthew.brost@intel.com>
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

In couple of places the wrong error handling goto was used to release
locks. Fix these to ensure all locks dropped on exec IOCTL errors.

Cc: Francois Dugast <francois.dugast@intel.com>
Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 756b492f13b0..31cca938956f 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -203,14 +203,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		write_locked = false;
 	}
 	if (err)
-		goto err_syncs;
+		goto err_hw_exec_mode;
 
 	if (write_locked) {
 		err = xe_vm_userptr_pin(vm);
 		downgrade_write(&vm->lock);
 		write_locked = false;
 		if (err)
-			goto err_hw_exec_mode;
+			goto err_unlock_list;
 	}
 
 	if (!args->num_batch_buffer) {
-- 
2.34.1

