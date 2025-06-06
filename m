Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B687FC678DA
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48D10EC9D;
	Fri,  6 Jun 2025 19:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYFFJVqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D127810ECAA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239472; x=1780775472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3LCqJW5fElvPmDEY2ygFPbktiAPtrjLbX1S5EEu5Zw=;
 b=ZYFFJVqaP4g3aRPOiSkNfYTKG+FGIdDnJbyANVjIX3ppNIfCobRYuxm5
 1/NaEpNk5MCtsTZESU2A94hcDkavLPbchWevpNxy96Ncq1gE1Eii+oUYr
 +KX3V1HS5QoiBSDVf3jvvau/Slww9QIyffq3XRwwx4d0D/aoqYFBjIYQT
 hoDVmJA73OrLCSRtg760nzjYlq10OprZbIpRaB8nDlsTiHJyky1lxDjM6
 TM7gW+0AYbCukoKWtGb8E8chVJEkazknPBoe6lrQlr9TnvqfXLV2jbAku
 mi6uSazxs5SbWog1dh//jegFnhYLfVRrhfdk5SdpZBm2IPEdTxP2259Yl Q==;
X-CSE-ConnectionGUID: S5NPbQOqSZ+RlaSEBSTKHg==
X-CSE-MsgGUID: GhUZSyYDRqCPQd8oZOrnSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277291"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:12 -0700
X-CSE-ConnectionGUID: IkfXKyCoQNG9MOrQeiIfVw==
X-CSE-MsgGUID: 5oRCEOuTTu+2bIWeSgHViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796043"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:11 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 4/9] drm/i915/xe3lpd: Update bandwidth parameters for
 display version 30.02
Date: Sat,  7 Jun 2025 01:20:59 +0530
Message-Id: <20250606195104.1771715-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Atwood <matthew.s.atwood@intel.com>

Bandwidth parameters for WCL have been updated with respect to
previous display releases. Encode them into xe3lpd_3002_sa_info and use
that new struct.

-v2: Resolve conflict on applying patche.

Bspec: 68859
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 97aef729f7d4..6175081d41a8 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -418,6 +418,13 @@ static const struct intel_sa_info xe3lpd_sa_info = {
 	.derating = 10,
 };
 
+static const struct intel_sa_info xe3lpd_3002_sa_info = {
+	.deburst = 32,
+	.deprogbwlimit = 22, /* GB/s */
+	.displayrtids = 256,
+	.derating = 10,
+};
+
 static int icl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
 			   const struct intel_sa_info *sa)
@@ -769,7 +776,9 @@ void intel_bw_init_hw(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
-	if (DISPLAY_VER(display) >= 30)
+	if (DISPLAY_VERx100(display) >= 3002)
+		tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info);
+	else if (DISPLAY_VER(display) >= 30)
 		tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
 	else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx &&
 		 dram_info->type == INTEL_DRAM_GDDR_ECC)
-- 
2.34.1

