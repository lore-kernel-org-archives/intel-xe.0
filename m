Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB61C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 22:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105AA10E54E;
	Thu,  1 Feb 2024 22:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YD7eF+QW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60210E54E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 22:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706828072; x=1738364072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kH2atKQluBFly86tfGn9BTdLABonoRDTEqiFUZhmSpk=;
 b=YD7eF+QW79tzruJ/dE+VbHomyqD5N8q7LomK2imwPJzgh4seH4fDO7gX
 /uY7Hpqog9pAw+BIWchQCD86hiIi+wJQf8OEgRpJjESmWVhpjBVj170R0
 DTHMIcHPAfbk2RLuK6nagFrykH5eTSl7KSNiE7DRjQ4r905pwuzYz/hTQ
 +pUWq5ukf854O6DZSk+19uLkoEVFxACSO9CQw9i4SE0vKddch/ojIHPN5
 NYM4wW5fE2OXTP3vQwa16yX+d08cHE86ViTpmrx/HxyiNopPlru0qul/h
 Nzgj9jjW95AtalV2VY09egiAbthdAHrcl0CkMtr+xMSH5dfAGpBwILtWr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="248433"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="248433"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="37338208"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 John.C.Harrison@Intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 tejas.upadhyay@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Avoid crypt message when there's no GuC definition
Date: Thu,  1 Feb 2024 14:47:24 -0800
Message-ID: <20240201224724.551130-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201224724.551130-1-lucas.demarchi@intel.com>
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
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

If there's no GuC firmware entry in the table and the user didn't pass
an override path, the error message is very crypt: xe will simply try to
continue and then fail when submitting the default context:

	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
	...
	xe: probe of 0000:00:02.0 failed with error -22

Add an explicit error message and bail out:

	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
	xe 0000:00:02.0: [drm] *ERROR* No GuC firmware defined for platform
	xe 0000:00:02.0: [drm] *ERROR* GuC init failed with -2
	...
	xe: probe of 0000:00:02.0 failed with error -2

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c7541f1a5c0b..742170bc1a9d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -665,8 +665,13 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			       XE_UC_FIRMWARE_SELECTED :
 			       XE_UC_FIRMWARE_NOT_SUPPORTED);
 
-	if (!xe_uc_fw_is_supported(uc_fw))
+	if (!xe_uc_fw_is_supported(uc_fw)) {
+		if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
+			drm_err(&xe->drm, "No GuC firmware defined for platform\n");
+			return -ENOENT;
+		}
 		return 0;
+	}
 
 	/* an empty path means the firmware is disabled */
 	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
-- 
2.43.0

