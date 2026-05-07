Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E0ECD3436
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448410EF41;
	Thu,  7 May 2026 01:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfFY2wsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8452510EF3C;
 Thu,  7 May 2026 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117522; x=1809653522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KmzqY71iVsRx7DkDWUi75i7U1iYvI/UpIcI7ZjA/iC4=;
 b=RfFY2wsBjQGM4/MNzUQoL4J9adeYtXGzIiNi/YxQD2ItD10zPznTNGfd
 4qQZkUz4yvQEF37yi/pfaa3zdGZnEO3y0dgtuEicJVZcILoD+amj2x2yJ
 Xe8kjaNQtcnUrNSkUizqPKKtVWlrkhTOiwn6oJincAjEWJzX5rnsMJYPD
 vBpuVHcyEolUM8AIumj/F95jZdOgpSIiTjrECeff8YI9qvSWgA5/z7F0J
 yedtPP+RvKUcGfIzUn7QdlMHUPqJz233FgxJNW+BNjQclYI1lpm/Sa8R+
 blje+OiAYShB7i9X0yY1/WAINhi0tn2j2bZPw9tbXvw9kKjaXY8PzxQPo g==;
X-CSE-ConnectionGUID: r4AgQ6oGSLK0TPAj93wPjg==
X-CSE-MsgGUID: NAvJErwGS8qkNko7kigJiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089025"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089025"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:02 -0700
X-CSE-ConnectionGUID: zbfx5UQiQAanGFoqAN+I4g==
X-CSE-MsgGUID: jikciSNHRlG21X7ghVKr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692768"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:02 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 09/31] drm/i915/bios: check VS/PE-O in helper func
Date: Thu,  7 May 2026 03:31:15 +0200
Message-ID: <20260507013137.527510-10-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add helper intel_bios_encoder_overrides_vswing() to check if port
requests for overriding default VS/PE tables.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_bios.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index fa9f21c5c6134..b01e485283459 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2663,7 +2663,7 @@ static void override_vswing_preemph(struct intel_bios_encoder_data *devdata)
 
 	devdata->buf_trans = NULL;
 
-	if (devdata->display->vbt.version < 218 || !devdata->child.use_vbt_vswing)
+	if (!intel_bios_encoder_overrides_vswing(devdata))
 		return;
 
 	buf_trans = kzalloc_obj(*buf_trans);
@@ -3855,6 +3855,12 @@ bool intel_bios_encoder_supports_tbt(const struct intel_bios_encoder_data *devda
 	return devdata->display->vbt.version >= 209 && devdata->child.tbt;
 }
 
+bool intel_bios_encoder_overrides_vswing(const struct intel_bios_encoder_data *devdata)
+{
+	return devdata->display->vbt.version >= 218 &&
+		devdata->child.use_vbt_vswing;
+}
+
 bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 264 &&
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 75dff27b42289..50c8fc91fbe85 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -73,6 +73,7 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
 const struct intel_bios_encoder_data *
 intel_bios_encoder_data_lookup(struct intel_display *display, enum port port);
 
+bool intel_bios_encoder_overrides_vswing(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_hdmi(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dp(const struct intel_bios_encoder_data *devdata);
-- 
2.45.2

