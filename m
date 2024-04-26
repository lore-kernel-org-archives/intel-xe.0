Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D529C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 23:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE231131C2;
	Fri, 26 Apr 2024 23:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M91vQ1Xv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052C91131C2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714174324; x=1745710324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DWZTfiX3kuO6n+/R+6e4hbeu//yI5YH8Pwkk8mqsm/g=;
 b=M91vQ1XvompaUmf25QE4pDcAfhhboYFHomTR7Thb+BDtPXIuxwL2DVCA
 Thb1lsbO2ouQS/t8c9ZbarS/L2u2zFZg3uXdZ1jc86aci5gd7Cl0MML2K
 EHFMaVSEYOnw+Z4+cVMiiTSRAE6UX+L0FXfQI1xugNty+WTF3vjF2+sXa
 T8FkDXX4EhyM6dBx7ku+LxKtANTu9z3A+PbWYSDNujuS9L/ZyZ/0g60U3
 BQ1xTPvoOPqgMK2fqD9AhZm2eVUVVsai2pv0EEbXP0RcUHd7e+uUhHNos
 UYOFHrQkSMAMOyeQh4PuqU5S/xqNzuKXESAj6qemixMoShPFCxpremLEz w==;
X-CSE-ConnectionGUID: ah0VIpE+QTGb7rxUUs5UOw==
X-CSE-MsgGUID: wOUGu/YERDG7ekLgCauT0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21333511"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="21333511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 16:32:04 -0700
X-CSE-ConnectionGUID: hHhcEkHUSsOhYm3fR8lT8w==
X-CSE-MsgGUID: RQEF/hVLRCiEHaa8YsBVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="63040669"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 16:32:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Unmap userptr in MMU invalidation notifier
Date: Fri, 26 Apr 2024 16:32:36 -0700
Message-Id: <20240426233236.2077378-1-matthew.brost@intel.com>
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

To be secure, when a userptr is invalidated the pages should be dma
unmapped ensuring the device can no longer touch the invalidated pages.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Fixes: 12f4b58a37f4 ("drm/xe: Use hmm_range_fault to populate user pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: stable@vger.kernel.org # 6.8
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dfd31b346021..964a5b4d47d8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -637,6 +637,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	if (userptr->sg)
+		xe_hmm_userptr_free_sg(uvma);
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
-- 
2.34.1

