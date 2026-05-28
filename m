Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B121CD6E49
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 10:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C7910EFC2;
	Thu, 28 May 2026 10:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFY1m/GM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C2110EFB8;
 Thu, 28 May 2026 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779964521; x=1811500521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xqXlzI2wqy4YSKlF1ThbPSshduSPxxIcR8TDstlvSuw=;
 b=bFY1m/GMCsc2SO5dG74RQeOAfJa6YUUrWG8R02S9C4zQl3bRxfakY6pp
 vKzIHuPSnoJd60dMc2CIRfE8wetYbd+IJtEpbtiq5VWCClWnAQcXlrOIR
 08n28XVuMkkC0oRLahPJX9Uzp7++Dzw2OhNKSHBGmNx8cLOGMt0vhY4ZI
 XVHJqHm4BpQKxNoaW0vsLkNQWXbK/E1k8mE8PLSRex99RGuf0t83XY9nN
 C81J3Zye6Viiv16R7tOpST6YxA8uuw7ooOdyaQ9o6NiQiutDpQSO/ftLW
 qisCOBlw+OnbAcEozgua8uSVE4osFmnFCpUU3q8Sdb1T7fDf07MSqdfNP Q==;
X-CSE-ConnectionGUID: EhggfWFtQJ2Nn6c4Ts8kng==
X-CSE-MsgGUID: a59R/yfkSAi3HgNNj96JJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98221240"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="98221240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:21 -0700
X-CSE-ConnectionGUID: ovRrqumIRTivjw1AC9PUPg==
X-CSE-MsgGUID: gS6Umay3TQaA2wa3i/wN0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241682367"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/11] drm/i915/bw: Move 'bi_next' to tighter scope
Date: Thu, 28 May 2026 13:34:51 +0300
Message-ID: <20260528103458.18069-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
References: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Move 'bi_next' into the scope where it's actually used.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 4b5db4ca7773..940f23e7dd4e 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -633,14 +633,13 @@ static int tgl_get_bw_info(struct intel_display *display,
 
 	for (i = 0; i < num_groups; i++) {
 		struct intel_bw_info *bi = &display->bw.max[i];
-		struct intel_bw_info *bi_next;
 		int clpchgroup;
 		int j;
 
 		clpchgroup = (display_bw_params->deburst * qi.deinterleave / num_channels) << i;
 
 		if (i < num_groups - 1) {
-			bi_next = &display->bw.max[i + 1];
+			struct intel_bw_info *bi_next = &display->bw.max[i + 1];
 
 			if (clpchgroup < clperchgroup)
 				bi_next->num_planes = (ipqdepth - clpchgroup) / clpchgroup;
-- 
2.53.0

