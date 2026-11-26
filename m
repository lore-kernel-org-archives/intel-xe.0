Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43501606A327
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGuzCaMc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC2D10EA03;
	Thu, 26 Nov 2026 18:07:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186AE10EA4D;
 Thu, 26 Nov 2026 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716417; x=1827252417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WrmGzfERc3qkmd/IwFR3wjrXSAhhoiZ7BsYrWv4z8oI=;
 b=QGuzCaMc81G7Xkh0qFwTS/lOJ0Q6nJ12G3U/bgU0kyf4wPtXODVOHeDk
 Fa/1lE729Ko9PvOE38luXndE/eA8uT/K/PtAyMuXWerdABqMmsJQElzgL
 d08vgzhpR9BgQ07DjRVVMX8OMJUrB9D8jNJlCnJmMLx4BD2q+QiOPwEq/
 8/dLy4aCQuSW/n6j7HesSpKpTrdgTzwEC9RxOUzNRS+FvXxJ1YiePySR4
 eTiWYq+oktQapgqwagcCrDYkoBsqK9TekwqMS88qGPfOToFeIwa1CStXb
 6bkQJB8yRyaBSyHd0Vi6L/UpafZizmZ4qeSd43vDd2NFSaMv89JssCHOs A==;
X-CSE-ConnectionGUID: 8W4AxsKfS6yMPE5vzYgBag==
X-CSE-MsgGUID: NfROWx+LS5ul2cnCCJofFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702473"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702473"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:57 -0800
X-CSE-ConnectionGUID: jswe+6E2TDWl/Q+ITa9KfQ==
X-CSE-MsgGUID: 52VRXbX0TGGjWz6hHcb55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12454569"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:54 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 3/4] drm/i915/bios: s/parse_ddi_ports/parse_each_ddi_port/
Date: Thu, 26 Nov 2026 19:06:13 +0100
Message-ID: <20261126180614.224327-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
References: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

parse_ddi_ports() and parse_ddi_port() names differ only by the suffix
's'. Rename the former to lower the confusion and to reflect better it's
meaning.

No functional change.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 9bd2bc2e042b4..4ffdfc271cca5 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2891,7 +2891,7 @@ static bool has_ddi_port_info(struct intel_display *display)
 	return DISPLAY_VER(display) >= 5 || display->platform.g4x;
 }
 
-static void parse_ddi_ports(struct intel_display *display)
+static void parse_each_ddi_port(struct intel_display *display)
 {
 	struct intel_bios_encoder_data *devdata;
 
@@ -3355,7 +3355,7 @@ void intel_bios_init(struct intel_display *display)
 
 	/* Further processing on pre-parsed or generated child device data */
 	parse_sdvo_device_mapping(display);
-	parse_ddi_ports(display);
+	parse_each_ddi_port(display);
 
 	kfree(vbt);
 }
-- 
2.45.2

