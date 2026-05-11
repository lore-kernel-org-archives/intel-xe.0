Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED99CD4842
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8AB10E71A;
	Mon, 11 May 2026 12:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU0HeEAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6410E71A;
 Mon, 11 May 2026 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502516; x=1810038516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1kTGIOC8KQwnWi3XYrjwiVYlJ4G6zrxxTuJ/l98N28g=;
 b=eU0HeEALNtslrpUL+riddBz8kQ0GDuCDv9oKlm+KVbCz1qLwkvXmmw7G
 OOATOGS/gVrOHV7Sfnk4oV+oZNytUh176nO8ibgt3R327QuPZkN0UksOK
 kqUBmuSnRWuHfHUdiondq/F9HY+LRmNFeAueSYJGD770D0/MDkpPX+6u9
 7deX3pMthHzfoFDU7HN+JVoC7Gg1m/ga2HRJ1gNHF2wjdmKuhjEJWaCIG
 FA4zGDu9rKMzGN/9lx0PwzOEAmFCNg5Y3tFzShU2WvzWSCn0+D+mE3vuH
 YTrkLSvisOM5w6QBFAQ45fqOKXzYZ8sfTRKzqQJ2nFnDEoT07k2T6a6Yv A==;
X-CSE-ConnectionGUID: sN4ULAb8RyyLB/gf7D4jRQ==
X-CSE-MsgGUID: RumWmyPFT96SZbOhG53ieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762742"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:36 -0700
X-CSE-ConnectionGUID: fg1CzGLhQ72l/BLng+QIxw==
X-CSE-MsgGUID: bR7bNbyjSAKhF4dteJV+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801414"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:34 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 01/11] drm/i915/wm: clear the plane ddb_y entries on plane
 disable
Date: Mon, 11 May 2026 15:28:06 +0300
Message-ID: <20260511122816.1235478-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

The UV/Y plane DDB entriess are never cleared on
sk_wm_plane_disable_noatomic() and can leave stale DDB state
for NV12 planes on pre-Gen11 devices

Fixes: d34b59d5ba41 ("drm/i915: Add skl_wm_plane_disable_noatomic()")
Assisted-by: Copilot:claude-sonnet-4.6
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 4bffa27ce02c..c942ccfe6897 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3858,7 +3858,7 @@ void skl_wm_plane_disable_noatomic(struct intel_crtc *crtc,
 		return;
 
 	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[plane->id], 0, 0);
-	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[plane->id], 0, 0);
+	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb_y[plane->id], 0, 0);
 
 	crtc_state->wm.skl.plane_min_ddb[plane->id] = 0;
 	crtc_state->wm.skl.plane_interim_ddb[plane->id] = 0;
-- 
2.43.0

