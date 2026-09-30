Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C593CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 11:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4A910F338;
	Wed, 30 Sep 2026 11:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDN4zsYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADB710F338;
 Wed, 30 Sep 2026 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790769192; x=1822305192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MmMU3Art5mNb2rZ9ay+rb6FOgzk9STOZ8xVMlodppF8=;
 b=EDN4zsYOcegHVhZYNCjDV1T6iFrObT4/hbGpCu9QvG4fagELP5GxdQRD
 8ia4+O47w0FrURUXUPpGsbzKlbV7fykaiEleBfxh/Lfa1U1fG83BNqGvO
 ag2Xge4ad+rTgBnM/EHitrPhIZ7hK2Dnd3pYmY+98nEGkmvAOMEwxzvdi
 164Ym6y0+buh8nSRoKiFvmtNiOwvYId5/Ra6AGk/IiPOWxl6BP34xeTan
 IMV3PR37hD45r6vGrDogBPWJOc9vLetc5L+zyn+qT5OVZLZN0yjPzbuXz
 OfvBqyOvm2M1l+eDypG+x17FS3GO9xx4uWsSYZ/sNLn36ckFjoibkao/V Q==;
X-CSE-ConnectionGUID: lJSoybzSQTOI8+4WIaUuAw==
X-CSE-MsgGUID: EtFfoOc8Roa88TwrQYsDVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93989578"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="93989578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:12 -0700
X-CSE-ConnectionGUID: fsg4VWhiTO6tfWPa6WnVGw==
X-CSE-MsgGUID: YarNLrcIT6OZMYfq5odk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="303605288"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/dp: Drop using intel_de_read_notrace()
Date: Wed, 30 Sep 2026 14:53:02 +0300
Message-ID: <20260930115303.24285-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

I want to eliminate intel_de_read_notrace() to shrink the
intel_de.h API a bit. That should help with the cleaning out
the remaining uncore mess for xe vs. i915.

Furthermore on xe intel_de_read_notrace() doesn't even do
what it says on the tin, and instead all register accesses
are traced anyway.

Switch the last users of intel_de_read_notrace()
(intel_dp_aux_wait_done() and intel_dp_aux_xfer())
over to the normal intel_de_read().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3cb07b0a901c..cd361164ecb8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -66,7 +66,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 	int ret;
 
 	if (intel_parent_irq_enabled(display)) {
-#define C (((status = intel_de_read_notrace(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
+#define C (((status = intel_de_read(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
 		done = wait_event_timeout(display->gmbus.wait_queue, C,
 					  msecs_to_jiffies_timeout(timeout_ms));
 
@@ -324,7 +324,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	/* Try to wait for any previous AUX channel activity */
 	for (try = 0; try < 3; try++) {
-		status = intel_de_read_notrace(display, ch_ctl);
+		status = intel_de_read(display, ch_ctl);
 		if ((status & DP_AUX_CH_CTL_SEND_BUSY) == 0)
 			break;
 		msleep(1);
-- 
2.54.0

