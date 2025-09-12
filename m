Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D1DCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 17:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96A10E1AF;
	Fri, 12 Sep 2025 17:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5gc5oMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E010E1AF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757698237; x=1789234237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7NIttRZ/1v5O2/dBjacq1CKwR7Sb8huM5TrAq6c294I=;
 b=k5gc5oMqdoKxMkNSExmdSvQ3h+p1/IdMZ3qR7IHmsuwu9vMrpNntRrCa
 4bSudRk+rXNdkoIhnezzcSSzUqI+Rbq1NtTQ6cINMUZQj3n/dojUnoFRq
 kZgh0IMteE1MKobkU0n1ElHdLfvIpDOwn+ThafHuLdEtWN4YT5s/+REj9
 AAt/B6yH1fEPckOn/IqZ5HI3mmjKRZqpfGxcjnD4nXbKHNSidDBlpdeXz
 i2MvWiNVIxXTE8kRckjP4tB94EYHyyyMzIgndxfCL274eBkjDVjufltpa
 mrhUJ9wOhnxv4KmoU+Odx+0ftuEmYLg8GovfznjLPX7UkE7OPPZuoxyiB Q==;
X-CSE-ConnectionGUID: DvxmFTErT9OrF/KSWINURg==
X-CSE-MsgGUID: 5k6QDcPHT7G5JwJ1vVcXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60121281"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60121281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 10:30:37 -0700
X-CSE-ConnectionGUID: 2PRGk5HVS8OC3jE1P5KHPw==
X-CSE-MsgGUID: hm0bAuTQTmOVt/87cscEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173838172"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2025 10:30:35 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/pcode: Allow min_gt_freq equal to max_gt_freq
Date: Fri, 12 Sep 2025 17:28:14 +0000
Message-ID: <20250912172813.1631529-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Allow min_gt_freq == max_gt_freq.
Update the comment to match the code logic.
Add a blank line to satisfy checkpatch.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f9..ac09b4c8c5cd 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -214,6 +214,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 	mutex_unlock(&tile->pcode.lock);
 	return status ? status : ret;
 }
+
 /**
  * xe_pcode_init_min_freq_table - Initialize PCODE's QOS frequency table
  * @tile: tile instance
@@ -227,8 +228,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
  * 1-1 Ring vs GT frequency. Even though, without setting it, PCODE might
  * not take the right decisions for some memory frequencies and affect latency.
  *
- * It returns 0 on success, and -ERROR number on failure, -EINVAL if max
- * frequency is higher then the minimal, and other errors directly translated
+ * It returns 0 on success, and -ERROR number on failure, -EINVAL if minimal
+ * frequency is higher than the maximal, and other errors directly translated
  * from the PCODE Error returns:
  * - -ENXIO: "Illegal Command"
  * - -ETIMEDOUT: "Timed out"
@@ -248,7 +249,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 	if (!tile_to_xe(tile)->info.has_llc)
 		return 0;
 
-	if (max_gt_freq <= min_gt_freq)
+	if (max_gt_freq < min_gt_freq)
 		return -EINVAL;
 
 	mutex_lock(&tile->pcode.lock);
-- 
2.49.0

