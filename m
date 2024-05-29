Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D381C27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4008112C87;
	Wed, 29 May 2024 01:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVDV2dsf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD326112C8D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944727; x=1748480727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ABEEbzad8pXyk4la4P8ow/dD52UdLABNcL47AmdBCBM=;
 b=NVDV2dsfFjsDvOXKQt7kMjPB2usKcenJQX6cLusjKWBmeNB8nB/iNUks
 x5KbvWcJRdJEg1YIhV0BAhxxSLGt9JdSMBZso51CDuVb9Rk54qjAclGEL
 FB0JpVVtQFQEP1ZnwsSJxtGB2D4S8m53l7/fteQJZNX8PqMhAiL4sj1jW
 YmlPnrrbvCGb/k1G17a+RPrNBrFp1ybrd8fBnhSnCP2A5h8nXulcXD6c8
 D7/ZeXDu9BdQ3m1ZzxzPVzhFV9SXHJNcs5Mkn/zpV+ss5opUtuhptCoQ6
 weXXrD8VQKMx5wUsT88qqCmGi2XrbgWQbmXHQqznWCp2UFRrVQSH3y97f A==;
X-CSE-ConnectionGUID: gNWdJg8XQOiPoS2AT8Sd/A==
X-CSE-MsgGUID: gKGdnkoMTSyyF25ZItSTlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849787"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: 8kuEAxAZRPCtbPN2Og0CsQ==
X-CSE-MsgGUID: vFKi0lujTXiYD/pGhBE0Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700496"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 09/26] drm/svm: add a mm field to drm_gpuvm struct
Date: Tue, 28 May 2024 21:19:07 -0400
Message-Id: <20240529011924.4125173-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

Add a mm_struct field to drm_gpuvm. This is only used by shared virtual memory,
where CPU program and GPU program share one process virtual address
space.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 1 +
 include/drm/drm_gpuvm.h     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7402ed6f1d33..4b6fcaea635e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1015,6 +1015,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
+	gpuvm->mm = current->mm;
 
 	drm_gem_object_get(r_obj);
 
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 429dc0d82eba..ee5729bbb8f7 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -242,6 +242,12 @@ struct drm_gpuvm {
 	 * @drm: the &drm_device this VM lives in
 	 */
 	struct drm_device *drm;
+	/**
+	 * @mm: the process &mm_struct which create this gpuvm.
+	 * This is only used for shared virtual memory where virtual
+	 * address space is shared b/t CPU and GPU program.
+	 */
+	struct mm_struct *mm;
 
 	/**
 	 * @mm_start: start of the VA space
-- 
2.26.3

