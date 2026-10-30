Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77520606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OnVDZanT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C6C10E387;
	Fri, 30 Oct 2026 14:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EBE112872
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793371569; x=1824907569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7FU7xs2OP3uCEOmgCVtOMfwSPQiW8wP7v6Z08nRNDQ=;
 b=OnVDZanT2cI/jhChl5DwNhHi1QiHRSS4aGNR2U/LDD7fqV4++pBnm38R
 NWpAGAkmOnNJQsffQds+0CyBRscM2P8ekOBRiDdcAE29wj1E3ZNGrvqEZ
 oC0y/2EStyFdC5ptuu43RcrxE6GNHG/k2xB7pvZBjd2++LgahhPOIx3r1
 UKk8uNuypFEJQ0cF7D2YCz0DOJCjsz7qX/V8th9uiuovlzGCtzCgxBNB3
 LaE7VAom5nI92KMNthIZdicQODCg25EGkBFldU8rFlkkzDBzSX8mIMDU2
 H3V+Ht/iuV+OWT7GzEDptFi1LOJTnwms2Bh9lOu8APVDwL2s/UKjK3YvQ g==;
X-CSE-ConnectionGUID: XFCKIPeOS9yxGjjsLlQ6Dw==
X-CSE-MsgGUID: LpyYWpQwQ6WVx237b6jn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2012675"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2012675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:46:09 -0700
X-CSE-ConnectionGUID: W6arZsDgTceWARv5wqGVKw==
X-CSE-MsgGUID: oQALnRszTZm+gJE6k1Dv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5588646"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:46:05 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v6 5/6] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Fri, 30 Oct 2026 20:15:53 +0530
Message-ID: <20261030144547.2532309-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030144547.2532309-8-badal.nilawar@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable late binding support for CRI

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3e6f8f936235..ba23ec60477b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_sriov = true,
 	.has_sysctrl = true,
 	.has_temp_sentinel = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
+			  BIT(XE_LB_FW_OCODE),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.56.0

