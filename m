Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A1C282D1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 10:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A131010EC6F;
	Fri, 28 Feb 2025 10:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJnchtrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA0210EC71
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740739477; x=1772275477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KACD+HRKWUt1KmXIIu5IM9U2jfv4bZXfbf1wqQzbCuA=;
 b=PJnchtrVuj7bFIJBETSf93zICkaY7fHr+BT6EEM0t2l3OLz0mCIwhQeG
 XusNeVAItp8EWd2x8azLjs3bUhyodwtsdkuXYbWczjjpouNa8NIqPtKOs
 scGCqkVwdegzIfUvOuYac+x1KF3/hxR0byuaqApOS63L1RuN69ndHmU22
 YGmmwKRlEsLmsF/uY4Axf2F3gDjfCBKp29T8liJ6HBUVfFwhF+bMWE/2F
 GFhCK9IkMB4yUBf64YmY3VmwUjABYXdMoqAi3z7/huy2WATmRhIxLIEqm
 ebPlnV0nKpLaqEzfTn8sUHIjKRPOEh+bqY4BZCl+l4MUd2S2L3NVgCym7 A==;
X-CSE-ConnectionGUID: 4xtT4VMvS9yokwTxE3hqGw==
X-CSE-MsgGUID: WAwXAmq+R+GhBLBbL45grQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40840562"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="40840562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:44:34 -0800
X-CSE-ConnectionGUID: POcrjnFfShmIE5inW8tyMg==
X-CSE-MsgGUID: Uq63RyckS62FOP544wKp4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="148114580"
Received: from monicael-mobl3 (HELO fedora..) ([10.245.246.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:44:33 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/3] drm/xe/hmm: Style- and include fixes
Date: Fri, 28 Feb 2025 11:44:16 +0100
Message-ID: <20250228104418.44313-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228104418.44313-1-thomas.hellstrom@linux.intel.com>
References: <20250228104418.44313-1-thomas.hellstrom@linux.intel.com>
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

