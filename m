Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA4C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 20:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8692510EA7F;
	Fri, 15 Dec 2023 20:33:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5421F10EA7F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702672417; x=1734208417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bM2VRwRTALBB+7jEFyHnY2Lpj02n/0+LcIwn8NCk1P8=;
 b=FWGcbdcEAKRRUYAfKOtQ6mXKk0Y2uI+T8TRp5bUUbz06UDqkD57DRoW3
 sWcQzf5u0z6mTbMGTpw/tZBofSR28p7Db9uwEAkdPBBvlAdGoBk8rOepK
 719cAvCK54aoF5oOcBtmGG/oEQigo1iIfJ1zns0DpcecmK1Fqw/G6z8X7
 BVlKhQ4kfggxtwbqkOk236gfm92UP+qCGfTLQrxV9jKj5zOuGhpGnNgV6
 zZ9PdzDTEGzgTYrdRvT6lI78B418nTM9oywzaO7KcMd+M2WkmIWi0eotr
 Diexlt0u19SNOkX9IFNJZxzMg+XzDVXzNpBhXxx/Bw8aeoXnrp39d6lpO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="385744476"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="385744476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 12:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="724565645"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="724565645"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 12:33:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/display: Fix dummy __i915_inject_probe_error()
Date: Fri, 15 Dec 2023 12:33:31 -0800
Message-Id: <20231215203331.3297341-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: francois.dugast@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When CONFIG_DRM_I915_DEBUG is not set, a dummy
__i915_inject_probe_error() is provided on the xe side. Use the same
logic as in drivers/gpu/drm/i915/i915_utils.c to ifdef it out. This
fixes the build with W=1 and without that config:

	  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
	../drivers/gpu/drm/xe/display/ext/i915_utils.c:19:5: error: no previous prototype for ‘__i915_inject_probe_error’ [-Werror=missing-prototypes]
	   19 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
	      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_utils.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
index 981edc2788bc..43b10a2cc508 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
@@ -14,9 +14,13 @@ bool i915_vtd_active(struct drm_i915_private *i915)
 	return i915_run_as_guest();
 }
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
+
 /* i915 specific, just put here for shutting it up */
 int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
 			      const char *func, int line)
 {
 	return 0;
 }
+
+#endif
-- 
2.40.1

