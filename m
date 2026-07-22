Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84DC4453C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552E110ED9D;
	Wed, 22 Jul 2026 13:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDNS181C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4010E59B;
 Wed, 22 Jul 2026 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784726711; x=1816262711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpv57qzMIROs4K7fyWP1390OxBnkiUWhKHh3P9eu1E0=;
 b=DDNS181Cu2Am01j/fRcvRh1oysNFaY7CL9IHwrx72NGy2bLsUGAYNHhl
 jjSDgYta5EG8XGQLXFGoh4paPw0YzOi+6CJB8hc168D2sIGrqhcf+Rk7S
 sWvM3FqOmt4rF9IWV6Iw4D0uZhsvaxWiGUthqKEiQHP9NsUY2RQVkT65e
 r1ARunPy0N51OLST+b/d77P+4ssechfPX2aNoWw6T/DxGeozzajY3Tp4e
 2PslCshaa7SVbUUkNKCKB3zBZt9PWxbKPreXervK2zETF4Dq7WQob/VP3
 PJ4PiEVccd3f8PjrxbmcFFyZhPuEph6u9bQ3RHFJUPwtSNKgjO7BcrdYt g==;
X-CSE-ConnectionGUID: RoRR/zimTcK/1uA8HAaJ9w==
X-CSE-MsgGUID: NfYTTubBQ7WYoMhzcggUOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96016999"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208,223";a="96016999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:10 -0700
X-CSE-ConnectionGUID: P83rdtTFTUeUPFWylHRzlw==
X-CSE-MsgGUID: K8hrOIIFSFetXItA967tUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
 d="scan'208,223";a="254687821"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.191])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:08 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 3/3] drm/i915/fbc: No surface size restrictions from LNL
 onwards
Date: Wed, 22 Jul 2026 16:24:48 +0300
Message-ID: <20260722132448.318112-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722132448.318112-1-vinod.govindapillai@intel.com>
References: <20260722132448.318112-1-vinod.govindapillai@intel.com>
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
surface size. So remove the check.

v2: changes to patch description

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

