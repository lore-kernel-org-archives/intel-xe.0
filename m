Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23888C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D640E10ED22;
	Wed, 26 Aug 2026 13:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJ6H+UEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DDF10ED13;
 Wed, 26 Aug 2026 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751663; x=1819287663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vtw51PAKTEb/SxfkDycZ1DVlwaol7e3dXJd94WpbJZY=;
 b=TJ6H+UEFY2PaHegA0af8soOn5D+XxoXG9nQHlRUBwRxwlDc26lsELZYm
 Lg+cMixE0LaLBSeOcFM7j3OReVic24fKw8Px+wktTi6d32IFoYnkHQRZy
 GJK1PN+CHOYlAauHzDEOK7kAcd1fO52sx4LGsI0R7Nm9mazhpD9h2/bYk
 fmqAjyep0znI5zFe6uZgMhLTv14RbqKq6I0CU2JOTNhBILmSofYAsAVxG
 dCO62EWMjPjE4FRPVM35zGSPhjocYlOBJ0+sZxzx7OAcVX2TfSKIUA8lt
 bSklQZ9oNelv6ytHpNAVkYi+sXbugexhGUmgdh61TVvNQPsrj5dSOYqYG A==;
X-CSE-ConnectionGUID: Tj/E1+zrRHe0Jg1f44sihg==
X-CSE-MsgGUID: Adi8LFpVTnaSUQ38eZn3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92053066"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92053066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:03 -0700
X-CSE-ConnectionGUID: kAZnEbaPS8G5U3OqUQgm5A==
X-CSE-MsgGUID: xQeyP3+oS7mHjbKUF7xVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265780001"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 06/14] drm/i915/cdclk: Drop pointless platform check from
 bxt_set_cdclk()
Date: Wed, 26 Aug 2026 16:40:25 +0300
Message-ID: <20260826134033.13976-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Overwrite cdclk.hw.voltage_level from intel_update_cdclk() at the
end on bxt_set_cdclk() also on bxt/glk. While this isn't actually
necessary due to bxt/glk not having any extra DDI based voltage
level requirements, it does avoid one less silly 'if' in the code.

On icl+ the value derived by bxt_get_cdclk() may not be correct
if the voltage level was bumped up due to DDI requirements, thus
overwriting the assumed value is crucial there.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e05b6e76363c..6453a7cc0cee 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2335,12 +2335,11 @@ static void bxt_set_cdclk(struct intel_display *display,
 
 	intel_update_cdclk(display);
 
-	if (DISPLAY_VER(display) >= 11)
-		/*
-		 * Can't read out the voltage level :(
-		 * Let's just assume everything is as expected.
-		 */
-		display->cdclk.hw.voltage_level = cdclk_config->voltage_level;
+	/*
+	 * Can't read out the voltage level :(
+	 * Let's just assume everything is as expected.
+	 */
+	display->cdclk.hw.voltage_level = cdclk_config->voltage_level;
 }
 
 static void bxt_sanitize_cdclk(struct intel_display *display)
-- 
2.54.0

