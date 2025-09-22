Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D999ACAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 15:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5F410E09C;
	Mon, 22 Sep 2025 15:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8hw2+Ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E61F10E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758556545; x=1790092545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FNZaVczFJ9KylUoU9q2bsrgQAkVEYcePItvLqRfIz/s=;
 b=M8hw2+RokWUQjp1SPNvwixkXxMDB4IcYVIyS1g+h4v2iv0Wd0jl4sAsF
 xnK+VcpOCB/Wh/ib6jkremQf96g2GpWsMgusxc1pYRdo/my9dncUDXsaU
 CnNggGSXTNJJ5Pb+Si2X+2grFXOdveXcfKPlqszNHHkdfjNinqWS09akM
 tPWjuGbz1ByNEGvqCCasdlO2nZ7zwvvNlLHB3so9O0eK8LOCXXENdhL88
 IkR3xVXn8SOb8q2yrR9UZkFy77dHo+Zgx+sge9JNWwzNwEKOo95u+T1kk
 tK1BINoETE9iboX1dRfPFDlfNW/UCswTOG+Jp380ZM/Vzx6RaEyt1az2f w==;
X-CSE-ConnectionGUID: n9jSVkeYQmmOVnieoveBXA==
X-CSE-MsgGUID: PpM1yuVPSJS5DryJ7o7ngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60039410"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60039410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:55:45 -0700
X-CSE-ConnectionGUID: gJPfQgJ7RGeSu7xT+ZQ7cw==
X-CSE-MsgGUID: HyUPTjfWRFCHTZiLy21IVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180523435"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:55:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 raag.jadav@intel.com, lucas.demarchi@intel.com
Subject: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Date: Mon, 22 Sep 2025 15:55:44 +0000
Message-ID: <20250922155544.67712-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

lookup_engine_info is described as such:

"Lookup engine_info. If @mask is not NULL, reduce the mask according to
the instance in @pattern"

According to the description, we should be exiting the execution early
if mask is NULL.  However, we appear to only do this if mask AND pattern
are NULL, as opposed to when mask OR pattern are NULL.  Fix this.

Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8a9b950e7a6d..0c048d4a33ab 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
 			continue;
 
 		pattern += strlen(engine_info[i].cls);
-		if (!mask && !*pattern)
+		if (!mask || !*pattern)
 			return &engine_info[i];
 
 		if (!strcmp(pattern, "*")) {
-- 
2.43.0

