Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDEFEED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FAB10E682;
	Fri, 15 Sep 2023 17:47:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CC510E678;
 Fri, 15 Sep 2023 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800013; x=1726336013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AssikX67Dy4A+aoEXSq9fSPghpAPBhmX4ysYH4Tib8A=;
 b=mfO+Vn6oV0XymF+khz51bGP0L7Vo/2N/hDECVYhdZ/s05x0IiQJ+2ccC
 jRg9zC+GedCZhxLY2GWfL4p3mix6RjMvdGwKV7D9lCv1eMKcasthMqvj+
 zNUzr+gngkl96q/m8jgdiaaly1WzdFuUEE7OfeHHkt5zRjP1HkvuPiO9i
 mo7Yvf3DQ0EIChtFNHmKXtsaFesUZ4n4pqV6Kcy0CdFqdw7tVa3xJX9Mz
 oA9DKdoXo1PjkA5DrTos2xv08k7+pgdea6ttk5F9QQlsQBe9xqln3FPUC
 pDEKO2lSI2vcY4JVTuj4feo7HWwW27caV4/gH4NDQeAwae0mWP2pd+sry w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445779295"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445779295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868818323"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868818323"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:46:51 -0700
Message-Id: <20230915174651.1928176-31-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915174651.1928176-1-lucas.demarchi@intel.com>
References: <20230915174651.1928176-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 30/30] drm/i915/xe2lpd: Update mbus on post
 plane updates
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

According to BSpec we need to write the MBUS CTL and DBUF CTL both for
increasing CDCLK case (pre plane) and for decreasing CDCLK case (post
plane). Make sure those updates are in place for Xe2-LPD.

Since the mbus update is not only on pre-enable anymore, also rename the
function accordingly.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 1fefb02876c8..955a8fb7ba19 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3486,7 +3486,7 @@ static int get_mbus_mdclk_cdclk_ratio(struct drm_i915_private *i915,
  * Configure MBUS_CTL and all DBUF_CTL_S of each slice to join_mbus state before
  * update the request state of all DBUS slices.
  */
-static void update_mbus_pre_enable(struct intel_atomic_state *state)
+static void update_mbus(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	u32 mbus_ctl, dbuf_min_tracker_val;
@@ -3545,7 +3545,7 @@ void intel_dbuf_pre_plane_update(struct intel_atomic_state *state)
 
 	WARN_ON(!new_dbuf_state->base.changed);
 
-	update_mbus_pre_enable(state);
+	update_mbus(state);
 	gen9_dbuf_slices_update(i915,
 				old_dbuf_state->enabled_slices |
 				new_dbuf_state->enabled_slices);
@@ -3567,6 +3567,9 @@ void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
 
 	WARN_ON(!new_dbuf_state->base.changed);
 
+	if (DISPLAY_VER(i915) >= 20)
+		update_mbus(state);
+
 	gen9_dbuf_slices_update(i915,
 				new_dbuf_state->enabled_slices);
 }
-- 
2.40.1

