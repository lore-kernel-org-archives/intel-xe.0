Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0764C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 23:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C96710F420;
	Thu, 16 Jul 2026 23:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7wQ+8KD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC36310F420;
 Thu, 16 Jul 2026 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784242820; x=1815778820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=77Ao43E1vlSpFlJTEcaYOdxX29dn0UuEYyO6EJf0Cdc=;
 b=H7wQ+8KDLffbpwT8I9D2R69g6hAv08V1GBRFNZ5C0DU/1mKCgffbEzGD
 6c6RIOqE9vWcoCOFQTV5OXS1L5dUrlAx2dZQNnPIGnRSdd5otkmhFzOsb
 Qcu2GlZomBztRgeuBbOFALikHE5iO3l0PK2yMvIQzfnADbne24DpalM0v
 SlKQfoYu5My8jkYTVGii89Oc3KJtUNbszXbCi8VkUjnsa6+84kt1lVCci
 QxWQwat4VAgKCD6yEMzMLCLGDtmEJ+yofzFSD6R60K7v90CT/S3xyDEDd
 dtrfiP4Oe8Eatvj63+dCq1XLMAl7eKL5Kl452oIYV2AWQ9uIIySWUjtoF Q==;
X-CSE-ConnectionGUID: 78EqpJZoQc2Xw+7kV2Qo8g==
X-CSE-MsgGUID: wgD3DeDXST+go8K6H2yoqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="107711304"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,223";a="107711304"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:20 -0700
X-CSE-ConnectionGUID: ahAIO50FSW6f4DAP0+tHsA==
X-CSE-MsgGUID: TXJ8m4pdR1GyXaRcSAzn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,223";a="252227148"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.15])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:18 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 4/4] drm/i915/fbc: xe2_lpd+ no more surface size restrictions
 for FBC
Date: Fri, 17 Jul 2026 01:59:56 +0300
Message-ID: <20260716225956.555995-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716225956.555995-1-vinod.govindapillai@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

From xe2_lpd+ platforms, enabling FBC do not depend on the
surface size. So remove it.

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 20f02ef9387a..df8446457247 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1306,6 +1306,9 @@ static bool intel_fbc_surface_size_ok(const struct intel_plane_state *plane_stat
 	struct intel_display *display = to_intel_display(plane_state);
 	unsigned int effective_w, effective_h, max_w, max_h;
 
+	if (DISPLAY_VER(display) >= 20)
+		return true;
+
 	intel_fbc_max_surface_size(display, &max_w, &max_h);
 
 	effective_w = plane_state->view.color_plane[0].x +
-- 
2.43.0

