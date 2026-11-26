Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF90606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZhsrQmG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEB111271C;
	Thu, 26 Nov 2026 21:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913C112724;
 Thu, 26 Nov 2026 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728487; x=1827264487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p2x6Giot7XVvlDqbpgec9iy/8vGfscXcRS6AxvAfr5U=;
 b=DZhsrQmGj3cYAl9I98CTv32MGOXGOfAEIajTfAshnxjS8GWENykwNQgi
 JXggImAdW4TCkpCvabpxYmJm7A/i1F0ImIT2bIbNW8LnzS86QxhwYWbTh
 nyK92/8gSQ0pv+dF5MfsmsRAlkVg9/tjXXZr5I0x63Zg/HPaCUfWEJtKs
 rYcRBc+szSLqg9qCeQmQss7I93d9DVEg/HMi+/Igv5ST9mjt7QyWv1zm2
 1a+nRV85K7LGX7OQBOHeKij7LlRAODFNi3JXyShKUEZo2G35Z0JsFanTC
 nmbQ1ykvz+tfwhAl+aEcyH9bKVjc5ZodlvAfU3UZnQeevX1b+3egulxSJ A==;
X-CSE-ConnectionGUID: ieus5vs6S1aqNQcUsCwlhA==
X-CSE-MsgGUID: uPnILYiORwqIRLvNgCepcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4537105"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4537105"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:28:06 -0800
X-CSE-ConnectionGUID: +YVQ4cX/SsmLj4UAoNjbig==
X-CSE-MsgGUID: Pg92jQ7+SBe+sTZ86Clf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="13933857"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:28:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/de: Document intel_de_write8()'s usage
 restrictions
Date: Thu, 26 Nov 2026 23:27:28 +0200
Message-ID: <20261126212728.9034-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
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

intel_de_read8() has a comment explaining the WARN and why the
function doesn't need to do anything exotic beyond the raw
readb(). Add a similar comment to intel_de_write8().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 6d34a03d243a..fb86abe0301d 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -165,6 +165,7 @@ u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
 
 void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val)
 {
+	/* this is only used on VGA registers (possible on pre-g4x) */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
 	trace_intel_reg_rw(true, reg, val, sizeof(val));
-- 
2.56.1

