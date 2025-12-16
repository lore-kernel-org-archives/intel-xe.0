Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FED5CC9D
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 09:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543CB10E76C;
	Tue, 16 Dec 2025 09:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJDCupFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0335910E76C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765878171; x=1797414171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ISlla7sv5LZnc3hcgVlvqc7VieUviPom+v5vfwH2qOs=;
 b=iJDCupFLZI7NzVCxUERZSezOFhMdaHlqHJGfY6WSXTjJXhWKKCm2KNiH
 vBLQlNmX1dkW6k0DgJ0LiEalnSBTedFY7c6qjD3TaGjVOe01Q0Ufv3Du+
 JPzAGeOEw7fA8gDq5zcOl5+TFpkCj2Y+d5kNEh5CtIGkPnaPPIOLNDR34
 CCMPNMyN30ZzEBBHZlZphUOMOIUnBQevJbdqw4l9YN4D+DcHearr1iSBy
 AkPLac33gnrKD7gT6PRmNH4WIItvFWZ/ln1hkCmT1fCGVVx13P5NtbBPC
 4X337zQF0NJSBmBHPDV0xGtdiHn8obIMfg/49UXKL6PEuwfEuNWpNxvL4 A==;
X-CSE-ConnectionGUID: ajhV4GukRMqSTf/dZ9l6NA==
X-CSE-MsgGUID: Gg2B2W8sQ3aS8BeIsfjGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67946629"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67946629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:50 -0800
X-CSE-ConnectionGUID: szQAB6vASeStKBqt5Ehfiw==
X-CSE-MsgGUID: 8jZIKVpbTL+fBSKWWtwy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197868107"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com
Subject: [PATCH 2/2] drm/xe/xe_survivability: Fix static analysis tool
 reported issues
Date: Tue, 16 Dec 2025 15:42:02 +0530
Message-ID: <20251216101159.332558-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251216101159.332558-4-riana.tauro@intel.com>
References: <20251216101159.332558-4-riana.tauro@intel.com>
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

1) use static survivability info attributes.
2) fix visibility condition

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7ca3e2851a5a..0bcd1ee64116 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -226,15 +226,15 @@ static ssize_t survivability_info_show(struct device *dev,
 		.index = _index,						\
 	}
 
-SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
-SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
-SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
-SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
-SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
-SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
-SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
-SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
-SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
+static SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
+static SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
+static SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
+static SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
+static SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
+static SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
+static SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
+static SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
+static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
 
 static void xe_survivability_mode_fini(void *arg)
 {
@@ -257,9 +257,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
 	u32 *info = survivability->info;
 
 	/* FDO mode is visible only when supported */
-	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
+	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
 		return 0400;
-	else if (info[idx])
+
+	if (idx < MAX_SCRATCH_REG && info[idx])
 		return 0400;
 
 	return 0;
-- 
2.47.1

