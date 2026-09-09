Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB031C79FBD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A90410F1FB;
	Wed,  9 Sep 2026 16:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcht8FuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3F10F1FB;
 Wed,  9 Sep 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970683; x=1820506683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qgI+SKJxj6UNiKiyWmt6lDZrwAkPB4IkNdyRXjHlbqM=;
 b=Jcht8FuH34aECF2c9L2Mm1FIDx+NhYzpPrMBlaRA0sgiBbjebi0uRnY2
 oYzU2UtAV5ffjZe6K4t8NwArpsNg2xuNdeF5+39JNHBv/lGyKob0/yLJY
 87QtZJ9Js9jsGnndoy1ifVAtPKOS+KIel2WuWIdWnHw7Mf5RpZD9J3q1c
 Jg36OuPE9iDflrd7qVde4ghWoS1IgFF4iXAdcIUuln4BoSEdwXcTM8qrk
 I4bEW4A7zzkxNc3u55NG+GUaSZXF727hmyGC/wHMlo0JdU5I4VYC+B0el
 OCibG15h1SU76X5CrOEdxggx0aRbnoZJQZTI2FwK/cIt8NpJxmH5Ad8AA w==;
X-CSE-ConnectionGUID: QsJgAdVIQZyWGe2cyKLcNg==
X-CSE-MsgGUID: yXKwNW2rTZutwJEL+c8KBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114946775"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114946775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:03 -0700
X-CSE-ConnectionGUID: EQn/maR8SAKIZ70a+va/Rg==
X-CSE-MsgGUID: 9H21kHuhTgyer/WiFIQG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296298956"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 07/13] drm/i915: Extract intel_dsb_supported()
Date: Wed,  9 Sep 2026 19:17:24 +0300
Message-ID: <20260909161730.12969-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

Extract the "do we have a DSB and should be use it?" check
into a helper. This mirrors intel_flipq_supported() and should
help unify the logic around selecting the codepath which will
be used to perform the commit (mmio vs. DSB. vs. flip queue).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 13 +++++++++----
 drivers/gpu/drm/i915/display/intel_dsb.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index d9a270362a82..8e01e1eed291 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -1025,6 +1025,14 @@ void intel_dsb_wait(struct intel_dsb *dsb)
 			  dsb_error_int_status(display) | DSB_PROG_INT_STATUS);
 }
 
+bool intel_dsb_supported(struct intel_display *display)
+{
+	if (!display->params.enable_dsb)
+		return false;
+
+	return HAS_DSB(display);
+}
+
 /**
  * intel_dsb_prepare() - Allocate, pin and map the DSB command buffer.
  * @state: the atomic state
@@ -1049,10 +1057,7 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
 	struct intel_dsb *dsb;
 	unsigned int size;
 
-	if (!HAS_DSB(display))
-		return NULL;
-
-	if (!display->params.enable_dsb)
+	if (!intel_dsb_supported(display))
 		return NULL;
 
 	dsb = kzalloc_obj(*dsb);
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
index 3dcca9ed5371..87d9c90da08f 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.h
+++ b/drivers/gpu/drm/i915/display/intel_dsb.h
@@ -26,6 +26,7 @@ enum intel_dsb_id {
 	I915_MAX_DSBS,
 };
 
+bool intel_dsb_supported(struct intel_display *display);
 unsigned int intel_dsb_size(struct intel_dsb *dsb);
 unsigned int intel_dsb_head(struct intel_dsb *dsb);
 struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
-- 
2.54.0

