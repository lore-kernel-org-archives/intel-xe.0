Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F213C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5EA10E22B;
	Wed,  4 Jun 2025 23:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2y8Il5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4417410E22B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 23:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749080740; x=1780616740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OlXd8LOGvReC8ZPtjiiVCtbhfxw6yY21LIyuTEd2lN0=;
 b=U2y8Il5ZTFuqVPxTE6J5DJPo6Z8IdpQwMejKkZ2Mvg7TEcaFtvn4oOXL
 rFW40awUW75t4E3BPaJGExz/mhhMFL5FjcegNhJB4mVAnaNTi0C6YJ00r
 MjOS2ue9Mk5wSxsqISvmQWgbV2SvlSCK0usEoFIMkLMT7XouyciSCfexB
 NloWL3ADSJXkFP1PesOzVLI7uWn4Mc852GDKnUcrn5mHrbCIkEUM7pmTt
 ehJvJRsWtX+o4PqlcAIxskt390z5dLrvMVdG69KA52Fepx2gJ9U5Z83AG
 gjLiDePtj9x9MIuAz7QV+NrMz7yp9d4I4iMjWfkwncN6/H1fcF1pejAPu w==;
X-CSE-ConnectionGUID: n3bjTzD6QFeQ1/u6fmWxNQ==
X-CSE-MsgGUID: NRm0kXDuRwqb/f0lJfUTcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61804267"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="61804267"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:45:40 -0700
X-CSE-ConnectionGUID: vddR9WmbQFmp/PpRocqGmw==
X-CSE-MsgGUID: owjpC1mMSamC5tWVXkFbPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="150125167"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:45:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Use WRITE_ONCE for range->tile_invalidated update
Date: Wed,  4 Jun 2025 16:47:12 -0700
Message-Id: <20250604234712.2441130-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Updating range->tile_invalidated should be done with WRITE_ONCE to pair
with READ_ONCE in opportunistic checks.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 83c63fd7b481..7df0bcea65fc 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -141,7 +141,9 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	for_each_tile(tile, xe, id)
 		if (xe_pt_zap_ptes_range(tile, vm, range)) {
 			tile_mask |= BIT(id);
-			range->tile_invalidated |= BIT(id);
+			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
+			WRITE_ONCE(range->tile_invalidated,
+				   range->tile_invalidated | BIT(id));
 		}
 
 	return tile_mask;
@@ -644,7 +646,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 {
 	/*
 	 * Advisory only check whether the range currently has a valid mapping,
-	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
+	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
+	 * xe_svm_range_notifier_event_begin
 	 */
 	return ((READ_ONCE(range->tile_present) &
 		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
-- 
2.34.1

