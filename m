Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56569C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A54310E21A;
	Wed, 16 Sep 2026 08:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkCoonBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F02010E81D;
 Wed, 16 Sep 2026 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547399; x=1821083399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6fMbMdTGzqEhPgh1qxMoMkPSLJJlThXMSKmDMsbVbo=;
 b=LkCoonBZ+Yu9wWIpdO1MeJSGgft4IUeaigZCxMty5nCW6i2uOOVVBtUO
 H3cOXeR6ZAVd56vxmhsYTO0gSsi3FTObcyn33dwZ2UzPKCSH+p5XmD0vs
 +dBlBzWEmLK30t5ujUIQ+fsZ/nD+W5Axc3wqG1oK47GZMZt9MekDlodxI
 i4NoULoj57HdBFGZUqGwKF9R43LU5NbCUC9P2mwzlLBTIEHuh4wdvTZV0
 m7fOImm4Yx7NDJiqo9DwJpNKOWtsZYDn2KNXzq+zSSpq0x1gu7m7aUPL7
 jatf6cbuJauB/HfZLEAJ/4CmwhwZkMV4RI/xvzAH1i+IRER6Ex0S9md5c Q==;
X-CSE-ConnectionGUID: S1cFKaNCQyaaOLiWR/45PA==
X-CSE-MsgGUID: c2O1iyH/Reerxi8wI/rCkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429608"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:59 -0700
X-CSE-ConnectionGUID: PcnFgaM3QIqhOO9W3jsyqA==
X-CSE-MsgGUID: /dnO8fyzRtmxqYKxCgD1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276796700"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
 write_byte}
Date: Wed, 16 Sep 2026 11:29:34 +0300
Message-ID: <67868fd8a8c8e057ba82c4b142fabae2d0fa52d6.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

Rename an int r to ret while at it for clarity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 10943539bc7c..9ef9d0e45258 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -628,7 +628,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 					     intel_alpm_aux_less_wake_supported(intel_dp)))
 		val |= DP_ALPM_MODE_AUX_LESS;
 
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG, val);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG, val);
 }
 
 void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_state)
@@ -751,11 +751,11 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct drm_dp_aux *aux = &intel_dp->aux;
+	int ret;
 	u8 val;
-	int r;
 
-	r = drm_dp_dpcd_readb(aux, DP_RECEIVER_ALPM_STATUS, &val);
-	if (r != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS, &val);
+	if (ret < 0) {
 		drm_err(display->drm, "Error reading ALPM status\n");
 		return true;
 	}
@@ -764,7 +764,7 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
 		drm_dbg_kms(display->drm, "ALPM lock timeout error\n");
 
 		/* Clearing error */
-		drm_dp_dpcd_writeb(aux, DP_RECEIVER_ALPM_STATUS, val);
+		drm_dp_dpcd_write_byte(aux, DP_RECEIVER_ALPM_STATUS, val);
 		return true;
 	}
 
-- 
2.47.3

