Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05247D767C4
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 10:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA0B10EDA5;
	Fri, 19 Dec 2025 10:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKP50S1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731C10EDA5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766139787; x=1797675787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wUSCnFCZREArMllxw4liZBJb6myg7kPK0v1uBlEAQTg=;
 b=KKP50S1Ri1Tt5NJw6FiVFzX+h8bfLLwk1CotcnFMOI/yFyHS7G6JeGuf
 PI0eKuTxSsS0+UaPbvySd85a+la1FkmIPg8lyH0WWtsxs0G9Md6EXKCoI
 UgS6Po4pQLHbpxEWpA3AnVNsZ8XYk/9EyQ1EBRLnrd19p+X1rlK8zUp1F
 iO88LK6BGjiSLjJOsf43DqZntCrGgI6uWtyutwZGZmsdD0x8SEySfgIfT
 RQJ7Kic6CIa/Az1aDJ5m62LIGwch+WvuNPkMqu6MpzbYocwAtfqjMTSP2
 I1PIIQjcC4aagW4qg6bw1Zd5vLL/xDz2MNV3GJ/64R4SpoBvKMz5zb2sM A==;
X-CSE-ConnectionGUID: X6MbCt6kTrCeAoXdjrqlDw==
X-CSE-MsgGUID: g4BuDtQeQ3eEC/hknCQKuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67995801"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67995801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:07 -0800
X-CSE-ConnectionGUID: 17zeF6GKQaG5q+xXHlsAsw==
X-CSE-MsgGUID: bKbKPP9XSxWiCfKrynvjOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199647394"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:04 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH v3 1/2] drm/xe/xe_survivability: Use static for survivability
 info attributes
Date: Fri, 19 Dec 2025 16:22:26 +0530
Message-ID: <20251219105224.871930-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251219105224.871930-4-riana.tauro@intel.com>
References: <20251219105224.871930-4-riana.tauro@intel.com>
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

Fix sparse warnings. Use static for survivability info attributes.

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7520d7b7f9b8..e6e326dfb92b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -228,15 +228,15 @@ static ssize_t survivability_info_show(struct device *dev,
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
-- 
2.47.1

