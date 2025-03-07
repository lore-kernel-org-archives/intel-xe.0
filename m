Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013E9C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 10:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E110EB1F;
	Fri,  7 Mar 2025 10:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D77BQDOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB6A10EB1F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741341686; x=1772877686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QaeFnfVXIaYd7lc9rQC/DSMbCMI/3iuDx80GnLUkgps=;
 b=D77BQDOQ+L5Jt2TwNxF7u0lscJhU0LZicqk1lUq+b1iHSdhJuGHABFvo
 OZ+fCSN10mzMnwKAeTT1frsV6vveHYAp3DISpozSIQRlgbq+Xqf24CUdU
 VSQRB4un6aWwbemNIkr2yEMSMd/1uIyMJJjdb7L6/4U/NAFXTXjWE1F1y
 +0iSl34ovpU5wHGoYm62pFhQeZanwTQbBs0uRGZsHwyHK8Psf785za8KX
 zS/xl5j016wuo4N/0Q3fymMCJ7ZxxnRYNvaI5wZxihD52N3O/r6INkGEs
 U1n5nPHxo3tQzaV8dJJyVRCwr+jDkFXWwh2xOaCUt4Ylm0u27y5nUxmQE w==;
X-CSE-ConnectionGUID: VvbMAWwjRDujCgkqY468vg==
X-CSE-MsgGUID: gmMZPVlVQSOx3IO+JhMgnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52592821"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="52592821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:01:25 -0800
X-CSE-ConnectionGUID: wxKnR7kOSLmJzSKbLUyKVg==
X-CSE-MsgGUID: Kxf1oxA5Tuqbai9BadrtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="124203515"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:01:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/userptr: Fix an incorrect assert
Date: Fri,  7 Mar 2025 11:01:09 +0100
Message-ID: <20250307100109.21397-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

The assert incorrectly checks the total length processed which
can in fact be greater than the number of pages. Fix.

Fixes: 0a98219bcc96 ("drm/xe/hmm: Don't dereference struct page pointers without notifier lock")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 392102515f3d..c3cc0fa105e8 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -138,13 +138,17 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 		i += size;
 
 		if (unlikely(j == st->nents - 1)) {
+			xe_assert(xe, i >= npages);
 			if (i > npages)
 				size -= (i - npages);
+
 			sg_mark_end(sgl);
+		} else {
+			xe_assert(xe, i < npages);
 		}
+
 		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
 	}
-	xe_assert(xe, i == npages);
 
 	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
 			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-- 
2.48.1

