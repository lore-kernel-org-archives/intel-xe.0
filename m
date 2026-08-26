Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DAFC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 15:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6798010E2B8;
	Wed, 26 Aug 2026 15:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeItJmg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE0B10E28C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787757811; x=1819293811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IlTVNQUTu4A1zMlSkmGbG5fkxz9js7gsDkT/ykG059Q=;
 b=jeItJmg1NU4LFQSPe2XEapdSILfnsVrt2EFqZKatIAC3cZvkvKDwzNNA
 uvBEEscoRWlyODB8Q4Byt/vKy5Q6WCdmu2g9S8AZhNkg9jbY/g5NClH9n
 w7ombr0/UZhLIhMSsq95/vUd6LpnIx286zN4n8k59jNNKlC3LBfRUIVgD
 h1Uzzk8YhB2Bt0QZnQZd7xPxHUf5YTNZZd/5U17x2CaOxzUEWPanirCzD
 Mrpm9DdfvO3yAfbba2vCbmIFhj5viJfzT7mpCskBeDtqigwlqO5TfucwN
 DO5HasLoADxJNy8IC/Yv2fClSAVFuxX4lZ+gbrypz+j7Y/4K9irR1dU/j Q==;
X-CSE-ConnectionGUID: YvLyb7kSRAWHAToOZKYgIQ==
X-CSE-MsgGUID: xTvW8ol3RSyjW7QTWF5qUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88297396"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88297396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:31 -0700
X-CSE-ConnectionGUID: C3fM1ML1QJy9mAtoQsiiwA==
X-CSE-MsgGUID: kcO/aNYSTWqDmlXs4BnbXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271105078"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:29 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v1 2/2] drm/i915/hdmi: Read EDID over GPIO when the debugfs
 flag is set
Date: Wed, 26 Aug 2026 20:53:35 +0530
Message-ID: <20260826152335.2822798-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
References: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
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

Normally the EDID is read over GMBUS, and GPIO bit-banging is only used
if that read fails. Now the debugfs flag is checked first. If it is set,
the DDC adapter is put in bit-banging mode before the read and put back
after it.

The flag is read once with READ_ONCE(), so the enable and the restore
always match even if the flag changes at the same time. The GMBUS retry
is not needed in this case, because the read already used GPIO.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 38915f19d3e5..462ccfc840d4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2555,13 +2555,23 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 	struct i2c_adapter *ddc = connector->base.ddc;
 	struct ref_tracker *wakeref;
 	const struct drm_edid *drm_edid;
+	bool force_bit_banging = READ_ONCE(intel_hdmi->force_bit_banging);
 	bool connected = false;
 
 	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
 
+	if (force_bit_banging) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] HDMI EDID read forced to GPIO bit-banging\n",
+			    connector->base.base.id, connector->base.name);
+		intel_gmbus_force_bit(ddc, true);
+	}
+
 	drm_edid = drm_edid_read_ddc(&connector->base, ddc);
 
-	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
+	if (force_bit_banging)
+		intel_gmbus_force_bit(ddc, false);
+	else if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
 		drm_dbg_kms(display->drm,
 			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
 		intel_gmbus_force_bit(ddc, true);
-- 
2.43.0

