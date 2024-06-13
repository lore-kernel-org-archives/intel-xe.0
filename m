Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D79C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072310EACE;
	Thu, 13 Jun 2024 15:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmWN4x9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBE410EAD5
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292044; x=1749828044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9EvT4DZwkVy2p7pfntDSU4LS2Fw+vQ717AJvpUsqUKo=;
 b=gmWN4x9fd1YVYM6b6DpVACpZhzTbSgeUQ2l3KsGhRaaAL90WvuFj6IXk
 2dIfQirM2jHzhwGcv4HqE9MpN53aml3E69+qN+jQh7FOPprc0QK8WNkJ7
 ybooEDwy6hRl/01SXTSMzWc30v7eD7TKUzEiwtsEYdt/40WeMLTeyBSOv
 vuxT5ye6Vl4m+hECXkDbeXCuknyqogNZnJmglVKDTKgGuwk95/c51voy1
 4w5SVqu+L8IlVXdU6pt361GjOkcQ590zb6jFkTTr762cd0QZDWYg6B7bW
 y9/jJbMzcNqv5MDrdbpsRiofF7ccMXXlqc3AkkwnYZOhDixsHR+Ee3qEp w==;
X-CSE-ConnectionGUID: 5djvqH9bRkmphF3UhQ4ZVQ==
X-CSE-MsgGUID: wL6KOWQwQfmQzR6XRyri7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348653"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348653"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:42 -0700
X-CSE-ConnectionGUID: DQJwXMM4SgWKnRqRWy2TqA==
X-CSE-MsgGUID: vnsEYczRTyGHAlKp2ExayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135109"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:42 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 22/42] drm/xe: Add a helper to calculate userptr end address
Date: Thu, 13 Jun 2024 11:31:08 -0400
Message-Id: <20240613153128.681864-22-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

xe_vma_userptr_end is added to calculate a userptr end.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 1a5aed678214..89f3306561ad 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -146,6 +146,11 @@ static inline u64 xe_vma_userptr(struct xe_vma *vma)
 	return vma->gpuva.gem.offset;
 }
 
+static inline u64 xe_vma_userptr_end(struct xe_vma *vma)
+{
+	return vma->gpuva.gem.offset + xe_vma_size(vma);
+}
+
 static inline bool xe_vma_is_null(struct xe_vma *vma)
 {
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
-- 
2.26.3

