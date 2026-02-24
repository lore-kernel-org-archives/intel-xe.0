Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D3EFB7EF
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2CD10E49D;
	Tue, 24 Feb 2026 03:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGb3PqQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AEE10E49D;
 Tue, 24 Feb 2026 03:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904734; x=1803440734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LWfhxaLSYBJD0G7kjv3h4XLV9CuYMQ+AnaelnKrtN4=;
 b=bGb3PqQutsN0f/Y8lQUFC9QWZ+siHAktXNy7ATAYI4pj1aWdz28PiOeA
 awxid5bluTb1SzkIDK7T+4GGUWi7L1jrnV6tWUo67W/zpWoTg3AEMuwSf
 ZbTkHgz6ohM6zal67bbdbCJkKNBopA7rpVvQ2fJlcTHedM19PeDpe6u8n
 Z6HzwbfqMFDeRPsSKiG8gR+rNv1ISNNGoH6h167pmdYcqooncFWPszKjU
 2VRli+m6FeyYBhzKsjg+4tfu/xwcTWhoh6bjcIgmFQGWXJgbfwmeDJI+g
 Bsl+CE9w8+evFdJBOr8mOgsS+nrhmhswvCffk9eUuq88HzUlSV9t06UA1 g==;
X-CSE-ConnectionGUID: fKVQV91PQz2yQ+O7FxDdMg==
X-CSE-MsgGUID: gZSOkXpmSb+QLxIIZt0+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817858"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:34 -0800
X-CSE-ConnectionGUID: kEva6EBOTg6n4DVp07c5Zw==
X-CSE-MsgGUID: +siFcq8cSkKwDL3Us4wIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010621"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:32 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 2/8] drm/i915/backlight: Use intel_panel variable instead
 of intel_connector
Date: Tue, 24 Feb 2026 09:15:20 +0530
Message-Id: <20260224034526.2730130-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224034526.2730130-1-suraj.kandpal@intel.com>
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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
index c40ce310ad97..05d6d033f60b 100644
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

