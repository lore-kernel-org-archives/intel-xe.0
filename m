Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C60606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLQJAgcR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2BB10E990;
	Tue, 10 Nov 2026 18:46:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11C10F198;
 Tue, 10 Nov 2026 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336399; x=1825872399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XP0fd9bnBYKuQs/qckB0k2VsjSh9UKQLdEXmtsCq2Ek=;
 b=VLQJAgcRI7HrYmq8ucJ9galglZ2bNJf1wfwJKCUJYaa4DZxkBPQF/UKJ
 02MtluM0H3w+lZQJfhnwCH8Ixg2h8j861d6dKWaSvB7o5esdEyNRL6uEX
 h81kAG41wqhNyiI73mGa97GVJ3bZmkRbNs/6FJJ4TtXra/6oVsQVrKy7p
 hvblvyuGXVhDDUDf18+FtjBXvuDYf5KQI9JQoda+4+YgAPlcjhlgl3/uz
 9Xf4s2hAruUt3rkugXcKJTnrnnaCOkKWUheg1C9QbZFPta2qvfLQ6B/4s
 L9qG+Gp3HPioFMAbD8HhqD8mMhROncVJBw+wqUs6Au4qzrrI9qAmea5Sk A==;
X-CSE-ConnectionGUID: /KQy+yOORp2VRMXRyC1pmg==
X-CSE-MsgGUID: RN/JMQgoRiiH5Jv9VT1orw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2972810"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2972810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:39 -0800
X-CSE-ConnectionGUID: BshqReVjSHalZsNB6Eh3FQ==
X-CSE-MsgGUID: 0QZ1BL2uSqyj6c0LcVcMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8550971"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:38 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v2 03/10] drm/i915/de: Introduce mmio read/write templates
Date: Tue, 10 Nov 2026 20:46:14 +0200
Message-ID: <20261110184622.1721-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
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
constant) mmio_flags. The compiler will eliminate all the stuff
we don't want.

For now there is nothing to eliminate but next we'll start
moving more stuff in to make that possible.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>
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

