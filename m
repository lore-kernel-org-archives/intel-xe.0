Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A1606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GgA5c049
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF9410FB23;
	Wed, 11 Nov 2026 11:20:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFBD10FB09;
 Wed, 11 Nov 2026 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396017; x=1825932017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNLc7C/ksAcsb1zqBb542iU+5OkYDuDq/tXyx0DCpHw=;
 b=GgA5c049Hq+s8nzLx67wzZX8lcsTSjvRvM10ZuxSg29msPwymDH3F3zg
 s9aEAdsCEWfkHTxP5y81WFIMQXjkIpN1mJDXJRn9XiajPIK1Ub1C6dWE5
 zWL9M+XKQDjGszjKKwp37IVZ8eOqE+plEsnUV19aeiEd+AHv6iWFZTx9s
 905yTcuavA4XAm+jxpbEFTe48YfnfSBM6TxRX+zjf1XfK/EixbKWiv9ET
 YraER4FKiRM5YfB+Zt+jOKI0KE9lI3b9KQp5ywXzIxYkqXsTsdc/Y5Jqt
 69skc8pWqNap6LTkZbJE8RjWoBHFi2RooOWMwP9hUcuyoqYJW09PSbzSR g==;
X-CSE-ConnectionGUID: 9MUMiVp4TC+NkPMQr1dfzQ==
X-CSE-MsgGUID: /FtTD2FmSPqlZx/UN60Feg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3209257"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3209257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:16 -0800
X-CSE-ConnectionGUID: b8OHYNjWTOWVHwESFYhbWw==
X-CSE-MsgGUID: 5KUBlb3aQSyITb2L3zFDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8560457"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH 01/13] drm/i915: Bump surface alignment to 32k on MTL for
 async flips
Date: Wed, 11 Nov 2026 13:19:55 +0200
Message-ID: <20261111112007.16790-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

MTL is seeing tons of GTT/ATS faults on async flips. Bump the
alignment to 32k to work around the issue. The magic number
was determined empirically. We already have a similar
workaround for ADL, but there we only needed 16k alignment.

I looked at this case already some time ago, but didn't really
manage to root cause it. It seems to be a bit more nuanced than
a simple "always need this much alignment" because IIRC I was
also able to work around by adding some guard pages around
the DPT mapping in the GGTT while leaving PLANE_SURF itself
still misaligned. So maybe some kind of prefetch thing or
something...

Cc: stable@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index def4798f8502..667abfc31464 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -591,6 +591,15 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
 		return mult * 4 * 1024;
 
+	/*
+	 * FIXME MTL sees GGTT/ATS faults with async
+	 * flips unless we align to 32k at least.
+	 * Figure out what's going on here...
+	 */
+	if (display->platform.meteorlake &&
+	    intel_plane_can_async_flip(plane, fb->format, fb->modifier))
+		return mult * 32 * 1024;
+
 	/*
 	 * FIXME ADL sees GGTT/DMAR faults with async
 	 * flips unless we align to 16k at least.
-- 
2.56.0

