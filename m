Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE32BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7610EB93;
	Thu, 11 Jul 2024 20:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoNSfpw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0E10EB93
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720730756; x=1752266756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGS+qd8pQm52YKl28oKyTQz9vKBmW1h0yzX136OK7LQ=;
 b=hoNSfpw19t+I9S9CyGKa/0y6DfQByEz2JfCRgBu2+CMKamvE8KX0ewpH
 29PqlPzCOzezahauEcW0DNiSMIOOsY11JtKpiTZWKTIYULZa7a2fN3ct9
 6+B+mGSd60fTOrFa+R1fr9T1b1MT2CCgWntdWw+nBLEGfx1kLqHVm1NLe
 Pzn44P6CLNJeQvq2A+YfQlL+oEfs7A4oBNFuc8f3fBS9oXYF7HSXSkOw6
 do7bhFDfD5rv6wP0owxiwJR7Y6JIMhjoXxjjQhCzCl4LntLe+fwMMw6Mq
 64Hwe5DsoQHC76TDsrfe4FjTqsZLrh59ncX6UirYob69a44gNuwaV9a2Z w==;
X-CSE-ConnectionGUID: 2NUI3hFvTlWodVYWWjoK0w==
X-CSE-MsgGUID: /UHCTFZkTeiGRHx4UP7taQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18284546"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18284546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:45:56 -0700
X-CSE-ConnectionGUID: iPaNW347SZuRPMDTsUQ/dw==
X-CSE-MsgGUID: 2U49u++aQDmZHzsIVFJx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53620559"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:45:57 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
Date: Thu, 11 Jul 2024 13:45:52 -0700
Message-ID: <20240711204552.3724442-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Increment num_syncs after xe_sync_entry_parse() is successful to ensure
the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..95c0b21096f0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -156,8 +156,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	vm = q->vm;
 
-	for (i = 0; i < args->num_syncs; i++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
+	for (i = 0; i < args->num_syncs; i++, num_syncs++) {
+		err = xe_sync_entry_parse(xe, xef, &syncs[i],
 					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
-- 
2.41.0

