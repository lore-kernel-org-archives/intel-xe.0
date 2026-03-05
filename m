Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7294F3D33D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 17:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363BB10EC3E;
	Thu,  5 Mar 2026 17:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwJpdoxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7128410E2C9
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772730949; x=1804266949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CItLSW5haNdOPU46FtCvKZtH9VxSiS+czz/ftytKoCE=;
 b=UwJpdoxkzUykgGFIy5xstycSlYdUOoWKJyYLQ7zW4g9uoXZYQ7bWRKBQ
 eSJVBYUixY3il9HUihwOwHt2+PgfYANZW2pFYhnrXFrIPdpeQN4PiqGIo
 /BHiMUBAdvUIKmD+vtDO3g8UgjlY14c66FdBxIup8i+/BMSYNOdLDX19k
 ReqbYMRLztNn4bpzqX4fVoekk0RaS4CsozsCX31yi9/NTOlgv3TzMULVh
 WKkCjh6xDAbMK0JFRHPgYFkcru1z6uxd+msZwZJJsIUmyB6pJ20dyleQI
 ormHYUHuBu0+gntMwztMUmJX+qC+eG+6KlTZxMv9x0p/2hPwT7ZU+FpCA Q==;
X-CSE-ConnectionGUID: daUjsDwjQj++FukTvRGUBg==
X-CSE-MsgGUID: Em3GS/IASWKCMU1D0a1rfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73874639"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73874639"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:15:48 -0800
X-CSE-ConnectionGUID: C6Iwwrv6TC+O+XS/tfGWkg==
X-CSE-MsgGUID: dyVDtrlVRvW2jIYAKQAOHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223231268"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 09:15:49 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Skip adding PRL entry to NULL VMA
Date: Thu,  5 Mar 2026 17:15:50 +0000
Message-ID: <20260305171546.67691-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305171546.67691-5-brian3.nguyen@intel.com>
References: <20260305171546.67691-5-brian3.nguyen@intel.com>
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

NULL VMAs have no corresponding PTE, so skip adding a PRL entry to avoid
an unnecessary PRL abort during unbind.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 60b0fda59ce3..da1ed99cd3f8 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -27,12 +27,18 @@
  * flushes.
  * - pat_index is transient display (1)
  *
+ * For cases of NULL VMA, there should be no corresponding PRL entry
+ * so skip over.
+ *
  * Return: true when page reclamation is unnecessary, false otherwise.
  */
 bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
 {
 	u8 l3_policy;
 
+	if (xe_vma_is_null(vma))
+		return true;
+
 	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
 
 	/*
-- 
2.43.0

