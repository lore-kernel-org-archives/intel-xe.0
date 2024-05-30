Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C269C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CEB10ED68;
	Thu, 30 May 2024 00:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N53F9INN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE310F01D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029210; x=1748565210;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ABEEbzad8pXyk4la4P8ow/dD52UdLABNcL47AmdBCBM=;
 b=N53F9INN2XmHs0x6eeD8jnDS2M+JoHf4NliTKpIKbMLV+DMO30q7Q0qg
 Ng13wbrSxHrFq+yzdinGAnlUhRACXmE2xPR5Q8dOM9fV1nEWgMbdS+I3r
 MlxoIeevKNxCx/wDUK+lKol50W2FtRN5dYlUm/i0NkwWmDIiJkAHEq+2/
 2VfILfLPS0bz6NksZl3daXqU1GqvOzU45WCacd09kYsgmMzZapm2+p/dm
 AIGTC7OADPefWTpA1pPPQQngp5qyYW2pSaO3uhfplBF7O6WYLnWOC23G8
 kE7zHcBlyuAG1LhiVZQri6TXnSl4jNr6073VaiRY53ko86ZIJkjG0yFWO Q==;
X-CSE-ConnectionGUID: cKoA0b2vTWuSgSm79fpYPg==
X-CSE-MsgGUID: ZfFoyOa0RieIJLXbNij1sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975382"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:23 -0700
X-CSE-ConnectionGUID: wFgLF9tLQc21bJ9vzv1yeQ==
X-CSE-MsgGUID: PHebM6+fS0uV3TegPdjnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088734"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:21 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 09/26] drm/svm: add a mm field to drm_gpuvm struct
Date: Wed, 29 May 2024 20:47:15 -0400
Message-Id: <20240530004732.84898-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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

