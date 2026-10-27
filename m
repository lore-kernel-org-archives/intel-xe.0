Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF9606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D9x+E5zR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D6F10E220;
	Tue, 27 Oct 2026 09:00:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F3910E220
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793091608; x=1824627608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pcv/0fjyDfJGekgvrkkMfgMntS1TojHilBH4NrXTFlA=;
 b=D9x+E5zRmWa2snmPDdal88WHWfMC0hg5bfnApTnOQWK7FYt9fQIWNk1l
 csz8YYAJSkDdNILCDecEvBcOgZ+o1S2yhUTtXxA2KEyjVD5azVKb+IX7s
 iMkfp4x15WztmqbltnAl+uEjqlwsS9u11oFl9CLuyrDKpQxA/FYMzT67I
 LYQ6DVwwCEA7zh2/GNVzPXMnrpjB+fQDS5Keaj5+JGLdPfe+bMuzLJFvQ
 pX9W1zCZe7NyS8rnDR8VqLQA/6+ancE735MWTzN2OuBGiuqUyQGq7P/F8
 0NQyl9lZl3zGg4a6Xlk+IkyaDxpetpeB32WzsS4k8k50hy7ofGbX+1XWn g==;
X-CSE-ConnectionGUID: 2MAiNRCDTcOf5TRUu+r3Jg==
X-CSE-MsgGUID: 4ASaJUE8Q3idcj9rnIJMug==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1662297"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1662297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:00:07 -0700
X-CSE-ConnectionGUID: yugmC9PcTfq6H58drb2BcQ==
X-CSE-MsgGUID: rSaHsigvR4akj8eWY9yajw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4446438"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:00:06 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe/svm: Preserve default PAT index when resetting VMA
 attributes
Date: Tue, 27 Oct 2026 14:29:52 +0530
Message-ID: <20261027085952.2882874-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_vma_set_default_attributes() replaces the VMA attributes with a
default structure. It sets pat_index to the saved default PAT index,
but leaves default_pat_index zero.

When the saved default is non-zero, the two fields no longer match.
xe_vma_has_default_mem_attrs() then reports that the reset VMA has
non-default attributes, triggering a warning in xe_vm_alloc_vma()
during SVM garbage collection. A later reset also uses the incorrect
zero value.

Preserve default_pat_index when restoring the default attributes.

Fixes: 4a938d3886d6 ("drm/xe: Merge adjacent default-attribute VMAs during garbage collection")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 909a602d091e..bc6902b5bf57 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -347,6 +347,7 @@ static void xe_vma_set_default_attributes(struct xe_vma *vma)
 	struct xe_vma_mem_attr default_attr = {
 		.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
 		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		.default_pat_index = vma->attr.default_pat_index,
 		.pat_index = vma->attr.default_pat_index,
 		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
 		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
-- 
2.43.0

