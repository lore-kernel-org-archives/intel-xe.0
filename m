Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD17CCAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864E10E2AF;
	Sun,  5 Oct 2025 13:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUGAsxB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A21E10E2AF
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759671414; x=1791207414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n67Rn3Qw/UEExh/Tqoh8Y3KwXCwQ8MZTVYsw6s6UAY8=;
 b=BUGAsxB74q/emiQzvew7w+PMuyK+Nw9Jl0xBdWRWxmF6wjFnVw31WhKz
 8X2nU9/bTiAb2CuPfbg+94IS9hkInnyBj4PUfKp1CoOwYjlTwbV0xbfxe
 uA3JiBUEFARUXp51flgRAF4yF03JLQFO9j6WwhRJbTmhp/MMZxa18aFWx
 c1/4pFaIpjU4+fV8BcDlM/KcBBN3ySX8dW7pz0KMrkeMAst4+hPwvbZxn
 VbTXFMVYn92QvDm64gAufvUo8nXSr3JmCvij/Nfa1W/SZpPWRJS94sRbV
 O3sCXA78vyIb9lj8jiEUzMrXZ2oUlzumHOyT9pv2ydKMb7f1UofjENbUp Q==;
X-CSE-ConnectionGUID: YI5BChE+TrqpsRcGjsTo6w==
X-CSE-MsgGUID: nuU5k6ZWTniR8iBYZzvO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61779322"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="61779322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:54 -0700
X-CSE-ConnectionGUID: 1ZUXPzUgTDqbmKGV64lHhw==
X-CSE-MsgGUID: /81lS44qT0O0jTamEkMEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="179348607"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/4] drm/xe/pf: Update LMTT to use tile-based messages
Date: Sun,  5 Oct 2025 15:36:39 +0200
Message-ID: <20251005133641.2651-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005133641.2651-1-michal.wajdeczko@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
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

Since now we have tile-based SR-IOV printk macros, there is no
need to manually prepare the LMTT specific warning message (that
is now upgraded to proper error level message) nor to use generic
debug message without tile/LMTT identification.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 62fc5a1a332d..4dc1de482eee 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -17,7 +17,7 @@
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
-#include "xe_sriov_printk.h"
+#include "xe_tile_sriov_printk.h"
 
 /**
  * DOC: Local Memory Translation Table
@@ -32,7 +32,7 @@
  */
 
 #define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
-#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
+#define lmtt_debug(lmtt, msg...)	xe_tile_sriov_dbg_verbose(lmtt_to_tile(lmtt), "LMTT: " msg)
 
 static bool xe_has_multi_level_lmtt(struct xe_device *xe)
 {
@@ -267,15 +267,14 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
  */
 void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 {
-	struct xe_device *xe = lmtt_to_xe(lmtt);
 	int err;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
+	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_sriov_warn(xe, "LMTT%u invalidation failed (%pe)",
-			      lmtt_to_tile(lmtt)->id, ERR_PTR(err));
+		xe_tile_sriov_err(lmtt_to_tile(lmtt), "LMTT invalidation failed (%pe)",
+				  ERR_PTR(err));
 }
 
 static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
-- 
2.47.1

