Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A90ACD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED4611A673;
	Fri,  5 Jun 2026 09:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nppWs4Aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541F811A673
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652166; x=1812188166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qLF1z48uEDQbHfycsiBOPyxvgZTKGrNcyG6uFhfKi8=;
 b=nppWs4AakZTBPDq9q3Qfm4YcXRKh2wepuSCLV+QH3hMdUTF5pNoByDA9
 C8oBLop54tI4Pjn78rjwb7rejX2HlkPDE6CcrspbHwCt+Uf6P6xnDGIvm
 niR1emuo3iUPWuo7X5yM4MWUPHh8KioSpVimZ/raYbypgkVc3ezR68YfT
 XIQLtx4IKy+Z/Xw15h8sLP3/brF1/g62DnlKUdub55XtpFV3kdTM5P5ad
 fmFMiYhgypGo4SbWni8+1aRknqbnhXHyqY5nkNDXSNpBLB7fvW4XkSh+Q
 lQDRvO5YxQUCEcNJPdHURfwaPO7KE8hgPcs+kVbwEGnfvkWoadW0hfWv/ Q==;
X-CSE-ConnectionGUID: m6vqkiNpTSGiI5Ntng4DuQ==
X-CSE-MsgGUID: oFlNESXSR7WcEaC2CbP5Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98904035"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98904035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:36:06 -0700
X-CSE-ConnectionGUID: M1Ay8w/wQpKyFDF9rEKK4w==
X-CSE-MsgGUID: 357KS6AtS++lcmyRAQ0YtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133766"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:36:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC PATCH v7 15/15] drm/xe/xe_ras: Process pages from offlined list
 and queue
Date: Fri,  5 Jun 2026 15:05:01 +0530
Message-ID: <20260605093446.4189929-32-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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
index 13f666fb8b1a..1f3c4a5f39d9 100644
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
@@ -297,7 +297,8 @@ static void get_queued_pages(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);
 
 		count += response.pages_returned;
 		if (!response.pages_returned)
@@ -317,7 +318,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_ras_page_offline_list response = {0};
 	u32 count = 0;
 	size_t rlen;
-	int ret;
+	int ret, i;
 
 	/* Supported only on platforms with system controller */
 	if (!xe->info.has_sysctrl)
@@ -341,7 +342,8 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		/* TODO: Process pages and offline them */
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
 
 		count += response.pages_returned;
 		if (!response.pages_returned)
-- 
2.47.1

