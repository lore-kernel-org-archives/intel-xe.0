Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172BD606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIUA7zXo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044E10F66C;
	Tue, 24 Nov 2026 14:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6010E875;
 Tue, 24 Nov 2026 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529903; x=1827065903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ARSSHey1y1aGKbV4NtfIZUuBjf0cboumSmaxIH875UI=;
 b=FIUA7zXozWHOSg01KwE3uyhwGUS3ItB06bUlKY0lr1GBX1w00Vdcphuy
 /x8uPbjtxD99qy6scy5t7sXqledyXBWNCZO+RgyDPxC+PBdV+1XCTbtFF
 eqW5x3YsLYeHu482t2NBBgfQPAd2biZQhEO5ijQC3RWqLTaIHePMAMqYm
 /ugjTQCIRRjFfe8ZWyc7vxbaVecRZxSNupWqDurT10elvbh9s4CW0uF6S
 bXganAtTZCUlZuN+T5qcZWV4ZiHeE20C8y0mqF2fS0ldIObSjMMJj4hVf
 J0Q+r81L2lmHZzzyy5EQKuHZMcBCrnFWhoacJHN54+h6Y2H9DMcXhIW9q w==;
X-CSE-ConnectionGUID: V3fjjSXVQqyzSsmPUvrLcQ==
X-CSE-MsgGUID: WzdTuPC9S/GlwqX4/mva2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389690"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4389690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:14:55 -0800
X-CSE-ConnectionGUID: nQjWc+dwRumhZL7lMCQw1Q==
X-CSE-MsgGUID: d1ugbsqvS42DZayJsL9YAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11569385"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:11:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915/display: use str_enable_disable() more
Date: Tue, 24 Nov 2026 16:11:46 +0200
Message-ID: <20261124141146.1560208-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124141146.1560208-1-jani.nikula@intel.com>
References: <20261124141146.1560208-1-jani.nikula@intel.com>
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

Convert a few places to str_enable_disable(). Improve the grammar and
switch to %pe errno logging while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 566a921d18a1..33cfa32791ae 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -756,8 +756,8 @@ intel_dp_mst_toggle_hdcp_stream_select(struct intel_connector *connector,
 					 hdcp->stream_transcoder, enable,
 					 TRANS_DDI_HDCP_SELECT);
 	if (ret)
-		drm_err(display->drm, "%s HDCP stream select failed (%d)\n",
-			enable ? "Enable" : "Disable", ret);
+		drm_err(display->drm, "HDCP stream select %s failed (%pe)\n",
+			str_enable_disable(enable), ERR_PTR(ret));
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 667d4514c375..ff1106b70390 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1572,8 +1572,8 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 					 cpu_transcoder, enable,
 					 TRANS_DDI_HDCP_SIGNALLING);
 	if (ret) {
-		drm_err(display->drm, "%s HDCP signalling failed (%d)\n",
-			enable ? "Enable" : "Disable", ret);
+		drm_err(display->drm, "HDCP signalling %s failed (%pe)\n",
+			str_enable_disable(enable), ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.47.3

