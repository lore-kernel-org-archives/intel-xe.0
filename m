Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD8FB44C0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181C10E3FF;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWHY3aVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50210E3F1
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VjPgHtNifJoseI0ERiH0w3nKAW96uhHQ0Rq5UPGFBqw=;
 b=UWHY3aVq97FAgDFPjAcjFH4xW30y3L34WdaSabrdsO9Y7AS3OTii8Us2
 aSVYB05aOCTuAXM9GxvK48Yp/O9g7i7bBGSzLN3dURFXIbZ4bp+cneixX
 7namf3n7qHo1xvZCelK+dMbiemkjXgpnzbaH4TY0DP2WLI0Q9s05TJ9lP
 x1Fvga556Tal8rdh7GOmt3YTUxmIsFgwB8odPQ+Rg3ufICxYFDG311E1/
 eukFOM9zAZMztWJWw+rlTZD8Ym0dPZzkEisCTTo83fbwXl//g7JOatI9H
 6cvxYcap3N0vJ9cy1dacg2DD4vY0aulIsVuSGV2Ynclf6vs/VqILn+2Gq w==;
X-CSE-ConnectionGUID: xyCD6PsmTJK5kzDZbGKp3g==
X-CSE-MsgGUID: aWgWkd0jRfaATsVBvLwbqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80634000"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80634000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: P+XDYnxdSbGPlhR58tFShg==
X-CSE-MsgGUID: R0w0UMzHQ0a2ncJbYnqYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560140"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:16 -0700
Subject: [PATCH v2 06/10] drm/xe: Const-ify parameters to xe_device_has_*
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-6-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=VjPgHtNifJoseI0ERiH0w3nKAW96uhHQ0Rq5UPGFBqw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eUlPM3xGF5Plj7Jfo8Iamv73XMcddduJvyq
 MmQWaGvRRiJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlAAKCRBNeSQFyHKQ
 BDIqEACInkzJlcoPto0esLXn1Cqw1urFcztbvWdUjHfUIqEJFtFIkQE7DV55bI6iJPdlDjbgSay
 lkjP8BB/7ydf0VatSeEpAxr71HZuTOqY4hY2Glk4rgFy+dWUYQshxfSFFrDiSLB9vHT4/IkEsat
 yBQGn/Wfr/hhQhViKWKwObLhc1OQXdlzZSF9I7Cs+mrAkm0pwkhiozZ2aWfke4A89P8CRarFj6u
 9irFWIqUDrAFRR/yaD8Us8VFQxDsk2sQysBo4lQRjDMTxxYYLxvaAhvTHnPTuace0JybpdfF/lH
 mOffJdZKdv4Omno8NrOwlO8sCPzfOeKuqL9upVhv3Q3epSoxLfTdUzG3pjnrwXGtLPykT7nAJY9
 FXSclI70ZCAE7WOeZWyUs9mH4AXnta39O5XMEb7378sAb/DcyIbmZWi+4lddzdPCmcNyxbmzDhB
 PHZNzC+7w24Drdm+P29Mm+0DhMG3UD9rb5EWtR1LZTQ4CeUHyd9bD5vqdLUeuu3NpCe3AmvJU95
 IEsB6eQ/T2p1jgUHeUM4ZopmySPKRksq7skI89wi0zQBdn6rqusisyoicbh9CdDqRSgVtfiMvEB
 hCAD1xhkoMiGEVRqcsFeetAezIaVka+1yfqrQNUKynhx4k319YPCO1kjapEj2FFxUn65szX90Op
 n160dNCW+edkaFA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

None of these functions modify the Xe device parameter, and marking it
as const will avoid warnings when the callsite wants to pass a const
pointer.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 555c191f7510..355d69dc8f54 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -146,37 +146,37 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 
 void xe_device_assert_mem_access(struct xe_device *xe);
 
-static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
+static inline bool xe_device_has_flat_ccs(const struct xe_device *xe)
 {
 	return xe->info.has_flat_ccs;
 }
 
-static inline bool xe_device_has_sriov(struct xe_device *xe)
+static inline bool xe_device_has_sriov(const struct xe_device *xe)
 {
 	return xe->info.has_sriov;
 }
 
-static inline bool xe_device_has_msix(struct xe_device *xe)
+static inline bool xe_device_has_msix(const struct xe_device *xe)
 {
 	return xe->irq.msix.nvec > 0;
 }
 
-static inline bool xe_device_has_memirq(struct xe_device *xe)
+static inline bool xe_device_has_memirq(const struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
-static inline bool xe_device_uses_memirq(struct xe_device *xe)
+static inline bool xe_device_uses_memirq(const struct xe_device *xe)
 {
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
-static inline bool xe_device_has_lmtt(struct xe_device *xe)
+static inline bool xe_device_has_lmtt(const struct xe_device *xe)
 {
 	return IS_DGFX(xe);
 }
 
-static inline bool xe_device_has_mert(struct xe_device *xe)
+static inline bool xe_device_has_mert(const struct xe_device *xe)
 {
 	return xe->info.has_mert;
 }

-- 
2.53.0

