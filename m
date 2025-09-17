Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D77CAC5AB
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7180510E71F;
	Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GC1uczWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5704210E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B/v8kGC3dWkKmH4rX0Y1/2KhF4kZ2EyPXc+TPjCM0T8=;
 b=GC1uczWiJ9fcCqPItgHkmYrn/4twQl1jRZZbum8xW1xrNc5QNeWC3mCu
 o8lTFn3dieF8yCv9NiJQmZhAjSQ9GAqjVyyAVLkpO6fn5s+P+qyIfn1l0
 Sl7Eu7FUqVt6V79uOPSwdhsM+18khdy5wuFzT6APWFylOIikn9spAxxyT
 nQZkqUgAWxF47Jo99kqY9Tv+1dx4MmDMO9Ebnd9dWpmz9Y1/2Cd4+6yVK
 osk/4GMO15wHZ79rq+M6bnJWGY85E/ZKIy/2AGDyO2tf5FadPIvnt9K6X
 LDtGAszDvv9BuyKTzPMgzUB/jHnRPrKeFOCfuO50YNOCslWOipAg+b1c6 g==;
X-CSE-ConnectionGUID: WZYgXWz/S+WoZM7mFwPM5Q==
X-CSE-MsgGUID: 4nVtyctXR12nvqtoHX1lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060800"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: dCHCzxZwSECDPL/ufMvQuw==
X-CSE-MsgGUID: Y9uvuOuwS3GNeYcZWqFl2g==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 18/28] drm/xe/vf: Extra debug on GGTT shift
Date: Tue, 16 Sep 2025 20:46:05 -0700
Message-Id: <20250917034615.3977603-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

A little extra debug on GGTT shift printing the GGT shift value is
helpful for VF post-migration recovery.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 877f6e1c3a3a..d9e5654b289a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 		primary_config->ggtt_base = start;
 	err = config->ggtt_size ? 0 : -ENODATA;
 
-	if (!err && shift && recovery)
+	if (!err && shift && recovery) {
+		xe_gt_sriov_info(gt, "Shifting GGTT %lld -> 0x%016llx\n",
+				 shift, config->ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+	}
 out:
 	up_write(config->lock);
 	return err;
-- 
2.34.1

