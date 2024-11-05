Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90DD1CA3B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C1810E3E6;
	Tue,  5 Nov 2024 07:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKAhBz8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5101E10E3E6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730790962; x=1762326962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dmcjqAIehSx5CUpF4LVTTROEQbXl0dCmMnYK5dR9Mf0=;
 b=eKAhBz8A2whT7QqBqX5Ergp636jqNIYn/joGOIyu+LDrSOKPi7da5rIr
 2FMwuYtKZsIGI0ta0wVX8YHpLF1gZORRYFb42tb1/obI2QPshDep2hx/C
 JKoiHlS6WO5A1ut1FdpV28Ita+ZsICsLJVadZZXy0M0Cqggha1EiZ1cPJ
 BlVpADb4WaxNuf/cfC3iVTwBhaFv6sWz+4AX2zk9Nc0iUJF5byNy5UNr0
 CXySRHTHU11HbniW20ZKLcziXQwvOAc8j9lRPSe4YKBWzO8U+Hq1a6MV/
 ngEph7NjCjvxD+50vE01P/QpaFehfRb9o+gvrtaHIED4IIxxS6RWidaGC w==;
X-CSE-ConnectionGUID: DEYkEWoJQMSWtmGQ2SsEuA==
X-CSE-MsgGUID: ha0doHjPSkiWhBuZ1ECAQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30367635"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30367635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 23:16:02 -0800
X-CSE-ConnectionGUID: OFInLSRMSh2L8/sRQWGr4A==
X-CSE-MsgGUID: CrYsTyFtRtCkAyOoE3b8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="88414237"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 23:16:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Fix case for asserts in documentation
Date: Mon,  4 Nov 2024 23:15:39 -0800
Message-ID: <20241105071539.2623727-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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

The rendered html documentation for "Xe ASSERTs" doesn't look nice with
the mixed caps and gives the impression it was a typo. Use Title Case
Style.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241104140813.1992885-1-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h              | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 2 +-
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 04d6b95c6d878..68fe70ce2be3b 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -14,7 +14,7 @@
 #include "xe_step.h"
 
 /**
- * DOC: Xe ASSERTs
+ * DOC: Xe Asserts
  *
  * While Xe driver aims to be simpler than legacy i915 driver it is still
  * complex enough that some changes introduced while adding new functionality
@@ -103,7 +103,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe Asserts`_ for general usage guidelines.
  */
 #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
 #define xe_assert_msg(xe, condition, msg, arg...) ({						\
@@ -138,7 +138,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe Asserts`_ for general usage guidelines.
  */
 #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
 #define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
@@ -162,7 +162,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe Asserts`_ for general usage guidelines.
  */
 #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
 #define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
index 0bf12d89ceb25..6af219d93c3b5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
@@ -18,7 +18,7 @@
  * is within a range of supported VF numbers (up to maximum number of VFs that
  * driver can support, including VF0 that represents the PF itself).
  *
- * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ * Note: Effective only on debug builds. See `Xe Asserts`_ for more information.
  */
 #define xe_gt_sriov_pf_assert_vfid(gt, vfid)	xe_sriov_pf_assert_vfid(gt_to_xe(gt), (vfid))
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 7d156ba824791..dd1df950b021a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -20,7 +20,7 @@
  * is within a range of supported VF numbers (up to maximum number of VFs that
  * driver can support, including VF0 that represents the PF itself).
  *
- * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ * Note: Effective only on debug builds. See `Xe Asserts`_ for more information.
  */
 #define xe_sriov_pf_assert_vfid(xe, vfid) \
 	xe_assert((xe), (vfid) <= xe_sriov_pf_get_totalvfs(xe))
-- 
2.47.0

