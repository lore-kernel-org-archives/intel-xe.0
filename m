Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90175CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 14:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396B610EBDF;
	Fri,  5 Sep 2025 14:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxJIa+cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80ED10EBDE;
 Fri,  5 Sep 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757084361; x=1788620361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPmU1mruuFBdGUr86Gf33Df2Q9cEWKdWqBmWs/t1hWc=;
 b=DxJIa+cuqHltqNr/BGLHDX4Yf6gNj/fkgztC2m85lMapg5U6VreTLpcg
 lQ5hriXWI5NoKWCMuVtEYNWLkvUb56kngUsk9RL7XEfY7/D/RdSI00A/J
 gW5mM2qi797LqM5sRr+I9YKp46XwGrmYy46hxhoJb3dwJnDhG5qX10Vvc
 IIetgdNzUryfNjEpmY8xnog00ud+axWHF+ABR7AMSYdR87hR24P+hBTro
 ySEUqaVHbPeFIFk24BO0t2lQgnZtKlbNgLGF+lrKt+rgMbzFH3PvRr7Bp
 IUG4bsJ6TJTyXV41pL9dlhnfCU1p5a7NHVsyGcXcd9M8npIO5MSxJ+p+8 Q==;
X-CSE-ConnectionGUID: PoaOE2IaSCuODCnJeksXuQ==
X-CSE-MsgGUID: rMTX8zRnQy646SrD26H/Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70054408"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70054408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:59:21 -0700
X-CSE-ConnectionGUID: CRLuDrjvS3W7QFr7V+UYSQ==
X-CSE-MsgGUID: TKWxWnRLSwGOci6Jye1veg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172987820"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:59:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/13] drm/i915: Print both the original and adjusted wm
 latencies
Date: Fri,  5 Sep 2025 17:58:31 +0300
Message-ID: <20250905145832.12097-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250905145832.12097-1-ville.syrjala@linux.intel.com>
References: <20250905145832.12097-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

In order to help with debugging print both the original wm
latencies read from the mailbox/etc., and the final fixed/adjusted
values.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index d334cc661328..a40113aa3f3e 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3346,9 +3346,11 @@ static void skl_setup_wm_latency(struct intel_display *display)
 	else
 		skl_read_wm_latency(display);
 
+	intel_print_wm_latency(display, "original", display->wm.skl_latency);
+
 	adjust_wm_latency(display);
 
-	intel_print_wm_latency(display, "Gen9 Plane", display->wm.skl_latency);
+	intel_print_wm_latency(display, "adjusted", display->wm.skl_latency);
 }
 
 static struct intel_global_state *intel_dbuf_duplicate_state(struct intel_global_obj *obj)
-- 
2.49.1

