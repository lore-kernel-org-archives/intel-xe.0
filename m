Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A5C54757
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772D110E4EC;
	Wed, 28 Aug 2024 09:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E88pVEnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F610E4EC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724837000; x=1756373000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=egmbb26DdDlinpJTps6Ml0LqYkANFg+euLO/mgp10lA=;
 b=E88pVEnjHjTHU0rW0yAcXYb16ea3Ky6g97esRFDscK0zI1Y9dLpsRiNW
 TG8/ENXZ+t8UhDXy2NXne130RzlJRX44JP0oHSdDCyk8GKgLkCiTIiSud
 EinvBHFBJWqlG5KKx+qD6IoikSLLBZoWRMskKSoygA3kDYMcu47/+dhyo
 rJXhA8YcbAzp97FgSycaydTQCo7s5LioIczkxEkvLJ+9NnYwanwv+xv55
 szyEWu2udeiSzUPmtojc+dxlWdKjSfAjp5i2f4wCo5/swlu78SDzw3BOu
 CGsab0bcWgSQHz+ffYXyGVXZ9YwIcpkliM9an+Hq34QSBytoX7oYbPJUW g==;
X-CSE-ConnectionGUID: 4z/pkwekSVyDO5AeS2AF0w==
X-CSE-MsgGUID: YKZuUVmlT2WNsHHPvJ5y5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23528804"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23528804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:23:20 -0700
X-CSE-ConnectionGUID: PLw6eBwpTMu7RXqIHZjhGg==
X-CSE-MsgGUID: wPoxfXRgQeO1FwyrgWbpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63871557"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:23:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/pat: sanity check compression and coh_mode
Date: Wed, 28 Aug 2024 10:22:58 +0100
Message-ID: <20240828092257.169063-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is an implicit assumption in the driver that compression and
coh_1way+ are mutually exclusive. If this is ever not true then userptr
and imported dma-buf from external device will have uncleared ccs state.
Add a build bug for this so we don't forget.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 722278cc23fc..f92a1c61956d 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -100,6 +100,10 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
  * Reserved entries should be programmed with the maximum caching, minimum
  * coherency (which matches an all-0's encoding), so we can just omit them
  * in the table.
+ *
+ * Note: There is an implicit assumption in the driver that compression and
+ * coh_1way+ are mutually exclusive. If this is ever not true then userptr
+ * and imported dma-buf from external device will have uncleared ccs state.
  */
 #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
 	{ \
@@ -109,7 +113,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
-		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
+		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
+			XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
 	}
 
 static const struct xe_pat_table_entry xe2_pat_table[] = {
-- 
2.46.0

