Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D5CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF110E430;
	Mon, 20 Oct 2025 12:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHeSL5gU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6710E430
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964884; x=1792500884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1TI/oM0VZjmX1qHchtqv8PYvAN20anecapNCF1qVmd4=;
 b=PHeSL5gUMlq1HGZ3tR07+QMiRb8OoXDUUby+Rm+epRbToOcLdV9ywMpR
 gS9S8gdhxxzOBnnxaG74hJaEDHCAKT735KA5Zvp4mFrApmjG9yLSFcuLf
 4KmvUsUl+P6XADN9XLUYDvSMzXz6lP8m5AjuZ7HxBn+buwdRhw2Vlu6WN
 BrArQRv8AYePr9Ed9u7xL7Zg91iTljJMln3/tO7aQVvEZO/RxpB4ZKLdd
 sOtgZyIrJ1Ontij3IlKTlNVNQ8CYB5fj7slpOzqeWxKId+llbcdeLY2BA
 HmC+c3RE/qWCp27Yi10NgpchiLtSaOkgIudD3kW2dFPOnn0tM5SZ32PDh A==;
X-CSE-ConnectionGUID: MQlTtBH/RSy9ZntLjzpJTw==
X-CSE-MsgGUID: +tnklbKrT3qwJQXBACrcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422395"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:44 -0700
X-CSE-ConnectionGUID: /sYhjwhhTYuLj1wmzJEkyg==
X-CSE-MsgGUID: 55oVu2tjSdK/znZtZWBvWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512886"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/7] drm/xe/migrate: fix batch buffer sizing
Date: Mon, 20 Oct 2025 13:54:35 +0100
Message-ID: <20251020125431.41153-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020125431.41153-9-matthew.auld@intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
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

In xe_migrate_vram() the copy can straddle page boundaries, so the len
might look like a single page, but actually accounting for the offset
within the page we will need to emit more than one PTE. Otherwise in
some cases the batch buffer will be undersized leading to warnings
later.  We already have npages so use that instead.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7643715f63cc..665ab38b39f1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1894,7 +1894,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
 
-	batch_size += pte_update_cmd_size(len);
+	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
 	batch_size += EMIT_COPY_DW;
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
-- 
2.51.0

