Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97FACD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AE410E83D;
	Mon, 11 May 2026 16:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEq256Pt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639B510E83D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518611; x=1810054611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xs0Mk9Y85ojVCIr2n0WB6XgpmnRn5XCNRIehCjSrrOQ=;
 b=IEq256Pt9p/s8R+f/XUiENNbcKsEmDULielYz0HSkpxu2n1McBibF9NQ
 RJGAdHsWY/2qLosNPvm6TDqcfOGXeelnodzJTCekHsv4J0J+FTAvg/H34
 cbhH7MP05ZIRBPtAMCss/vWNplGxqJOlUqpPReTsRnM3SH8hoCbPnBUzk
 37r8KNrUxMlC2pZQTOnluQNrbIjDcX8spqZK3eIvq6kiAgGQhsWnccQ8x
 7BYl6lGlaiQMe1QSrhE/dvRBK1HHfJgzUZSNrleYei0nBObM3x0kl07v2
 omH+joFzQW2VzpwB8ua6GC2y4WHat3kGeuX29F0D+R1ol6Hx8xjJssfav A==;
X-CSE-ConnectionGUID: zVQNxoWhRTGKBkrI+vYyDQ==
X-CSE-MsgGUID: ea0BqngNSQipCm3ued+/9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513603"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513603"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:51 -0700
X-CSE-ConnectionGUID: ZgGPLFsmSXCBRxve5mKpmA==
X-CSE-MsgGUID: 7m8ACfSsRvuYbqmthaz25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988846"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:47 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC PATCH v5 14/14] drm/xe/xe_ras: Process pages from offlined list
 and queue
Date: Mon, 11 May 2026 22:59:21 +0530
Message-ID: <20260511172908.1122252-30-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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

This will be integrated with the related address-fault handling flow
once this patch is merged.
https://lore.kernel.org/intel-xe/20260506141143.4033299-12-tejas.upadhyay@intel.com/
Sending for initial comments.

On module load, process pages queued by firmware for offlining by
reserving and sending the offline/decline command to firmware.
For already offlined pages in the firmware list, reserve the pages.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 05a77db2ed8a..c23946d322d5 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -292,7 +292,7 @@ static void get_queued_pages(struct xe_device *xe)
 	struct xe_ras_page_offline_queue response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -316,7 +316,9 @@ static void get_queued_pages(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);
+
 
 		count += response.pages_returned;
 		if (count > response.total_pages) {
@@ -333,7 +335,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_ras_page_offline_list response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -357,7 +359,8 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
 
 		count += response.pages_returned;
 		if (count > response.total_pages) {
-- 
2.47.1

