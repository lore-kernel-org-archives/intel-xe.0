Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44F606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fMetkSRM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477B112572;
	Fri, 13 Nov 2026 13:44:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611D9112577;
 Fri, 13 Nov 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577447; x=1826113447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wexc2l9ypEgR5huCJgMbrnbLdjdvkMogP8nd/tnxOX4=;
 b=fMetkSRMXYU6luFRfF/iOKkIfJBZDyncpFxc/LuiqTcyGVosQpYt+0Wu
 XlzVRWQTDpQZ+bIAlDUlON9lEYTvCtYeOkebTdOo3z4uO3VcSgGYwRrXl
 zgvdod/xiV5VTNCE+gXiTsEhT161YroyRXh3tTSXrhRWEtXfUKagSp7hc
 kq+niqHTP4Dk3lCsg7hNpPAfjyDpN2WVVbXkkSvoyykAghH3xzzlDwwgH
 Cjn/RkQMSc7hranPVPU9R67vPHoPBnGZqqpbO7Ze9+Oum3zXULQ9PlNnb
 PKszkbF+9Po+CP6Ng3Dg5yWv2r6NQkeqWskp2jMurRsTDWopAONs26jFN Q==;
X-CSE-ConnectionGUID: 4Jgi7JJdQii84te8hUC12g==
X-CSE-MsgGUID: BqSr0qekTXSQIe/xzspqjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3382528"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3382528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:07 -0800
X-CSE-ConnectionGUID: Pf2OCkQzStC+1soL3F617g==
X-CSE-MsgGUID: auTbLSn3Rnm5Y0+y+yOe5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9345274"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/de: Pimp the intel_de_{read,write}_fw() docs
Date: Fri, 13 Nov 2026 15:43:49 +0200
Message-ID: <20261113134355.14579-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
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

Include a bit more guidance on when to use or not use
intel_de_{read,write}_fw(), and what the extra caveats
are.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index a6dcb91b36f2..2c469a2d6a20 100644
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
+ * if needed.
+ *
+ * These will also skip the mmio_debug unclaimed register detection.
  */
 u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
 void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val);
-- 
2.56.0

