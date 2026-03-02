Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA68D58E52
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC110E427;
	Mon,  2 Mar 2026 04:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uja3YoEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BFC10E423;
 Mon,  2 Mar 2026 04:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424387; x=1803960387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=snt/ffZVEHz0Y0Soe7I37+Lvsj6YsXAO7NBfxutm7bI=;
 b=Uja3YoEib10V/WWksAubD7fX9TYyx2utOZmnHKM45R9Bwrkygrsu3D5b
 sBsXoQme64/iaEwITW9FDiwkfqNzfQbFlml7b6g86JRCV6DpNA72ZWVeV
 PGAwQUCrO6EFAB+2Le26+Cl5ki5VlyzEiOsX25FqIi3MtOQ0PqGzlZ7KF
 +dpCHRGUgXMlsFZlVhGZzq/XXvqCDYHtrkutRqtMKI3w5oSG3Y3OEAQrm
 mLgZq/LV95JsidB5dntXwgZt6prdby+shLa93GyXaTq8jho7DpCFIf3Dg
 V/jsDKyynchTLKCj7GYAwgHYry7Yvmt0LIkRWz0Rmn98Xpm5dcZeUiJaS Q==;
X-CSE-ConnectionGUID: qSqHR4w7R9arLxdtmSeULg==
X-CSE-MsgGUID: N7IDnaBpSFe5GyjsbGYZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294430"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:21 -0800
X-CSE-ConnectionGUID: 6V8Ew0DZTu2lZikwESFFXw==
X-CSE-MsgGUID: JWaW4+YSTfSXKW0j8JpUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217541000"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:20 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 2/8] drm/i915/backlight: Use intel_panel variable instead of
 intel_connector
Date: Mon,  2 Mar 2026 09:36:07 +0530
Message-Id: <20260302040613.3324049-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
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
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index b9e9a05861d8..b139ab024e9a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -459,7 +459,7 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 		return val / 1000;
 	}
 
-	return connector->panel.backlight.level;
+	return panel->backlight.level;
 }
 
 static void
-- 
2.34.1

