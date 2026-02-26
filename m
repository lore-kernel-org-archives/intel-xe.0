Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9182BFC5910
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548BC10E8C9;
	Thu, 26 Feb 2026 10:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1yXwoZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FAA10E8C9;
 Thu, 26 Feb 2026 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100535; x=1803636535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCTjyOyE62cXkCNY7g5AqUpwGSTwgat75piDCViXv3k=;
 b=W1yXwoZYmSlr4+19goxvULXwCwPHLqha4du8M0MMiCP4CIJe7iKq6fo1
 KOwEhSF5sD0tdsXftHtuvhSUWLGzILRPIVGrJnfbGCzBUUbaADkwcQO4P
 zuvfxBV9/WkcKA15sFcvdeSBbFF3rHMhkuH/Q4Rbq6M86sbkBFDwv8R2e
 K89wbU7m+nDWkDrhywlwFDkHlijIhv4vSuxxpZoQULRGBJWMy3Gn7M+yh
 /fqbfNMrJIEjmezni80xi0zMBuwOmutjG44WnXKS/t+Bd0TANl3nq0Jeg
 PhdExbov8tsy1SAWscH/gnYH2/Zc/PoSkYMj3rVBJje8Ctkog7NzW1qeY A==;
X-CSE-ConnectionGUID: Ek3mVeF7Toy3jHb6zG6A7w==
X-CSE-MsgGUID: MZQ3QvbCTs6cKaJlKvVWmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83866941"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83866941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:55 -0800
X-CSE-ConnectionGUID: pEqZKA9QTDGO28GYWoh3gg==
X-CSE-MsgGUID: tsMP8/SyQ4mlYIraUr7juA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221513139"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 17/19] drm/i915/overlay: Don't use fetch_and_zero() in
 display code
Date: Thu, 26 Feb 2026 12:07:36 +0200
Message-ID: <20260226100738.29997-18-ville.syrjala@linux.intel.com>
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

We don't generally want fetch_and_zero() on the display side, so
stop using it in the display side intel_overlay_cleanup().
Fortunately we don't really have anything to do here apart from
freeing the data. And we'll keep on clearing the pointer, just
in case something somewhere cares about it.

v2: Adjust the commit message since we do apparently
    have fetch_and_zero() in display code as well (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 10a235ce608e..26ea7e9f4283 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1554,13 +1554,8 @@ static void i915_overlay_cleanup(struct drm_device *drm)
 
 void intel_overlay_cleanup(struct intel_display *display)
 {
-	struct intel_overlay *overlay;
-
-	overlay = fetch_and_zero(&display->overlay);
-	if (!overlay)
-		return;
-
 	i915_overlay_cleanup(display->drm);
 
-	kfree(overlay);
+	kfree(display->overlay);
+	display->overlay = NULL;
 }
-- 
2.52.0

