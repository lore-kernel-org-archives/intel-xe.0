Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D7B606AC0E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aONFSUWE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B5310FF65;
	Wed,  4 Nov 2026 22:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BB510FF5A;
 Wed,  4 Nov 2026 22:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830740; x=1825366740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QVlxESllzDNsOkkISvIHmAk9VcW/hvlAC0vqmqJyyxM=;
 b=aONFSUWEyzYvajxni1fHlXZeASHw0XP1O6pPlPoctdt/VSfnLpvucOcz
 AscmBakIPd5suE3JV6TpdEIZomOLi52DyWucc8Dv/hSjOYPU4drsDHtmq
 EDfZOZt6Vn56YEKJXfTvVcZ5UamjEAIClL2FrWUIEWrCjSsfI+zULetSc
 hSKCoR0iup4yVh66dT0q6DWloaGI4hoVPyFQKLNa9cCXRafI1hBUeCQMt
 jJQeUxma36c2xkyGS6NPAsl2SiJ9fhY2ajoUZSct1AlPZTFOeobihYSbu
 s5ctYYzOvTucOkDPGk1KaVOFmzmsNLHRmF1xtHPyGZ3ZMX/Edlg5Tke/Q Q==;
X-CSE-ConnectionGUID: gScgHStNTBG/frxGoM/L4w==
X-CSE-MsgGUID: /ml3ZNlMRfGB/nt3HaZsDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2479805"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2479805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:00 -0800
X-CSE-ConnectionGUID: F4pFjO3TRhC/2OZQkjTtjw==
X-CSE-MsgGUID: 29ISdEfoSwO/fzU+Ie+sRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6989882"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:18:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915/de: Introduce mmio read/write templates
Date: Thu,  5 Nov 2026 00:18:36 +0200
Message-ID: <20261104221842.18799-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In order to eliminate runtime platform check overhead from
the mmio read/write functions, we'll need a good way to construct
optimal variants for each platform. Do that in the form of
__intel_de_{read,write}() that can be customized via (compile time
constnt) mmio_flags. The compiler will eliminate all the stuff
we don't want.

For now there is nothing to eliminate but next we'll start
moving more stuff in to make that possible.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 4f423a684ec2..cde2886fe2ca 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -163,16 +163,38 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	return intel_uncore_read16(__to_uncore(display), reg);
 }
 
+static __always_inline u32
+__intel_de_read(struct intel_display *display, intel_reg_t reg,
+		const unsigned int mmio_flags)
+{
+	u32 val;
+
+	val = intel_uncore_read(__to_uncore(display), reg);
+
+	return val;
+}
+
+static __always_inline void
+__intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
+		 const unsigned int mmio_flags)
+{
+	intel_uncore_write(__to_uncore(display), reg, val);
+}
+
+#define I9XX_MMIO_FLAGS 0
+
 static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
 {
-	return intel_uncore_read(__to_uncore(display), reg);
+	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
 }
 
 static void i9xx_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
 {
-	intel_uncore_write(__to_uncore(display), reg, val);
+	__intel_de_write(display, reg, val, I9XX_MMIO_FLAGS);
 }
 
+#undef I9XX_MMIO_FLAGS
+
 static const struct intel_mmio_funcs i9xx_mmio_funcs = {
 	.read = i9xx_mmio_read,
 	.write = i9xx_mmio_write,
-- 
2.56.0

