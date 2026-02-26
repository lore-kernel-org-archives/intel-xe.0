Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10621FC591C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA8910E8C3;
	Thu, 26 Feb 2026 10:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7B35gz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CD910E8C4;
 Thu, 26 Feb 2026 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100526; x=1803636526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQoCgaxTf2lhI/IuaOkZ0f34flxZTGhpUkYOut8Ahd0=;
 b=a7B35gz4GJfyEg3V7noEEjKxB2by+p3XQrDJWHoMo6hK/ThzGpHI3LGe
 z8aaKVQ7SQ7axZav/MABJ1zbuWmwbpU9lHYKWG6LxKbqEjeRIlXqwfskP
 M2X72aO5GZfQljttllrYoWGGV9M8yjudK3ypbt+2RDDmkClk7DiUWNDaE
 G5RA2CEftQzEtfzMU6/RZQeV2Ena14rr473/rFDiBaniUiaq3KAa6cqm/
 IGXcEhUPVepwlDsPn70t0uN7s78zXil5zgd7ha0PEeWRVY+O0vv82Oe6j
 fybC5UbNWerTqay8URSQTfcv0nids7uSOaa3OG7+Gn3N2NiAXtmfnzOOY Q==;
X-CSE-ConnectionGUID: umPahUBWQw+GI21qNv7fIQ==
X-CSE-MsgGUID: Wgz1cC0BQee/wsAOpWlphA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90738865"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90738865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:46 -0800
X-CSE-ConnectionGUID: cr2Sqaw5TDyBE48kyT7eBA==
X-CSE-MsgGUID: oBpUgY0XThe7I9/NsAts4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247057555"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 15/19] drm/i915/overlay: s/dev_priv/i915/
Date: Thu, 26 Feb 2026 12:07:34 +0200
Message-ID: <20260226100738.29997-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename the one lingering 'dev_priv' variable to the
more modern 'i915' in the overlay code.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 98c3992f07dd..300f6d48180b 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1456,10 +1456,10 @@ static int i915_overlay_setup(struct drm_device *drm,
 			      struct intel_overlay *overlay,
 			      bool needs_physical)
 {
-	struct drm_i915_private *dev_priv = to_i915(drm);
+	struct drm_i915_private *i915 = to_i915(drm);
 	struct intel_engine_cs *engine;
 
-	engine = to_gt(dev_priv)->engine[RCS0];
+	engine = to_gt(i915)->engine[RCS0];
 	if (!engine || !engine->kernel_context)
 		return -ENOENT;
 
-- 
2.52.0

