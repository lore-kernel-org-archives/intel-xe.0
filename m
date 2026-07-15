Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D736C4450C
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 10:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120010EF88;
	Wed, 15 Jul 2026 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKMsE9K/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399B710E034;
 Wed, 15 Jul 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784110938; x=1815646938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Av40bwP69Tlw8AswMHbue7R6++NgsLKe9lXz1x2nTyI=;
 b=nKMsE9K/KeVdiRgmbjZAH7xjQSbVywVoYNBQsGBW+3S6kJMpoao461yL
 fkPvo6I/JSglIPz8Qm4XsvoQavnpWUQqssh7jnFwkzS+8YmWoaDsHKce2
 GF9vaEO7TCB4celyMJopUWjUlK5+tuNNyrt8DbK2MGBz6sP4ZE2oRj4w8
 MTEQ9acny86IWYUwkQbDkkCm7wxZtameGaeQWSEOOXfK7l2fSm6zG9WWH
 2XbyX1yF61246IVshQ3Kz4jaqulknQoECwI7pe/fb9yc7RgfP8LEJUjx3
 7bPrudLfvMShCzwzZ35Q7n1Bcw6twLAjQOWRJsWdZk5/8DNbUdDgBCPAG Q==;
X-CSE-ConnectionGUID: iz6qTQKuSzasDvumP6+7MA==
X-CSE-MsgGUID: 8GTr/EPcRDa1aETfgCpQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102299910"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102299910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 03:22:18 -0700
X-CSE-ConnectionGUID: Taw3YauTQHeNep8fvwHy9w==
X-CSE-MsgGUID: UZNsyD2hRBKYv04sx9Gy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252743635"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 15 Jul 2026 03:22:16 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, suraj.kandpal@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 1/2] drm/i915/display: Add Wa_16030862157 to the display
 workaround list
Date: Wed, 15 Jul 2026 16:11:18 +0530
Message-ID: <20260715104119.4128662-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715104119.4128662-1-uma.shankar@intel.com>
References: <20260715104119.4128662-1-uma.shankar@intel.com>
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

Register Wa_16030862157 in the display workaround framework so that its
platform applicability lives in one place (__intel_display_wa()) rather
than being open-coded at each use site. The workaround applies to Xe3p
(DISPLAY_VER >= 35).

No functional change: this only adds the enum entry and the matching
case; consumers are wired up in a follow-up change.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index b4c49816f7eb..d6b036da3992 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -140,6 +140,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 						STEP_A0, STEP_B0);
 	case INTEL_DISPLAY_WA_16029024088:
 		return DISPLAY_VER(display) >= 35;
+	case INTEL_DISPLAY_WA_16030862157:
+		return DISPLAY_VER(display) >= 35;
 	case INTEL_DISPLAY_WA_18034343758:
 		return DISPLAY_VER(display) == 20 ||
 			(display->platform.pantherlake &&
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 92b3980bea84..338b32e4162d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -54,6 +54,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_16025596647,
 	INTEL_DISPLAY_WA_16029024088,
+	INTEL_DISPLAY_WA_16030862157,
 	INTEL_DISPLAY_WA_18034343758,
 	INTEL_DISPLAY_WA_22010178259,
 	INTEL_DISPLAY_WA_22010947358,
-- 
2.50.1

