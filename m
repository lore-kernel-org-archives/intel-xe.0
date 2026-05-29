Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E928ECD6E51
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14D810FD2E;
	Fri, 29 May 2026 11:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgHsT1Yz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA50110FD22;
 Fri, 29 May 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052685; x=1811588685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mD1eIrq6FrXMRchkARB+zPAOx4hwVnhaRRr6OVZwHt8=;
 b=lgHsT1YziFQvi2aDkmvYW+Pe2wCvd3hJFqM0epHafCFWbYd4c7X6JiN9
 fyVhtebW7v0C+NugxaNZ2WH5pf9EBqXypjwiDK4sT8KGJdMjbyzcf5TWM
 pcApkth5h8ams2f5zA074qKQxP7fLTlOe8QH0T4LHfqmdss3MqBP1sCkA
 KltmZIb0ebJk10iSQTNOA107AEjQulydfUxcWHRTs0gV6W8nh2PdPBia4
 6Oz75zg0ITr53GsZSAiQ9PFY6hkJ6gfyFqB4SjLuYToN2zpC7NQr/K7wj
 iTCgI557Rxw8s9JXxGlk4O2uHRjAie+AS30jKDVrpByIpxF7KxW43q5vQ Q==;
X-CSE-ConnectionGUID: XbNmZQi9TS2Ml4JTM5/Obw==
X-CSE-MsgGUID: kmOoCkxCQ6iejqG0mxhXVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92377780"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92377780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:45 -0700
X-CSE-ConnectionGUID: wXxSD3O1Ro6dNrEfRkl2iw==
X-CSE-MsgGUID: RP5G0RF6S5KmenJy9zWG6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246840876"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 02/24] drm/i915/xe: Enable HPD polling later during system
 resume
Date: Fri, 29 May 2026 14:03:46 +0300
Message-ID: <4cd4710e34451b6d100a05ca09be18737472b3c5.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Imre Deak <imre.deak@intel.com>

The detect hook of connectors - called by HPD polling - will check if
user accesses are enabled and prevent the connector detection if that's
not the case. Accordingly enable user accesses during system resume by
calling intel_display_driver_enable_user_access() before enabling HPD
polling.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 810d93fefcbc..c0d3e7d12823 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -452,8 +452,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	if (intel_display_device_present(display)) {
 		intel_display_driver_resume(display);
-		drm_kms_helper_poll_enable(&xe->drm);
 		intel_display_driver_enable_user_access(display);
+		drm_kms_helper_poll_enable(&xe->drm);
 	}
 
 	if (intel_display_device_present(display))
-- 
2.47.3

