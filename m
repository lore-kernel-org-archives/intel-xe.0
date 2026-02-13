Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0360CEDF027
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A73610E7C4;
	Fri, 13 Feb 2026 09:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIBMdEuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7073B10E7C0;
 Fri, 13 Feb 2026 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974229; x=1802510229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4rXVZEBh8YVhjPZKgdXUnysv7nkDZWsngvJJG09Ia4=;
 b=cIBMdEuZt5tPhffeK8rYUVvgrw8jYRLLlvF4aDwEVMBsejqh+a0uRK3/
 3j8fz22Go6gloEfks9cz3QyRcHu2WiW/uy/UNofPzcnjToiD9vpus7Ybs
 Kq3GWyrlz7nSEyPkjiMnL2OTOZmeP/xcEe+QrtVAzPvnJobKn+5z2S26b
 Ph/si+ZLdI9EGaSOCcIapZcKfKP6HUV2hXvfag4ZlxODyweUTsh03HJ9z
 ZXXSSRzs20cFNq7auvUAgxpNDVgaSDK5lbDkf/IuIx46VCz86bYHxIW/d
 nDZxsmv/UZSEGH5EHWXNd2Kz9V4fcrU5PEpcxpf8nGhJ/rQB5xxXtk6R/ w==;
X-CSE-ConnectionGUID: iV5ILP9TTCyAA7jRpHRMHw==
X-CSE-MsgGUID: d2EODkqmTGicZwFI7tOaog==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146675"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146675"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:08 -0800
X-CSE-ConnectionGUID: UUFNEi/qQVeqFRYOjtF1YQ==
X-CSE-MsgGUID: vPZRtShfQNy0fahWvselxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778833"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:07 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/8] drm/i915/backlight: Use intel_panel variable instead of
 intel_connector
Date: Fri, 13 Feb 2026 14:46:47 +0530
Message-Id: <20260213091653.2250887-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213091653.2250887-1-suraj.kandpal@intel.com>
References: <20260213091653.2250887-1-suraj.kandpal@intel.com>
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

Use the intel_panel variable since it has already been declared and
looks cleaner.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index f1811beee25f..0237cad11299 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -463,7 +463,7 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 		return val;
 	}
 
-	return connector->panel.backlight.level;
+	return panel->backlight.level;
 }
 
 static void
-- 
2.34.1

