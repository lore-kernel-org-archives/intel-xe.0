Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7B6EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE54810E6B7;
	Fri, 11 Aug 2023 16:08:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C610E6B1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IwIMBk5AccuGdnAcLLBMJB2HbsIDGsuCSsPZXSjXySE=;
 b=Ddd1tUvOP+Dky2Nyk/R5hwb5osDJV9g163O3+pU4DuTfcZ7vkoJ0zrQ6
 +JcXQIWnkhBwrwBqZsoqYvgk8Ls9XmZf4VXYxRz7l4cc6ekOemoo2dDfm
 e0jjtUY9bZE7TtC+MNM8Ttmjg0BSnfa7YORxf+xoh9vXZizL640+5cMf1
 HgMkC7Ed/ZqHuf+jCO18O2Dm6SxTNoDUwN7gO5CxAnd7/k0qTtKZEgN+m
 FYA1u6ItratOeszlsHHWlXyCLoABuKiU0f9Wlx3zwZ45ngO2ds0D1y4+V
 jtLncpYbR76lCZSkgSL7Bb8hz5drPEnQNjKF45Lp3XmiFsGuZA0zaG6Mp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044329"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044329"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300461"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300461"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:10 -0700
Message-Id: <20230811160618.477297-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/15] drm/xe/xe2: AuxCCS is no longer used
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Starting with Xe2, all platforms (including igpu platforms) use FlatCCS
compression rather than AuxCCS.  Similar to PVC, any future platforms
that don't support FlatCCS should not attempt to fall back to AuxCCS
programming.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 4a474ab04f96a..8c50ab4fdc6a0 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -242,9 +242,11 @@ static bool has_aux_ccs(struct xe_device *xe)
 {
 	/*
 	 * PVC is a special case that has no compression of either type
-	 * (FlatCCS or AuxCCS).
+	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
+	 * onward, so any future platforms with no FlatCCS will not have
+	 * AuxCCS either.
 	 */
-	if (xe->info.platform == XE_PVC)
+	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
 		return false;
 
 	return !xe->info.has_flat_ccs;
-- 
2.40.1

