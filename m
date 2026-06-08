Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A325CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3523110EF7E;
	Mon,  8 Jun 2026 08:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRcZzo8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEC610EF7E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908494; x=1812444494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbUGlEVJKAZuSDV1OV9NFCYl1zhaxSTC+o35S+FQlxE=;
 b=aRcZzo8DuwTQW+HMwdXVbUHl6KvTrKdi6u/UyqAsdDdIrcLgA9eT86+t
 gBSQCXcYJuV5oPRedoS+M2W0GzTqTJRPo2xk76T8RNuoLl46ZC1EZDoRd
 anhiq1vaAPNWHH6jpPlEKxd/rxjlusqkLgxxdwHnyk2OBejzJoQaHSZs0
 blUIxnY+ELDH2YkCiv2iR18ZXW6Ki7QMUv4mhRrsUmGP3G2xCaeIv9FVk
 eUIWHtmAqSTpB5Oe+knCICdsf56CMZSM8F5gPTMQZkz0nZ06y+TdG5sdE
 g/q0Z2AqzFh2rJzM84kiGOYuDAgUSl9ZnegywnvM6ADeCQH6IAv961lvK A==;
X-CSE-ConnectionGUID: 9NSrZKxBSKG6K/11/LHMmw==
X-CSE-MsgGUID: FVUR5c4uQz2tbCE+RlDnFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029140"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029140"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:13 -0700
X-CSE-ConnectionGUID: DwSKN40QQ4Gr+TTQsDqRuQ==
X-CSE-MsgGUID: W8zo04uzSl+HQ8ZIaToCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466161"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC PATCH v8 15/15] drm/xe/xe_ras: Process pages from offlined list
 and queue
Date: Mon,  8 Jun 2026 14:17:16 +0530
Message-ID: <20260608084700.640376-32-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
v2: remove newline (Tejas)
---
 drivers/gpu/drm/xe/xe_ras.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 604d122b61c0..9627be7a2042 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -288,7 +288,7 @@ static void get_queued_pages(struct xe_device *xe)
 	struct xe_ras_page_offline_queue response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -313,7 +313,8 @@ static void get_queued_pages(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);
 
 		count += response.pages_returned;
 		if (!response.pages_returned)
@@ -334,7 +335,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_ras_offline_list_request request = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -360,7 +361,8 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
 
 		count += response.pages_returned;
 		if (!response.pages_returned)
-- 
2.47.1

