Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14341606A322
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWjFvbMx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAB910E557;
	Wed, 28 Oct 2026 07:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC3610E529;
 Wed, 28 Oct 2026 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793171655; x=1824707655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kHt+04oaA1Le04one5WWSP1q1x24VyDsyjTtPRDVk4Q=;
 b=MWjFvbMx5nZUm1mcAjOJEUs8Ly8gRUf8tfFwi7KnPzrUfAkfMweF3nCW
 jw20MpacWL+V2OLj77C63dJYlGW/qPjE7Yaf1ScVRKlsenKzVBQe0LULm
 c6Erq/DaPy62zXsCRoaTsB4XWB/H28jsyx9SBjpgJngSN4chy4mfKjWU6
 LHIw1HjyobGXicSqrW/898MrFvI7oxdWi19AqXtlIMgJLA8oxaFm45Wyc
 w5dFHMPWBmniSEsC8iP7aelgm4GZnXT7u9ADYMKew3pXD6f1NRZ+LYJC8
 Dz8IvBYBME+PyrkFYL+NRsXd58eJqfJEbJiQ0rPujtPlcOTyUJreJuR6t w==;
X-CSE-ConnectionGUID: Sm4gdHmNQq2j6UERevgA4w==
X-CSE-MsgGUID: ggOrg4wjQn2s7kwbpFqAnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1765958"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1765958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:14:10 -0700
X-CSE-ConnectionGUID: PjjQVwojQoicyrRSZEQJuw==
X-CSE-MsgGUID: pYtNR7lZQtqWoq39rltnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4868301"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 00:14:07 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 uma.shankar@intel.com, jani.nikula@linux.intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 Charlton Lin <charlton.lin@intel.com>
Subject: [PATCH v4 2/2] drm/i915/display: Disable pipe joiner on WCL
Date: Wed, 28 Oct 2026 12:34:04 +0530
Message-ID: <20261028070404.1913843-3-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261028070404.1913843-1-vidya.srinivas@intel.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
 <20261028070404.1913843-1-vidya.srinivas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pipe joining is not supported in the WCL display configuration.
Report no joiner support on WCL so that modes which would require
joining are rejected, matching the 4k 60Hz maximum resolution
documented for the platform.

v2: Rebase onto latest upstream
v3: Fix up the commit message
v4: Split the scaler and joiner changes into separate patches (Jani)

Bspec: 74286
Cc: stable@vger.kernel.org
Suggested-by: Charlton Lin <charlton.lin@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 00e02e019d25..ef164a797618 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -485,9 +485,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 			return false;
 	}
 
-	return DISPLAY_VER(display) >= 12 ||
+	return ((DISPLAY_VER(display) >= 12 && DISPLAY_VERx100(display) != 3002) ||
 		(DISPLAY_VER(display) == 11 &&
-		 encoder->port != PORT_A);
+		 encoder->port != PORT_A));
 }
 
 static int dg2_max_source_rate(struct intel_dp *intel_dp)
-- 
2.45.2

