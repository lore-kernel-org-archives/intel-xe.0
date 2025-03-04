Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6FC282D3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 11:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1707F10E59C;
	Tue,  4 Mar 2025 11:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQGMB2lb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069310E2D8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741088297; x=1772624297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KACD+HRKWUt1KmXIIu5IM9U2jfv4bZXfbf1wqQzbCuA=;
 b=VQGMB2lbn+NmVFAjWz58eWims8MIh0GYWrg0hi6fECOrB0APjJ0muuKk
 W3bP/IGeugwdQmi5nS0KGLIkvqR+Ptgt5k7CdHW4z4fGv1lsTOF9mG37I
 vn1COGDO+UXVXyLJzwRyXQIasqQOQHVQXOrjkfqMuogi7j1qfoI57uNQo
 qFK15Ze2eLH4oEM7TwyFkW6BSAifQNqPcUbmW51TxUtQnbGwZsg9RqokA
 f55WInbU5RFuM5QM+N0tUcOmQ8RQFjzopcOpkpqEEioZqWIG2TQXnzxbc
 JxX+U3Pag9t2+sMv4pNl0FKXO751V/1VBOmaeywmqi1qCbXHaM4+Fj9mw w==;
X-CSE-ConnectionGUID: KF8dcforQzug6VdAZcHqpg==
X-CSE-MsgGUID: 7YhgrAmdSG6Gc2Ab3b/DLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59413169"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="59413169"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:17 -0800
X-CSE-ConnectionGUID: xZHQcpISQDiZaNjIZjCD+g==
X-CSE-MsgGUID: Yl8PLdEGS5mqLqVHVWMKbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="123471662"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.227])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:15 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/xe/hmm: Style- and include fixes
Date: Tue,  4 Mar 2025 12:37:56 +0100
Message-ID: <20250304113758.67889-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
References: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
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

Add proper #ifndef around the xe_hmm.h header, proper spacing
and since the documentation mostly follows kerneldoc format,
make it kerneldoc. Also prepare for upcoming -stable fixes.

Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 9 +++------
 drivers/gpu/drm/xe/xe_hmm.h | 5 +++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 089834467880..c56738fa713b 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -19,11 +19,10 @@ static u64 xe_npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
-/*
+/**
  * xe_mark_range_accessed() - mark a range is accessed, so core mm
  * have such information for memory eviction or write back to
  * hard disk
- *
  * @range: the range to mark
  * @write: if write to this range, we mark pages in this range
  * as dirty
@@ -43,11 +42,10 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
 	}
 }
 
-/*
+/**
  * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
  * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
  * and will be used to program GPU page table later.
- *
  * @xe: the xe device who will access the dma-address in sg table
  * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
  * has the pfn numbers of pages that back up this hmm address range.
@@ -112,9 +110,8 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 	return ret;
 }
 
-/*
+/**
  * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
- *
  * @uvma: the userptr vma which hold the scatter gather table
  *
  * With function xe_userptr_populate_range, we allocate storage of
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
index 909dc2bdcd97..9602cb7d976d 100644
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -3,9 +3,14 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#ifndef _XE_HMM_H_
+#define _XE_HMM_H_
+
 #include <linux/types.h>
 
 struct xe_userptr_vma;
 
 int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
+
 void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
+#endif
-- 
2.48.1

