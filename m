Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159D0EE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32C810E57F;
	Fri, 18 Aug 2023 22:08:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8649F10E049
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKbYcrtQp15yt3C3zh3RDkFTGJ6EflVwK7+lI2Hbbzo=;
 b=GIqJ1dFa4z34Kc0HNi4HlYI3sobf4OpJdR2jBfBtbFUJuP5payZFoLSb
 Sxo0z+1kAHcK71SJyyzTlI9z8M/KvkZ0COh7u/95hwiSK+WOi+jp0qyZN
 1HBTwPWYqP6/sIr3JdAdMqcvaTGuO5HSuKMSdi32f77EVKFelrqgASC4p
 nPr3MRS717J7udLzuQlmsSIeB+xwJl82E4079pPGQcWJ4vPQpBQhJC8e4
 MuCu4TIn1LGNgpzUaE8vPS3FhOgiBv3Go9+1kWkaLkhLwEwELpMPfdsT1
 KWev1lMSLVCdFbB7ebssJ8mtSlXNieLPlkpMCfDRzziPAUpJysuOKs+qN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592989"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758194"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758194"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:16 -0700
Message-Id: <20230818220824.700519-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/15] drm/xe/xe2: AuxCCS is no longer used
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Starting with Xe2, all platforms (including igpu platforms) use FlatCCS
compression rather than AuxCCS.  Similar to PVC, any future platforms
that don't support FlatCCS should not attempt to fall back to AuxCCS
programming.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 11a089ae79b2..b29150e03491 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -243,9 +243,11 @@ static bool has_aux_ccs(struct xe_device *xe)
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

