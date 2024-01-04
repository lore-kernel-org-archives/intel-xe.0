Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E124C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 16:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAC10E4CA;
	Thu,  4 Jan 2024 16:07:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E010E4C3;
 Thu,  4 Jan 2024 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704384419; x=1735920419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UuF6DWBtJDXk1ZMO36KznMUEg4+dJIwhOdlFeXImyuU=;
 b=GATi2zzPzrgD0XrxZxIJUqmU1mhELPLcATYfz8xhIYvwZVWiJqMn91N4
 +ihMFUVAa+axHlHpwlNYDaDXGm6loQL+1k6JkBHitHYEBTBT7KOUcY1gO
 Zhddi+/qewuxjtKtAZZ+rxOeOdhRcNOp8Z8C7spLlOYQXyv4ExwQljhl4
 glQpazOg+Uv1Yqo6nABbxvkLWCKy3wo+dPcvPmm8AcCdaF+Eq+7kLNMRT
 tyjzdxe8H9Vy4bU1B9F49EMkbX9E9COTKHemQNOcUASHnVTnMrT4vR72T
 zcH7ujnp1134ssb37AOmNwlRH/oiBAvWrkWQ5ZLladlIo9vpk7ONYbOjA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="394461073"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="394461073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="22534621"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:06:04 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915: Disable DSB in Xe KMD
Date: Thu,  4 Jan 2024 08:05:56 -0800
Message-ID: <20240104160557.48496-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Often getting DBS overflows when starting Xorg or Wayland compositors
when running Xe KMD.
Issue was reported but nothing was done, so disabling DSB as whole
until properly fixed in Xe KMD.

v2:
- move check to HAS_DSB(Jani)

v3:
- use IS_ENABLED(I915) check in intel_dsb_prepare()

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/989
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1031
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1072
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 482c28b5c2de5..a6c7122fd671d 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -453,6 +453,10 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	if (!HAS_DSB(i915))
 		return NULL;
 
+	/* TODO: DSB is broken in Xe KMD, so disabling it until fixed */
+	if (!IS_ENABLED(I915))
+		return NULL;
+
 	dsb = kzalloc(sizeof(*dsb), GFP_KERNEL);
 	if (!dsb)
 		goto out;
-- 
2.43.0

