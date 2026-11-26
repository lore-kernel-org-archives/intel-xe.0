Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316FB606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WnD3bIMC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6610EA5D;
	Thu, 26 Nov 2026 18:07:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5D10EA0E;
 Thu, 26 Nov 2026 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716415; x=1827252415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6lxNsG/UAp2E/bXKYvldnZPjfQSldkQY3ZsvF+9c5Q=;
 b=WnD3bIMCtuDS2oX7bNfgs924Vt6H59IgJNbQK4roo8Q3unx4f5xbR5p6
 Axn/MPQ5zrbBzAg6MW39mQD5qmQhUaIL9YBlKNkFh5MbkRyRBn1jXuoCs
 VJgL/ffvTCITKADIBHlc9dAqy0jYBHoqicDUit6blUxfVi7NtUTIMzzLe
 vTjX0DrG5Syl/mD79mo3DJ7InXEtFvlkzN0vovdqMC/grQM2woc8It/Hc
 FQZ59gsvxHQ36QA+tQQ+MqCKiAPJgHNdwNc4/nCO5xeP8GtUzUng7EZVV
 ZHZkSvR4DFAhKsXmlAwLudt2Ng9D6uKxBMFYmLrdwX83TDCwytJvcXr7c Q==;
X-CSE-ConnectionGUID: 26Xl8acKRgOvlMuMXbm7EQ==
X-CSE-MsgGUID: hQRbyTmlSsCFaCBerUG+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702469"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:55 -0800
X-CSE-ConnectionGUID: RY/aqSVQR0OzypdOzXrF4w==
X-CSE-MsgGUID: KcS+5CUVTFW/QuKWL4fUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12454560"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:53 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 2/4] drm/i915/display: s/vbt_firmware/i915_vbt/
Date: Thu, 26 Nov 2026 19:06:12 +0100
Message-ID: <20261126180614.224327-3-michal.grzelak@linux.intel.com>
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

There is a naming incosistency between debugfs file for capturing VBT
and module parameter for passing custom one. Stick to one convention of
naming it i915_vbt.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c           | 2 +-
 drivers/gpu/drm/i915/display/intel_display_params.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_params.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 01ba0372bbe47..9bd2bc2e042b4 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3185,7 +3185,7 @@ static struct vbt_header *firmware_get_vbt(struct intel_display *display,
 {
 	struct vbt_header *vbt = NULL;
 	const struct firmware *fw = NULL;
-	const char *name = display->params.vbt_firmware;
+	const char *name = display->params.i915_vbt;
 	int ret;
 
 	if (!name || !*name)
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 20398deaa4878..25390b7fe93ad 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -36,7 +36,7 @@ intel_display_param_named_unsafe(dmc_firmware_path, charp, 0400,
 	"DMC firmware path to use instead of the default one. "
 	"Use /dev/null to disable DMC and runtime PM.");
 
-intel_display_param_named_unsafe(vbt_firmware, charp, 0400,
+intel_display_param_named_unsafe(i915_vbt, charp, 0400,
 	"Load VBT from specified file under /lib/firmware");
 
 intel_display_param_named_unsafe(lvds_channel_mode, int, 0400,
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 50096a5c961cb..a647f84743d20 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -24,7 +24,7 @@ struct drm_printer;
  */
 #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
 	param(char *, dmc_firmware_path, NULL, 0400) \
-	param(char *, vbt_firmware, NULL, 0400) \
+	param(char *, i915_vbt, NULL, 0400) \
 	param(int, lvds_channel_mode, 0, 0400) \
 	param(int, panel_use_ssc, -1, 0600) \
 	param(int, vbt_sdvo_panel_type, -1, 0400) \
-- 
2.45.2

