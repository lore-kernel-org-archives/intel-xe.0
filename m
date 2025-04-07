Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3A9C369A1
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 08:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6941310E3A4;
	Mon,  7 Apr 2025 08:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6jL1i8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2A10E3A4;
 Mon,  7 Apr 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744013811; x=1775549811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YPCWdrVdx6EUSn7LwfUhBgnttXwfM2CqK6azaJv1Pa0=;
 b=C6jL1i8WRbAaaH/WmLVbS7ryBjyfHNCbOvP3hTE6k57zR6FnBuZNtxUf
 O4E4wBJfDFMGIgt6nk4lJoCIPUbu8YGOysV1O+6B12LIH+/fIYWmqex6R
 MfQWKRaUsltblKdJ7am7Ljsn/JbgJim0bzUhqlEY0vzAI6YC4bARtMid5
 +m7MILuURb/7dvyv9EiAbg+nS5Yucb91krdyM9iOEPMXUEzfFmknkbq62
 JGuuZrWTxJIm364bd45LO9U6zXRcmChisSjDmkWtF9qxYZSjT5ZyacWx1
 N0mK6jmx9YLd8NbEsXEgjX+30BriDpd7LG+AoddvjXE12OHZYLZEcyeQA Q==;
X-CSE-ConnectionGUID: 5oCrEJ2yR3i0NrHUiVvTXQ==
X-CSE-MsgGUID: bu/uSxtvS/WfXYz5F44aJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56755751"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56755751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 01:16:50 -0700
X-CSE-ConnectionGUID: Ljtpx8hNTmSXg4CfXlzZBw==
X-CSE-MsgGUID: Bfg8ycM5TUuROwbj8XKoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127727905"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 01:16:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 mika.kahola@intel.com, ville.syrjala@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/18] drm/i915/dpll: Rename intel_dpll
Date: Mon,  7 Apr 2025 13:46:37 +0530
Message-Id: <20250407081654.2013680-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407081654.2013680-1-suraj.kandpal@intel.com>
References: <20250407081654.2013680-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

Rename intel_dpll to intel_dpll_global so that intel_shared_dpll
can be renamed to intel_dpll in an effort to move away from the shared
naming convention.
Also intel_dpll according to it's comment tracks global dpll rather
than individual hence making more sense this gets changed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 3673275f9061..3da1e4738c5a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -123,7 +123,7 @@ struct intel_audio {
  * intel_{prepare,enable,disable}_shared_dpll.  Must be global rather than per
  * dpll, because on some platforms plls share registers.
  */
-struct intel_dpll {
+struct intel_dpll_global {
 	struct mutex lock;
 
 	int num_shared_dpll;
@@ -565,7 +565,7 @@ struct intel_display {
 	/* Grouping using named structs. Keep sorted. */
 	struct drm_dp_tunnel_mgr *dp_tunnel_mgr;
 	struct intel_audio audio;
-	struct intel_dpll dpll;
+	struct intel_dpll_global dpll;
 	struct intel_fbc *fbc[I915_MAX_FBCS];
 	struct intel_frontbuffer_tracking fb_tracking;
 	struct intel_hotplug hotplug;
-- 
2.34.1

