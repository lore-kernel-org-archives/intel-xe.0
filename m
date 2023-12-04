Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234CEC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA2110E1E9;
	Mon,  4 Dec 2023 05:18:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7C010E1E9
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701667132; x=1733203132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SzR0aH/PquqEMi6v+koNfa4im/yB+kypcbf1vQQ7E0k=;
 b=Zq3ne/RRFxuPBOlVnTSRUBZHLPxy8VAMB/C27oafZSEUBtzz8IgDBTGy
 pmAlJ6rm9xu+Xz89FuQlpOgHs6AkY+3xOuncedNxuRGot3Hc4eLkjWBMg
 Y1Duh+Qlrd621Myie9iZWmIZdfDf/AUHCAkFeR9jZCwyxQsbBUQKtRbx7
 FshKrzSxMz1pTJNxTih6qu62SXHXPdfmkHRbIOW7pzGQcNErmaGa/le4u
 x5lwUOwIf/VpNLxDA3+wKvY0NfigyEVRFDkAOKnaShChBnLT25v8lQC0R
 dn0u41ZamT7RiZVM1Ud7HjUfkPaSfu7+lY6cG8VQILGaaijXAusEauT4S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396494425"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="396494425"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774143126"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="774143126"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 10:56:09 +0530
Message-Id: <20231204052609.3283031-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231204052609.3283031-1-riana.tauro@intel.com>
References: <20231204052609.3283031-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] CI drm/xe: Enable d3cold
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

CI only patch.

Enabling d3cold to test the mem_access at ioctl level
with d3cold enabled to get CI results

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6b9031f7af24..f1b1544482de 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -13,7 +13,7 @@
  *       Before we can move this to a higher value (like 300), we need to:
  *           1. rewrite the VRAM save / restore to avoid buffer object locks
  */
-#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
 
 struct xe_device;
 
-- 
2.40.0

