Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A612606A325
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W0usVatb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1D10FE28;
	Wed, 28 Oct 2026 18:20:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2552E10E6EA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793211609; x=1824747609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HACdGj2qPVtV6kxCrJnA5Ifr2u/8jRI1dBBtwRbrC0g=;
 b=W0usVatb3IN5dFFvoSBbWLVbG96+5afsa9tory54GugvPGftk4CrSV8Q
 8HtQHVFgglq2WYxakwypUk1YFYTD+I4YIH29F5ErnPwJZxoSQSeDMXn1M
 eCaPZzoSakiOJpnHRQhkYKOsP/vSxklC3wP2KYd7MS2DG72eQUluum/x1
 jb+QWydzMDx1TYWJka8AZChBaSdglM6dYW/HRXXeyD3WoGSClf1yxQh2B
 6wrS41t5XSJkBbNN9hlLa3fyiqF2qWEMdJYkh3X8UaqPOy2u82i39M3YD
 vb2gdQ4Tsjlwx3fH7DwA7UXw6uGzQiuMXN/jV272TPo/vt1rs8urCMk9a Q==;
X-CSE-ConnectionGUID: GN1dz++zSsqTHaX8E9eZFA==
X-CSE-MsgGUID: L0eFhXYGSdG3bOh+Mdogrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1819267"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1819267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:20:09 -0700
X-CSE-ConnectionGUID: ug2pRzO/SLGd4IlG8PeCTg==
X-CSE-MsgGUID: L+caROATSJ6pL9UzRrnIvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5003001"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:20:06 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v5 4/5] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Wed, 28 Oct 2026 23:49:56 +0530
Message-ID: <20261028181951.1093283-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028181951.1093283-7-badal.nilawar@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
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
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a3e035a077c8..a18eed8d1a97 100644
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

