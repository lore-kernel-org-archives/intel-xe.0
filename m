Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6A6C5B552
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6610E965;
	Tue,  3 Jun 2025 18:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXR17MkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCDE10E908
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975080; x=1780511080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWTdUudk7grE0UO/9TmVzEbBBpPsDZ79MNicuI1Gj0U=;
 b=NXR17MkZZVGzALG/O1orOp5nYvxBjNy+5It4VEfJj+w9xOEHvNLnayFu
 Brr3piHzIAykFjRVoc+rFwZl6+3WhRW+Fjd+pDu9HRjqC5uyFXHrh+58f
 xoy35ZM+L68UzwObBV7LzbDzthV9X26/lbp+v7QX6uBuwkj1Ko7WLnl8D
 4BkJVOzzBwbcYrw7bI7B1Wl31I8omn141SMb1vne8wh3t9DUZmUXVAcy1
 3h8hCm0oVzHDPBDz4glAaWUS5/RBb4gI8arvgPiRXuqSgy7wWNBsOGmCj
 /L60IWcsagMSfEw0xwgaBRg4vEwB4DVJea1HW6B5gJWfL9w5QFcuVqxBC A==;
X-CSE-ConnectionGUID: wcOle2LER2yyqEpTNviXIA==
X-CSE-MsgGUID: oEt2gLkKS1m1JEVuGkcamQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693865"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:40 -0700
X-CSE-ConnectionGUID: H8mcgjqDQamSREtNqOqW0Q==
X-CSE-MsgGUID: s6NAbGnTQLGpcdni5K4dyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562046"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:38 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 4/6] drm/i915/xe3lpd: Update bandwidth parameters for display
 version 30.02
Date: Tue,  3 Jun 2025 23:54:28 +0530
Message-Id: <20250603182430.1016734-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

Bspec: 68859
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index a5dd2932b852..39b5f2759617 100644
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
 static int icl_get_bw_info(struct intel_display *display, const struct intel_sa_info *sa)
 {
 	struct drm_i915_private *i915 = to_i915(display->drm);
@@ -768,7 +775,9 @@ void intel_bw_init_hw(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
-	if (DISPLAY_VER(display) >= 30)
+	if (DISPLAY_VERx100(display) >= 3002)
+		tgl_get_bw_info(display, &xe3lpd_3002_sa_info);
+	else if (DISPLAY_VER(display) >= 30)
 		tgl_get_bw_info(display, &xe3lpd_sa_info);
 	else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx &&
 		 dram_info->type == INTEL_DRAM_GDDR_ECC)
-- 
2.34.1

