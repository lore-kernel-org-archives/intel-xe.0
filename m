Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0607EC27C6E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 05:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595510E20E;
	Fri,  7 Jun 2024 05:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8rJCWIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E954610E20E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717736789; x=1749272789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4NodrPwFUPBCEzk20U9u6E9qJ7M82eGBbO8dBc05rU=;
 b=B8rJCWImAyegaz2T4GPJD/PzUFU5miQx5gR35w3FrQh7C3TS4dpelDvE
 SYsJbVLgTbP5cDpvx4RKnXVA43Sy22FCCG78iFFq1za1oD/ziNjr00NBF
 NKucPGyISYco9p2lmgEahFJ/mZ9LgzlpUPr1y1zF1VrEOSb0OVyzGtB5Z
 R2w5VxxJso/+R8Ucx1rf8NrwVeKTeo2bv0bcXlINMH3H6u9TzJL40u+QM
 kVGvThw95SEMhE0rMJ5PUWzFqFmor5MAwgOK4l17MBajxXHsXm1wPeW+/
 ZEECDkaTpJBx7j2XP+4flKssC2s2D44UqmtByODouR3AA3EJyuoJXRV+s w==;
X-CSE-ConnectionGUID: v+wFpL8wQMmMNYFzwNsqiQ==
X-CSE-MsgGUID: hrnkYCWpQ3q3TmseXc1Ehg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14183491"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14183491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 22:06:29 -0700
X-CSE-ConnectionGUID: xmJ4dg1rSQSYQhhDMLGwFA==
X-CSE-MsgGUID: D5p+FLw8S6eLSpp/TIA8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38773099"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 06 Jun 2024 22:06:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Check valid domain is passed in
 xe_force_wake_ref
Date: Fri,  7 Jun 2024 10:52:13 +0530
Message-Id: <20240607052213.1391082-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
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

Assert in case of XE_FORCEWAKE_ALL is passed.

v2
- use domain != XE_FORCEWAKE_ALL (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 651ea1e62c63..346785df3b49 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -24,7 +24,7 @@ static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, domain);
+	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
-- 
2.25.1

