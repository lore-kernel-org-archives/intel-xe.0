Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E1C4167D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB8310E722;
	Wed,  1 Nov 2023 15:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F2810E722
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698851697; x=1730387697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ByLJR8eWLX1id/wh1REXgdd092DplorHQcm80A74uow=;
 b=Mmjy96J9miOVKVjZ/vm+oPNiN+5sTh8RJBWCYsk88EDMh4Y+g7MVABTd
 oo8PCsfN7C/jvDSKMskxQE6eiJcP4QCpA6+MQ3E/aOulLqG0YG12XC/22
 pmrN+PLiIg4oKbMrzgWYJ+rc7g6blnU/Iq+3AaXrpS7Ey9kuBe0OsNd3D
 70QJLrEC1TCOmMFjQttTT1RZxmJWT8m7PEuo2c40qAgsnTfpDYpm2oC9w
 VBBhQCJpJcmFOP/2366zvH16VI7EJD3pQJ5NFZx4m7bqIsj4c874W7e2+
 RfrjovT/UgLHPhtu2hVRIkpg4NMksj3h6qsWc4TBrBJpWxpWz9y6upnmV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378896873"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="378896873"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="831371931"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="831371931"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 08:15:27 -0700
Message-Id: <20231101151528.1840900-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231101151528.1840900-1-lucas.demarchi@intel.com>
References: <20231101151528.1840900-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/i915/lnl: Fix check for TC phy
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With MTL adding PICA between the port and the real phy, the path
add for DG2 stopped being followed and newer platforms are simply using
the older path for TC phys. LNL is no different than MTL in this aspect,
so just add it to the mess. In future the phy and port designation and
deciding if it's TC should better be cleaned up.

To make it just a bit better, also change intel_phy_is_snps() to show
this is DG2-only.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231026184045.1015655-3-lucas.demarchi@intel.com
(cherry picked from commit 28066f38d94f846e66f4116a8b1c409b47072011)
---
 drivers/gpu/drm/i915/display/intel_display.c | 28 ++++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 478b8764101a..9874025cb77e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1784,31 +1784,31 @@ bool intel_phy_is_combo(struct drm_i915_private *dev_priv, enum phy phy)
 
 bool intel_phy_is_tc(struct drm_i915_private *dev_priv, enum phy phy)
 {
+	/*
+	 * DG2's "TC1", although TC-capable output, doesn't share the same flow
+	 * as other platforms on the display engine side and rather rely on the
+	 * SNPS PHY, that is programmed separately
+	 */
 	if (IS_DG2(dev_priv))
-		/* DG2's "TC1" output uses a SNPS PHY */
 		return false;
-	else if (IS_ALDERLAKE_P(dev_priv) || DISPLAY_VER_FULL(dev_priv) == IP_VER(14, 0))
+
+	if (DISPLAY_VER(dev_priv) >= 13)
 		return phy >= PHY_F && phy <= PHY_I;
 	else if (IS_TIGERLAKE(dev_priv))
 		return phy >= PHY_D && phy <= PHY_I;
 	else if (IS_ICELAKE(dev_priv))
 		return phy >= PHY_C && phy <= PHY_F;
-	else
-		return false;
+
+	return false;
 }
 
 bool intel_phy_is_snps(struct drm_i915_private *dev_priv, enum phy phy)
 {
-	if (phy == PHY_NONE)
-		return false;
-	else if (IS_DG2(dev_priv))
-		/*
-		 * All four "combo" ports and the TC1 port (PHY E) use
-		 * Synopsis PHYs.
-		 */
-		return phy <= PHY_E;
-
-	return false;
+	/*
+	 * For DG2, and for DG2 only, all four "combo" ports and the TC1 port
+	 * (PHY E) use Synopsis PHYs. See intel_phy_is_tc().
+	 */
+	return IS_DG2(dev_priv) && phy > PHY_NONE && phy <= PHY_E;
 }
 
 enum phy intel_port_to_phy(struct drm_i915_private *i915, enum port port)
-- 
2.40.1

