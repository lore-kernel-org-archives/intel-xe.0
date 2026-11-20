Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EA606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j61C+B47
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391B112AC4;
	Fri, 20 Nov 2026 14:23:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093B1112AC6;
 Fri, 20 Nov 2026 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184628; x=1826720628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j28sLCsMav7WbnK4jgpQHx6XdQWRrSH46u3RsCeEwWA=;
 b=j61C+B47mLToOnM2nqp1u1obONaweXk8I5cDedobh/ODSFd6kQZi2eNe
 LedJnif1x+iTe9c0pVgwvvQDAIaUsp/ieIREyNMZOE6xwp1i4yz0UoMf6
 NanxYr6pLTYnQYnb3Sotv3aMK1pdrAyiMl5V578wG2T9FQ7aTKnsEPJMe
 7YTyx07J2xL9rKTDBF97y6YNkAd7zTSaTDxf0aQwmv34FS0/WR4LAQ2FD
 E2JkvZK+j5gWymQAYGGa5gdA25zzEMg61NDL/wIp5TkScrj+A3opaaSHt
 M4qtOanxKcx6gThapnWna/JqLFbJy94zTaq9Qd6BwqHZAkc3/6LJA51ue g==;
X-CSE-ConnectionGUID: a18dDufoRJ2SOmrFJkJGNw==
X-CSE-MsgGUID: Bw4DbZFjT06Bd2RQlFFAzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090972"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090972"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:31 -0800
X-CSE-ConnectionGUID: +yYh2g8SR/yDsur/4y+z0A==
X-CSE-MsgGUID: GsUUwVpfQT+WMDb3tkNYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422024"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:30 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 13/29] drm/i915/dp: Disable the PCON DSC encoder unless it is
 needed
Date: Fri, 20 Nov 2026 19:37:13 +0530
Message-ID: <20261120140729.466177-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
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

The PCON DSC encoder is only used when the PCON decodes a DSC 1.1 stream
and encodes DSC 1.2a for the HDMI sink. Otherwise the PCON either
decodes the stream, or passes a DSC 1.2a stream through, or there is no
DSC at all.

Currently the encoder is enabled with PPS override parameters whenever
the PCON and the HDMI sink support DSC 1.2, even for streams that do not
need it, and it is never disabled again.

Program the encoder only for the decode and re-encode operation, and
explicitly disable it for all the other operations.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e837645a6421..9f6cd726af26 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4610,6 +4610,13 @@ intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 	    !hdmi_is_dsc_1_2)
 		return;
 
+	if (crtc_state->pcon_config.dsc_op != INTEL_PCON_DSC_DECODE_ENCODE) {
+		ret = drm_dp_pcon_dsc_enc_disable(&intel_dp->aux);
+		if (ret < 0)
+			drm_dbg_kms(display->drm, "Failed to disable pcon DSC encoder\n");
+		return;
+	}
+
 	slice_height = intel_dp_pcon_dsc_enc_slice_height(crtc_state);
 	if (!slice_height)
 		return;
-- 
2.50.1

