Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D678606A901
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQRJe92n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD47210E8A7;
	Thu, 19 Nov 2026 20:51:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079CB10E8D6;
 Thu, 19 Nov 2026 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121455; x=1826657455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4D+aBUsb1HgHkhrsD7AM6t/kdf7nVVZQk1qf8v0k4KE=;
 b=aQRJe92nXZKAN5iYN/Wxn+GBB2VyleokXJ3yHbmnYiePyzgsbOXXU9Gu
 9h9ufrpS6TtVc6CN5/iKxUR77h713YZIiUBHz8YlGGoRyLxhXFExMF5Nl
 f/dgJ/4fSU3xMbGPA1M0hnmMNQJdC3qhoteFbj1WH5PZlGVXSF7Lm20dN
 b1O4qcg3JuIj7OEh2O9010vHUm1VHIcyMpoLbmVnHtQrkH+a584C4gOUO
 kWu2S8svkEe7yTnBD76pqfVddQgL8mI5+yNC9jhRkc5Y6Y7eBuLxL8DcU
 loY0V3Em3Mv8yVOSFceVlB+SaGPUlYTKlpx7k4xnO5KuDSeimqKuiPDmr A==;
X-CSE-ConnectionGUID: 8Fqbz0VJSIO9uS7eTBFePw==
X-CSE-MsgGUID: BcCi8xjHQcyH/OqicLhx3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884346"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:55 -0800
X-CSE-ConnectionGUID: SkMGoQPCTpmDXg4iSa1oNA==
X-CSE-MsgGUID: if6cTP00RsWwARqAv2K8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10524839"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:53 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/6] drm/i915/de: Pimp the intel_de_{read,write}_fw() docs
Date: Thu, 19 Nov 2026 22:50:36 +0200
Message-ID: <20261119205040.31935-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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

Include a bit more guidance on when to use or not use
intel_de_{read,write}_fw(), and what the extra caveats
are.

v2: Point people at the DMC code to help them figure out
    if they need the wakelock (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index a6dcb91b36f2..3fe99f0c331b 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -87,12 +87,19 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
 			       u32 mask, unsigned int timeout_ms);
 
 /*
- * Unlocked mmio-accessors, think carefully before using these.
+ * Unlocked mmio-accessors, think carefully before using these. Generally only
+ * highly performance sensitive code should use these (eg. vblank evade critical
+ * section, or interrupt handlers).
  *
  * Certain architectures will die if the same cacheline is concurrently accessed
- * by different clients (e.g. on Ivybridge). Access to registers should
- * therefore generally be serialised, by either the dev_priv->uncore.lock or
+ * by different clients (e.g. on Ivybridge/Haswell). Access to registers should
+ * therefore generally be serialised, by either the display->mmio.lock or
  * a more localised lock guarding all access to that bank of registers.
+ *
+ * DMC wakelock will not be taken by these. It must be done manually,
+ * if needed. See intel_dmc_wl.c for which registers need the wakelock.
+ *
+ * These will also skip the mmio_debug unclaimed register detection.
  */
 u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
 void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val);
-- 
2.56.0

