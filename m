Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABEFCA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 01:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBED810E086;
	Tue,  6 Oct 2026 01:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRsYzEkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0D10E086
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 01:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791251509; x=1822787509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5+R3RgfZCTzUP3fFbafEPQz4pvE3crAegOn3gbhO+uM=;
 b=hRsYzEkVTNNUOc3G6LX2pbC9X4EHVZGTC0CEg7mdBq4ignaTMgB9LBV2
 XIX6WVx6lBtLfGksY1t81vpFJXXE4hDR+xFMouBbjOGJ57/RNQOBIhG7O
 hsbJh7jFOTgl+6ZCgommZIZfz7aVmRllqnlsgNzmycZllvGl6gYfJx7me
 oCyGqVZPAgM822gHZJbd4OoQmjlAml7UU1i9DRlC1GxCnK5w5oZzPWKJq
 k7uPG3cJdGk5t24RMkz1s8J+L7ugEicb9oqhuSKdy0lT3MOpz1r8nBrkP
 tktv37KJ145T57Q8gj/pFMsMoi7SU4dWGpeHIzZmh9tBpLQA1svQkVFag g==;
X-CSE-ConnectionGUID: 0N+6ZDSNRqaCETueossjlg==
X-CSE-MsgGUID: pdBAWldRSyGK9Egp/1sJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90995063"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="90995063"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 18:51:48 -0700
X-CSE-ConnectionGUID: wc4FNRDLTzuFAXq55XBZvw==
X-CSE-MsgGUID: yDSfwdBQTNGZQrWao7ltXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1085102"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by fmviesa011.fm.intel.com with ESMTP; 05 Oct 2026 18:51:47 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
	Ghimiray@freedesktop.org,
	Himal Prasad <himal.prasad.ghimiray@intel.com>
Subject: drm/xe/oa: Zero OA buffer at allocation
Date: Tue,  6 Oct 2026 07:33:14 +0530
Message-ID: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
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

ttm_bo_type_kernel BOs are not guaranteed to be zeroed on allocation and
may contain data from previously freed pages. Since the OA buffer is
mmap'able by userspace, this can expose stale kernel memory contents.

Streams opened with DRM_XE_OA_PROPERTY_OA_DISABLED allocate the OA
buffer without calling xe_oa_init_oa_buffer(). Zero the buffer at
allocation to prevent information disclosure through mmap.

The existing zeroing in xe_oa_init_oa_buffer() remains necessary for
zero report-id/timestamp detection on enable/re-enable.

Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
Assisted-by: LLM
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a3484e943c55..3bb8bbef4c37 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	/*
+	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
+	 * hold stale data from previously freed pages. Since the OA buffer is
+	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
+	 */
+	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
+
 	stream->oa_buffer.bo = bo;
 
 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
-- 
2.43.0

