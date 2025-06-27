Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBAC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 20:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9510EA2A;
	Fri, 27 Jun 2025 20:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7dEKuRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4867510EA6F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751056245; x=1782592245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PG2Edv7FZ476eQTVRq5mUMvcKeBzlD4c64cJKNvpgr8=;
 b=I7dEKuRWHVTTMYBOlqVnp350/oKvgBeBMry3JojWAWjaHfYD7yL4jVlK
 6TpngTfWot/gleFwVA/CYYa+abVxhJcP3ZrhLSpUfmM8K1wKZgNVRUpIZ
 ycgo4+m4i76E7UxP5eAUyBwYz7LiHQ04twMogJr4rO9mVZSKMfkxMH1Og
 E5DcltT7ygssaKEBvUpGwUcN45GFvYmb+TLuGsot26cv/4U2fUCZZPRGM
 lQM2f14BL2qbtZmqQYYElTqOLRME9q6dJ8sWCoYM7uWQPLoqRexfhe+bd
 95OypHzsbk/ikFnglTwNbQ+Gvxo6qJ3e182PXgvix5rawxEKEsHIMUFJf w==;
X-CSE-ConnectionGUID: Bih4daLmQ+axQ9TAg+0gVw==
X-CSE-MsgGUID: +TqGDhdkQXSBFJzcaBrL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64068007"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="64068007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:30:45 -0700
X-CSE-ConnectionGUID: PUX1LzV6Sjyc8MK3SuO0jQ==
X-CSE-MsgGUID: aFFmJQcXR9iDnX34xzUnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="157175940"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v2 1/2] drm/xe: Fix conflicting intel_pcode_* symbols
Date: Fri, 27 Jun 2025 13:30:34 -0700
Message-ID: <20250627-xe-kunit-v2-1-756fe5cd56cf@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
References: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

If CONFIG_DRM_XE_DISPLAY is set, the xe module can only be built as
module to avoid duplicate symbols from i915. The interface for pcode was
added without considering that, so the build breaks if both xe and i915
are built-in.

Since the intel_pcode_* functions should only be called from the display
side (xe side should call the xe interface directly) and there's already
a protection in Kconfig to avoid the problematic configuration, ifdef it
out in case CONFIG_DRM_XE_DISPLAY is disabled.

Closes: https://lore.kernel.org/r/3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org
Fixes: d9465cc8ac2d ("drm/xe/pcode: add struct drm_device based interface")
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 87323ad0cbbb2..6a7ddb9005f99 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -337,7 +337,9 @@ int xe_pcode_probe_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 
-/* Helpers with drm device */
+/* Helpers with drm device. These should only be called by the display side */
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+
 int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
 {
 	struct xe_device *xe = to_xe_device(drm);
@@ -362,3 +364,5 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
 
 	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
 }
+
+#endif

-- 
2.49.0

