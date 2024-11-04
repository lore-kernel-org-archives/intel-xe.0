Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68476D132D0
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311AC10E44B;
	Mon,  4 Nov 2024 14:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzkdeO3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4110E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730729314; x=1762265314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Q3BC9Drk0h00ujGdvjv9Re1KdmP8UoTA7jfnAQLPfk=;
 b=ZzkdeO3ein0a12RENru3NZ6gkrpLOMS5DrJ6lCuIRZFtdrxG/aBC4L6b
 LBKhdS5LEVIXCDLT86vLQgPt5gBjSmxZWtJ5eeoavH8R6LhrhGFbJP3NH
 UdoJSwg87dGqFifXtgffTD8UzkryqkYwVXMhSS38ExwHrf76o/R2b4zmE
 j8mwXiYGhGbe64um/1Hp5N8PvvCsyQwqjbWFeEPB3f+3gDHlfR/jjtQyU
 dg4OPPj3+UsIcp0YQuwLPAJHSvuwlMVU8YoROR4bOny1rJ5KCdR6HafPz
 nQSPOaOV1Tm7N/FKws1chyCh2ECUgPpE6TcKoEn7DSnmvbq1L68lBt4iU A==;
X-CSE-ConnectionGUID: fgE80CyrSOO3nYLzUeq8EQ==
X-CSE-MsgGUID: vz9s3oUhTR+FTZ++tHQXYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29858507"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="29858507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:08:33 -0800
X-CSE-ConnectionGUID: nD7pf3xkQyaZhgEXdrXEuA==
X-CSE-MsgGUID: nshoIGe3RUyPq75AIz4VWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88429620"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:08:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Use lowercase for asserts
Date: Mon,  4 Nov 2024 06:08:13 -0800
Message-ID: <20241104140813.1992885-1-lucas.demarchi@intel.com>
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
the mixed caps and gives the impression it was a typo. Just use
lowercase to improve it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h              | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 2 +-
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 04d6b95c6d878..831cb62107496 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -14,7 +14,7 @@
 #include "xe_step.h"
 
 /**
- * DOC: Xe ASSERTs
+ * DOC: Xe asserts
  *
  * While Xe driver aims to be simpler than legacy i915 driver it is still
  * complex enough that some changes introduced while adding new functionality
@@ -103,7 +103,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe asserts`_ for general usage guidelines.
  */
 #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
 #define xe_assert_msg(xe, condition, msg, arg...) ({						\
@@ -138,7 +138,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe asserts`_ for general usage guidelines.
  */
 #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
 #define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
@@ -162,7 +162,7 @@
  * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
  * or as a condition.
  *
- * See `Xe ASSERTs`_ for general usage guidelines.
+ * See `Xe asserts`_ for general usage guidelines.
  */
 #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
 #define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
index 0bf12d89ceb25..3410b1236c2e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
@@ -18,7 +18,7 @@
  * is within a range of supported VF numbers (up to maximum number of VFs that
  * driver can support, including VF0 that represents the PF itself).
  *
- * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ * Note: Effective only on debug builds. See `Xe asserts`_ for more information.
  */
 #define xe_gt_sriov_pf_assert_vfid(gt, vfid)	xe_sriov_pf_assert_vfid(gt_to_xe(gt), (vfid))
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 7d156ba824791..b6e2710771459 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -20,7 +20,7 @@
  * is within a range of supported VF numbers (up to maximum number of VFs that
  * driver can support, including VF0 that represents the PF itself).
  *
- * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ * Note: Effective only on debug builds. See `Xe asserts`_ for more information.
  */
 #define xe_sriov_pf_assert_vfid(xe, vfid) \
 	xe_assert((xe), (vfid) <= xe_sriov_pf_get_totalvfs(xe))
-- 
2.47.0

