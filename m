Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31462CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539A310E522;
	Mon, 13 Oct 2025 20:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPIC6nn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581D710E51E;
 Mon, 13 Oct 2025 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386369; x=1791922369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8M5iht/X/9BNAOzQyeL+Ki038oleoB1buNj2veOxPo=;
 b=IPIC6nn7Vr2wNKaNRdgHVHJNPdYW2DvFBLCFbwOMtFqI4KnKAo6R1eXH
 D3fOPwqdhh9qeerPo4PKyby80Hx4KUwOdNdScEoPVT4DlBrnOptfjOBeD
 7BBRfSh0qE7koKKhY5NGLd0D9ghcFq4PcrWJJ4n3w/ux26IvrNSkMFfaU
 pitqwiviF6OqSBGmU3OHpcVhHXzLoG4QpAqkYR33Tzxz36PskXQQTk1Br
 tqKZBIbpfTK1PoOWT0dmm2p0ADoxbnwXnhcW6buAB4cRHYNj4CiXkvgUP
 u3NW55XSKSCRtarIvWNoo/ao8XlO4Zn8YH66sTpaN80Juiw9od6LQcUlG w==;
X-CSE-ConnectionGUID: c0qLO/0VSbSoGju7/jrP9Q==
X-CSE-MsgGUID: wZuZc2L2TFOQhUKRN4AzdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="65159153"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="65159153"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:12:49 -0700
X-CSE-ConnectionGUID: +htP6SMQRBOGHtlWXU8UgQ==
X-CSE-MsgGUID: 7qZUrYgRTFy5K8Ev6kbzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181250695"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.105])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:12:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915: s/"not not"/"not"/
Date: Mon, 13 Oct 2025 23:12:29 +0300
Message-ID: <20251013201236.30084-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251013201236.30084-1-ville.syrjala@linux.intel.com>
References: <20251013201236.30084-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Elimiante the repeated "not not" in the bw code comments.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index a4d16711d336..d03da1ed4541 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -831,7 +831,7 @@ static unsigned int intel_bw_crtc_num_active_planes(const struct intel_crtc_stat
 {
 	/*
 	 * We assume cursors are small enough
-	 * to not not cause bandwidth problems.
+	 * to not cause bandwidth problems.
 	 */
 	return hweight8(crtc_state->active_planes & ~BIT(PLANE_CURSOR));
 }
@@ -846,7 +846,7 @@ static unsigned int intel_bw_crtc_data_rate(const struct intel_crtc_state *crtc_
 	for_each_plane_id_on_crtc(crtc, plane_id) {
 		/*
 		 * We assume cursors are small enough
-		 * to not not cause bandwidth problems.
+		 * to not cause bandwidth problems.
 		 */
 		if (plane_id == PLANE_CURSOR)
 			continue;
-- 
2.49.1

