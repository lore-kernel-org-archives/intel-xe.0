Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D345B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xi1V2NaE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9929D112AB1;
	Fri, 23 Oct 2026 10:01:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA7112AA1;
 Fri, 23 Oct 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749672; x=1824285672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=isIpxy2i2wE5xadk5AoANqQo7lnWAEE+DiPs424PUcA=;
 b=Xi1V2NaE/7k1xHPZ9AfmDOBC37yyY0Wy9dTJWHy0gmJNJdNcebJbvvqf
 NERFrfJR9/hbHsywYcIMqU7Pn4k2eZaLTc2hVfqkg1jCFx0JEQHiCwA1w
 nnAPAbaLZZaDP82m4UrITfdmqCsv+tEorFTi3mbCngrkgn3boAR9y6keI
 CHhMWzXcR5Q70M87rFhJXGpmaY56u9H3nFp2PlpVuoHZLgfGs1AWpYKYa
 RGTNysominCTfzVQcLzxCzp1INGW6ZWpIt8rmbDfPk55tbbWDSZb6hp1f
 TYTL3l+dtv+14idjPrEL/H89cS+cE1Yv2CE3ctoPe2/eS0WyssqW98b4Y Q==;
X-CSE-ConnectionGUID: qlbLdaSiTxikz5g+KDYihg==
X-CSE-MsgGUID: 06JZsPJ6RtCuM0eA4AWVdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384291"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:09 -0700
X-CSE-ConnectionGUID: whtbBIAIRJGqkySXSQl68w==
X-CSE-MsgGUID: 43Ue3K4DTfKh4D3Tv+3wyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932758"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:07 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 9/9] drm/i915/display: Allow forcing the joiner on eDP
Date: Fri, 23 Oct 2026 10:00:52 +0000
Message-ID: <20261023100052.683192-10-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_dp_has_joiner() rejects eDP unless the VBT enables the pipe
joiner, and the debugfs file is only created when that returns true, so
i915_joiner_force_enable can never turn it on.

Always create the file for DP and eDP, and let a forced pipe count
above one override the VBT.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c |  5 ++---
 drivers/gpu/drm/i915/display/intel_dp.c              | 12 +++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f2474..e55fa01addb54 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1352,9 +1352,8 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
-	if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
-	     connector_type == DRM_MODE_CONNECTOR_eDP) &&
-	    intel_dp_has_joiner(intel_attached_dp(connector))) {
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	    connector_type == DRM_MODE_CONNECTOR_eDP) {
 		debugfs_create_file("i915_joiner_force_enable", 0644, root,
 				    connector, &i915_joiner_fops);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381471d..ec0b4885e33ac 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -473,9 +473,15 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 	if (intel_dp->mso_link_count)
 		return false;
 
-	if (intel_dp_is_edp(intel_dp) &&
-	    !connector->panel.vbt.edp.pipe_joiner_enable)
-		return false;
+	if (intel_dp_is_edp(intel_dp)) {
+		bool pipe_joiner_enable = connector->panel.vbt.edp.pipe_joiner_enable;
+
+		if (connector->force_joined_pipes > 1)
+			pipe_joiner_enable = true;
+
+		if (!pipe_joiner_enable)
+			return false;
+	}
 
 	return DISPLAY_VER(display) >= 12 ||
 		(DISPLAY_VER(display) == 11 &&
-- 
2.43.0

