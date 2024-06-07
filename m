Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAE6C27C6F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612DF10E12E;
	Fri,  7 Jun 2024 12:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHY9FSk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FD910E12E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717764098; x=1749300098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cBiFeSTVUxSUfUTQxt1zJkOW5GBYWhfm0sksFZHzED4=;
 b=fHY9FSk5xwAdqciebiHOxjmED8idBvDaOom1dmOIoi1Usmy+TLANZlAw
 bmAY7iCj/hMjdr3Jof4cK1/om+OBMpOk/W8J28p8vUi27tdY2oS+i3yKQ
 JM9KN6pwPXFnWy3pw4stKitmQ4Bn3bvG61pxcmERiuHEMCt14MR7cfJzo
 3FjCyRbMzYFBbJrTGh+MpC93Q6St8MrOBmXaTxQUk3qbl+L0DGjdMk4WZ
 PvJNmy+Ktfpmxa3if/J7D/ltFKRdUDYw1W6cLr0KDLbZp4K5CKP5VLI4B
 EmZ5TjrnQlng/FcyrafkNJBngDSGi71c/PDCPE1MRDKr9ygcLvOD/UoL2 w==;
X-CSE-ConnectionGUID: OXaP8J2gSIK/72bYmmWKnw==
X-CSE-MsgGUID: 6mfVXLLuTTWcd/pd9OzPhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11964233"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11964233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:41:38 -0700
X-CSE-ConnectionGUID: 1e0hY3pfSRW1yxombFfaBA==
X-CSE-MsgGUID: x1WycoXqQGmszNiztcErwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38386629"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 05:41:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [CI 2/2] drm/xe: Check valid domain is passed in xe_force_wake_ref
Date: Fri,  7 Jun 2024 18:27:41 +0530
Message-Id: <20240607125741.1407331-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
References: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
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

Assert domain is not XE_FORCEWAKE_ALL.

v2
- use domain != XE_FORCEWAKE_ALL (Michal)

v3
- Fix commit description.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index f088cc6a4002..77c392289935 100644
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

