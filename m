Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15323C71143
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 07:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C845210E758;
	Thu, 12 Jun 2025 07:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI0VbuXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC0F10E758
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749712160; x=1781248160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Y5PpALDJM8POr7Nk5wazhMuBENZrjLofkkXAoPoLRk=;
 b=jI0VbuXhOfzvNGNAVuf3dfquqRY3hinDq0HsVe779XGDphKj+r4yPNCs
 0sJADmnHTGHwREAJYTd5gWu/VBDhIanxP4LkJUYzvDGB2+2DNxvhLK+TR
 8sDCAPR4oLY3HnYfMRtHYcMve46chiGYVjCLqyGkof8pN3zTtFqfsiU7r
 MOLCsEJjwA/XsuThbZOd0MwsbBi1+/h3IOKL/a9Od2/RCNWlbJRTSzwqa
 yjdDgMkjy0Ld0+1VKuoMGkFBQ2Lb2f+Yyhlbu+ljpWKThxKVyVH1J20ay
 mFfXumNkGnNzaYS8flLRhhrHzK3esRNi4wmNG2DEQKS08Jvhn1ckXyCtb A==;
X-CSE-ConnectionGUID: 0/oWQfHFR4GpDqFc7aHYAA==
X-CSE-MsgGUID: ExT04c0iSzWmFY6IMGl5ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51792684"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51792684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:17 -0700
X-CSE-ConnectionGUID: x0Nx6SsQSIqCDPX6McSEEg==
X-CSE-MsgGUID: to3Ti4wnTeG2yaX+mSu+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152197774"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Date: Thu, 12 Jun 2025 00:09:02 -0700
Message-ID: <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-7a402
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Set GT min frequency to 1200Mhz once driver load is complete.

v2: Review comments (Rodrigo)
v3: Apply Wa earlier so user_req_min is not clobbered.
v4: Apply to all GTs (Lucas)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index aedf59162709a..39d2acb2f30f6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -51,6 +51,7 @@
 
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
+#define BMG_MIN_FREQ		1200
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
@@ -817,6 +818,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
+	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	int ret;
 
 	lockdep_assert_held(&pc->freq_lock);
@@ -843,6 +845,9 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
+	if (XE_WA(tile->primary_gt, 14022085890))
+		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
+
 out:
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 425cb401c2762..38b589fe9198d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,3 +59,7 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1301, 3000)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+
+# SoC workaround - should apply to all platforms using this
+# graphics version in tile->primary_gt
+14022085890	GRAPHICS_VERSION(2001)

-- 
2.49.0

