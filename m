Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D87C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0672610EB2C;
	Tue, 25 Aug 2026 17:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awUusTBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C76610EB2C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679777; x=1819215777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHVkDQ5n+oxprVAajjRniWzUnh8p9kk5nFdvqcunvf4=;
 b=awUusTBGt7viirKvH7uCIJ6DKhHO5c3HVYUFbbVpONsCWWZJJZr6XXBP
 5HoMwOagXRRVYZkGeBnlT31ihgLFhsMlWYPu0U5YT9WM4vTa8+RNdGIIE
 Mc0aoKLnqr9w4gge/LVHoSDXdkkmSRwNhwhtVr7xCkfiZSuRy2vRchfXh
 mkluw+OFma6+rCWzE7XoEGuznSn1yPtmC91oxYOQTCva7cAZe/ndApZaJ
 MICAyuWKB49B10633FwTKhdirmLoE3vEnhc9Tuj+OZMM18Z5KmHcptWTW
 VcwCmbK7b9oNTgyJJGEMLqa5K/vMT6mQqRSXyIiKUGbh5p2vtOwUm3/3U w==;
X-CSE-ConnectionGUID: bmTsxkMHQtGe1Ob3ch1wDw==
X-CSE-MsgGUID: u5nxgacvTfKI2S19aRmHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210822"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:57 -0700
X-CSE-ConnectionGUID: r9wK9bjKSAK1oqODbNK3Zw==
X-CSE-MsgGUID: mQ7JM8nuQGmVuQeLNPka5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585119"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 08/11] drm/xe/ras: Report device memory errors using SIGID
Date: Tue, 25 Aug 2026 23:29:25 +0530
Message-ID: <20260825175916.1103841-21-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

Use xe_log_comp_info helper to report device memory errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b4cdb5ec6491..172653be1b82 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -409,14 +409,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	 */
 	switch (info->category) {
 	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, "[RAS]: Poison error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Poison error detected\n");
 		break;
 	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, "[RAS]: Data parity error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
-		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
-			info->sw_address);
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Double-bit ECC error detected at sw address 0x%llx\n",
+				 info->sw_address);
 		/* TODO: Add page offlining for Double-bit ECC error */
 		fallthrough;
 	default:
-- 
2.54.0

