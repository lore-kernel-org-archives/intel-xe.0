Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30B9D29C30
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC210E46F;
	Mon, 19 Jan 2026 14:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7jh8f7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7F10E46F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768832731; x=1800368731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4NKpSxQ2qsBkEXPD4ES7FW1vl5DDjNxp2qJX3PeLfno=;
 b=O7jh8f7bgPcBhjpQXtnkOOXueXv1j+EfOg6kAu8TgBilWjn3NpS8MEZG
 0LTjinsu7c2xxOsVAyS6tKzdCk349CJU2+YhdmD9+ywOlO6RqBP2+QvPz
 u+6k9ZaaGEP381Cc8Sdvt9UG4TzY3UR8isby604yr2pR3dJgeDKLIYP5P
 fLfHCHVHImYF1njgSJh3Z7Z1P+aZazIIbwZKayDAkhj7b1sbhCyT0zBzY
 b88XSQTV6wpwSsBAcekzB4Pnwm2IrYfI7xn22xPtPW658mnP0JSQ8tBso
 J3lMHozYZ4vpgAs0Uscy0WpIzmENtaA8A0stcdQhile/gprB/ZrAEB4hb A==;
X-CSE-ConnectionGUID: /F9R0Bt+SqyBiZipgVYqRw==
X-CSE-MsgGUID: nu/7zijST3ebaZhHUuGNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69940855"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69940855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:25:30 -0800
X-CSE-ConnectionGUID: XYFhWeLCRj+dOiPfPJtT+A==
X-CSE-MsgGUID: rdKaxudBSL6AGdkETw6plg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205501943"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:25:28 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
Date: Mon, 19 Jan 2026 20:01:38 +0530
Message-Id: <20260119143138.1362379-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Remove the unnecessary VRAM channel entry introduced in
xe_hwmon_channel. Without this, adding any new hwmon channel
causes an extra VRAM channel to appear. This remained unnoticed
earlier because VRAM was the final xe hwmon channel.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index baf277955b33..f614f1308dec 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -48,7 +48,7 @@ enum xe_hwmon_channel {
 	CHANNEL_MCTRL,
 	CHANNEL_PCIE,
 	CHANNEL_VRAM_N,
-	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
+	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
 	CHANNEL_MAX,
 };
 
-- 
2.25.1

