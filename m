Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674BCD5BC8
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED1E10E111;
	Mon, 25 May 2026 09:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5CgnxSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D5010E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701651; x=1811237651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBurxg/HtaHffshTH3ybTQR0zXO7i0z1cPuC5hRcv2U=;
 b=N5CgnxSgNDu1lH3sWX47QYIyHheeRvhc258y53lnc3dI2R5cQd3QBhTN
 6W8aq7KcR7NQOpKB1soz7/qq7MLLIhXzHeRA5gG0yRNFbeVZQScNoybhQ
 lp61S7W/VKU85O+B+I9H6/dM7Vj6/tIQxaZ4X9o2gE5zkmi/XIfQoHOhr
 TSJ7njViFd56gXCM8z3Rh7D6n6vztrpFTt9ellhwVrmnbelmmsaC6O5UF
 mRXQBp5SBT4LqM4ZPUS0nnfBklECuwBWSmEAw+i4TXIAmJ2jIyXKfIWXl
 q83CUi2X6w1O0n6MW42hCbPu9cTW7JDWFFJrrrCYIts4aKEXPQO3rK7BR g==;
X-CSE-ConnectionGUID: xvyepW3zQgyc+oTeYpezhQ==
X-CSE-MsgGUID: 7+SkEMJ3SwCTDYGzy+gBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046867"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:34:01 -0700
X-CSE-ConnectionGUID: po3u9vWoSGSMop/Iq5QVjQ==
X-CSE-MsgGUID: ZMOzkYqnTAeGOZrIUII7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669736"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC PATCH v6 15/15] drm/xe/xe_ras: Process pages from offlined list
 and queue
Date: Mon, 25 May 2026 15:36:34 +0530
Message-ID: <20260525100619.3155663-32-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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
index 32c8ab587e2e..bbe30c804513 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -272,7 +272,7 @@ static void get_queued_pages(struct xe_device *xe)
 	struct xe_ras_page_offline_queue response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -296,7 +296,9 @@ static void get_queued_pages(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);
+
 
 		count += response.pages_returned;
 		if (count > response.total_pages) {
@@ -313,7 +315,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_ras_page_offline_list response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -337,7 +339,8 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
 
 		count += response.pages_returned;
 		if (count > response.total_pages) {
-- 
2.47.1

