Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ED3CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE382113193;
	Mon,  1 Jun 2026 10:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1H8SH4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC81130C9;
 Mon,  1 Jun 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310131; x=1811846131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DdzuOlTLU+6rKDWQjhVzJnK0AzqBt2U8yOGfPpqklSc=;
 b=b1H8SH4NzJnOX8PBJp5iedRAjHWYSq8Wau8j7uSS+PCnyH7lC8ES1OVO
 qFCKvK5gpzYzhdLlQBho88OdVoIj3GJvEF0YZmzC4HAorqPPXe4Bht7S0
 FYNevMbVVUUhE38GrYjY9erKjVwZlif8yh++WUFPut7qTyWF+Noqp+fPQ
 MIMfkTh2qSF55E/K8pLytFiu6qTO10JFeGgNYTsICwTTmTtYPgwnvX00J
 yRW2vU17/04hew4el56pErCHs+5XkHo4p7upm9cJhjcI1eQO5BO7COUZW
 OL0pgGdu99loz7lKkSKzAMo5sKYkKreH1kgh3Rpa8xkEvdjvGdmA8b4XL Q==;
X-CSE-ConnectionGUID: hCV+rvZnQFqvA3pCDg+WUQ==
X-CSE-MsgGUID: Urbh3y5fRDechO3jjPl8oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797257"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:30 -0700
X-CSE-ConnectionGUID: C5zgB/a5R0aHJfUobtsfFw==
X-CSE-MsgGUID: Y6qKlosqR/qOIg8pFN2C1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728527"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 4/5] drm/xe/display: remove intel_display_flush_cleanup_work()
 calls on suspend/shutdown
Date: Mon,  1 Jun 2026 13:34:59 +0300
Message-ID: <8a6059f0cb63ad9a8e035583a79134c250b0ec71.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
References: <cover.1780310011.git.jani.nikula@intel.com>
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

intel_display_driver_suspend() already has drm_atomic_helper_suspend()
and cleanup workqueue flush. The intel_display_flush_cleanup_work()
calls on suspend/shutdown should be redundant. Remove.

Link: https://lore.kernel.org/r/agRp6Was9FCQbKee@intel.com
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index c0d3e7d12823..6e82dc70ca89 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -312,8 +312,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	intel_display_flush_cleanup_work(display);
-
 	intel_encoder_block_all_hpds(display);
 
 	intel_hpd_cancel_work(display);
@@ -344,7 +342,6 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	intel_display_flush_cleanup_work(display);
 	intel_dp_mst_suspend(display);
 	intel_encoder_block_all_hpds(display);
 	intel_hpd_cancel_work(display);
-- 
2.47.3

