Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267DDCA0ED3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 09:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9210E71F;
	Wed,  4 Sep 2024 09:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehbezoyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393DA10E721
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725443246; x=1756979246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/eBfWGusjjgTjUn3KWfOe3bERc/PXX61z6Gtbm8yTA=;
 b=ehbezoykgWYcHJ5M7unEknngDYxBghfDEats2K8/dGmQeubcC0We1zAT
 mBvial2ojkGkn62snL7Zofu0eWJvt2iPwn1yhnBJdKQF0ljRMwPOBd8dq
 bcyv+ZZJCogxrDCL12xrNpSM9SbdyEBbofnLId2UvZdmamXAwjkCCrJgt
 z26X5wkcwGvOSrv2VmQzRxm54PK5lMJtBpLnF1XPEaYR/dEGVN/5AZQ7q
 Bzy28TZqdr5I7NaCNYSGmQn7sWhcrenUzX8ipW+N1+DqfbANHcTpDfFRc
 qknHI6Jd+nn8GvxOQB3uEC2qLn1gGD7FdfzY4HDs6W7UAvsPD9TFEXd+8 A==;
X-CSE-ConnectionGUID: ZNCsBIcEQiCBcSMuuaRH0g==
X-CSE-MsgGUID: tXSoYALHSueLfqh2GOrxxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41564322"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41564322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:19 -0700
X-CSE-ConnectionGUID: Sp46RhZbR2Gf+ftYj/YngA==
X-CSE-MsgGUID: iCvGcKP7TJe9GRpcrHwWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="96013983"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 2/3] drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
Date: Wed,  4 Sep 2024 12:46:48 +0300
Message-Id: <4868d36fbfa8c38ea2d490bca82cf6370b8d65dd.1725443121.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725443121.git.jani.nikula@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Avoid including PCI IDs for one platform to the PCI IDs of another. It's
more clear to deal with them completely separately at the PCI ID macro
level.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c   | 1 +
 include/drm/intel/xe_pciids.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c05ca61787be..b1cf21d77def 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -387,6 +387,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
+	XE_RPLU_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 41617c5ac6ab..334ab02ed6ca 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -122,7 +122,6 @@
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
-	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__),	\
-- 
2.39.2

