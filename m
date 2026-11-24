Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65E606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UHcLGlUv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF38A10E885;
	Tue, 24 Nov 2026 13:38:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B4110E885;
 Tue, 24 Nov 2026 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795527491; x=1827063491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiSzBfG7Yp8hVdiUj3rHlKcKQYc7XCRVB8xGsKOWafA=;
 b=UHcLGlUvomEspujcwGQ71LK2bCl1VN5fNx9S6Ykrgco4F8f9z0XShfD2
 wQFGf6xy2M6zUlboOEpzL6fqQiJWbVx4HqStkQuvhSaCDPdru79znp9xW
 UJlpmcQlKS9uQ5VHcty0KSGjz3mVaRIDe+KEP/QE97WsfkVEmRZrDpiQL
 C+YBsf0/KaIJVYOLC9gdut6GllNkZLgo5CqGtR6Ezz9COAslp7QJygQ+E
 FexH9zY3W6u+rPQ6hhzGWSbLPW41rBla76fAkomSugCvFSSip1ZhpTmk+
 MgkBIHJVMdXSKCXpGf+aQUwUPDGEiCNcWFzjmShAWVo3FpuRGw+P7s8LL g==;
X-CSE-ConnectionGUID: TWnZ0b8iRYmUmITx7BRf1g==
X-CSE-MsgGUID: cbr5jFfTQLKekTEeK+Vh2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4258972"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4258972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:38:09 -0800
X-CSE-ConnectionGUID: Nsn08ChBQ2mnLhUqQ7GaEw==
X-CSE-MsgGUID: IGt5svz4RtiF+tnkvZskwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11756384"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:38:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/compat: remove leftover
 intel_uncore_arm_unclaimed_mmio_detection()
Date: Tue, 24 Nov 2026 15:38:04 +0200
Message-ID: <20261124133804.1509493-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

When the unclaimed MMIO detection was moved to display, an xe compat
inline functionw was left behind. Remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 238addc1e5fc..707f7ad0378d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -63,10 +63,4 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
 	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
-static inline bool
-intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
-{
-	return false;
-}
-
 #endif /* __INTEL_UNCORE_H__ */
-- 
2.47.3

