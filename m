Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABCCD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EA010E8F5;
	Mon, 11 May 2026 21:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0aUHqvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDC110E8F4;
 Mon, 11 May 2026 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778535728; x=1810071728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0TMPOXwK081fLbC0tAcUlpyCXqh5NH4+3dmzkLoN17Q=;
 b=S0aUHqviNr4sy+IeIpy0xKzK/8AXm1qSr8PXmAhCRkkrp/YRgZCOnC+L
 fTudxqgm2mEogmVJO2hLAb84M7N2MDKhxlzww7TgCqewUdO1ksgoFgeHJ
 QXcSqNq/EnI1qQo+lqHRTxs0VbeUWigRJt15jklceBRs12Tipb5ys/q/j
 4EVkja7U1nH7jfkNxhVs393279QoV4bwXepV9sU3Oe/GUm2d6nwuPGubP
 gsCj1cHijgIR0nzS66dCAMaPDnvRHzaBT7CmdQgYoHxoM7LXSW0nJ05G8
 ZeV3rzOzjTmOqP3RUSbwBh4TrWwT/O4GnmWdpKdA07VLKUo8TyN+/DbYK g==;
X-CSE-ConnectionGUID: tCYspLUNQX6y8rYGOmCANw==
X-CSE-MsgGUID: E1wdDLTfSkKIiekZk/YvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90816887"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90816887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:08 -0700
X-CSE-ConnectionGUID: R+tCfIYNQGuf8LT/91Udbw==
X-CSE-MsgGUID: ev52ijFlRnOHTrIL5m/+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275702931"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/14] drm/xe: Check the PTE local memory bit for initial FB
 in stolen
Date: Tue, 12 May 2026 00:41:18 +0300
Message-ID: <20260511214122.8468-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
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

Do the PTE local memory bit check also for the case when
the initial FB lives in stolen. We have two cases to worry about
here: MTL+ with LMEMBAR, and pre-MTL with stolen being just
(slightly special) physical memory.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0dabc5709d01..d0a9f8599096 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -26,9 +26,14 @@ static bool is_pte_local(u64 pte)
 	return pte & XE_GGTT_PTE_DM;
 }
 
+static bool has_lmembar(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1270;
+}
+
 static bool need_pte_local(struct xe_device *xe)
 {
-	return IS_DGFX(xe);
+	return IS_DGFX(xe) || has_lmembar(xe);
 }
 
 static struct xe_bo *
@@ -79,6 +84,7 @@ initial_plane_bo(struct xe_device *xe,
 			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen;
+		u64 pte;
 
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
@@ -86,6 +92,13 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
+		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
+
+		if (is_pte_local(pte) != need_pte_local(xe)) {
+			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
+			return NULL;
+		}
+
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 	}
-- 
2.52.0

