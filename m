Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBACD4846
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 17:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5910E6B7;
	Fri, 22 Sep 2023 17:43:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAE010E6B7
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695404597; x=1726940597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+cPfamoGH0EHR8gWyTCMpdm4qxbO5LpBfLA3DbqOGYs=;
 b=egAzxw31TVFt7K4e84lRq5abPFQapz3vf6KIy+uUv8M6KuE/uo3N5VEx
 U0mhOUG+gek/YL6Hu7UBMmZ8A90kqmfnWgHmx2dncVfQNRJN6sr5d48Qc
 tnYTDcXDXyFsZr9BCLq6ZiP6IepdI4S4c3dZjrJO0bL+vcqI2wP97lITJ
 BjoGHGdQWxneYU2elJl8VnImsUObyxEvhEH9dKn7PZW1LrdZ9N3yDIY/a
 b505VMuxdcLfTMmSp5t5g5UycEJuBet6ImWY27qNtD/GaufG2+AtD92N5
 KTEt4MXDx97LA9dFz28SFCV0d58jfxeyCM8nX0p4FsRjSsQ457G6pkl0K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="383647044"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="383647044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 10:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="837843795"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="837843795"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 10:43:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 10:43:20 -0700
Message-Id: <20230922174320.2372617-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Accept a const xe device
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

Depending on the context, it's preferred to have a const pointer to make
sure nothing is modified underneath. The assert macros only ever read
data from xe/tile/gt for printing, so they can be made const by default.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 4cbe1b213432..035e6a44afe6 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -86,7 +86,7 @@
 })
 #else
 #define __xe_assert_msg(xe, condition, msg, arg...) ({						\
-	typecheck(struct xe_device *, xe);							\
+	typecheck(const struct xe_device *, xe);						\
 	BUILD_BUG_ON_INVALID(condition);							\
 })
 #endif
@@ -107,7 +107,7 @@
  */
 #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
 #define xe_assert_msg(xe, condition, msg, arg...) ({						\
-	struct xe_device *__xe = (xe);								\
+	const struct xe_device *__xe = (xe);							\
 	__xe_assert_msg(__xe, condition,							\
 			"platform: %d subplatform: %d\n"					\
 			"graphics: %s %u.%02u step %s\n"					\
@@ -145,7 +145,7 @@
  */
 #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
 #define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
-	struct xe_tile *__tile = (tile);							\
+	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
 		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
@@ -169,7 +169,7 @@
  */
 #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
 #define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
-	struct xe_gt *__gt = (gt);								\
+	const struct xe_gt *__gt = (gt);							\
 	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
 			   __gt->info.id, __gt->info.type, ## arg);				\
 })
-- 
2.40.1

