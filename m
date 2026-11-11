Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DCC606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A7k0JYkH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC7710FB1A;
	Wed, 11 Nov 2026 11:20:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1410FB1A;
 Wed, 11 Nov 2026 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396020; x=1825932020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HN8FbhY9ljUHCDdv1hkXQp6UnD4GuL+9AmolCWnLtfA=;
 b=A7k0JYkHtGLgltrTFZcU+T5oQXIfwMScDiWgqi/4ir5+UT9vWFWLdrdf
 NxmIXjuWBz4AVNjl4PXxdCBCBKWFCF6On+x/h+9czfnuLee1nKnjskyvQ
 h+zoWAWvOT7TzkmlbU6Kur1oCB/+HBT/ypLI0jVG0+Xk4qBfFaNMtjrlS
 3YMrMU74AcunGzcJRbOC4jqbtBfYtiiHzTd8NfpgVbRM3yeVDVKHa4NL+
 DTFbv3ZTmxnW+YVSw6BXIwcwwa3r99+gH4rGXKM3Fqa+e+vxFpksCk9/T
 BT9Kul1UDuw7pc148Yh+/cY7jOnQDk71Oz4iGZd95GsIQl6T6+gHKdS0J A==;
X-CSE-ConnectionGUID: HrEAiWBlS9GEU0L4y3Snew==
X-CSE-MsgGUID: Z/8Dx7ezTG6Zd4cTwPItTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3074237"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3074237"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:20 -0800
X-CSE-ConnectionGUID: 2NajUz1/QiahbXYcNwSQsw==
X-CSE-MsgGUID: vAqdM3FWQ5+3huzr15wGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10264133"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:18 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/13] drm/i915/fb: Fix error handling onion in
 intel_framebuffer_init()
Date: Wed, 11 Nov 2026 13:19:56 +0200
Message-ID: <20261111112007.16790-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Correctly unwind the steps in intel_framebuffer_init()
if we fail to create the DPT.

Fixes: 86af6b90e055 ("drm/i915/fb: Fix the set_tiling vs. addfb race, again")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 9d71f594537f..40012b432d91 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2319,7 +2319,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		if (IS_ERR(dpt)) {
 			drm_dbg_kms(display->drm, "failed to create DPT\n");
 			ret = PTR_ERR(dpt);
-			goto err_frontbuffer_put;
+			goto err_bo_framebuffer_fini;
 		}
 
 		intel_fb->dpt = dpt;
-- 
2.56.0

