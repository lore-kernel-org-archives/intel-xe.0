Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29BBCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 16:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017710E93D;
	Thu, 23 Oct 2025 16:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnojrB11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706CA10E939
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761238658; x=1792774658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7lHGflP57Q/4MvLtdPBb5Qizv/GzRjwq7iuJtqXwAQ=;
 b=LnojrB11Ch7XfusibKRMSIjU7zvbjGomNjtiiI5OOm7MjIujutc2fw8s
 HpPPG6jKlhJJ7qEulCSvAtZaoRUe1HLaVTrLFIB2ZjW95fwS2J4R95kXt
 ib4pGlbaJtdN8BiSkynpcekGZjCUT5BxDlPKZe+MXj9cMz/9jRcI0/Szp
 6BE/q7LrEF4XcOq/3UKOyFIP+9cdWwa18l5reMUS7ZQNgSWDy+LQJhb8w
 93mghOJUUaVlI1KmY8PuVG0rPp+By/LWpVTK4r+H4C+HUbpdAlGUiAcLM
 tcS0O/Ekho3Oxt7SYc2cYpW3phM91StfqLVE0xGcvy7e29aOsMeOamOAD g==;
X-CSE-ConnectionGUID: LrPyPBGRSsqzm39GJfOGvw==
X-CSE-MsgGUID: pUZPo8CgQF2n/8HDdiiKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74085668"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74085668"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
X-CSE-ConnectionGUID: KZAlYplvQtWB5oYHrVFwsg==
X-CSE-MsgGUID: X9yYb+JoT8a9y8WtJWtfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184277023"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 09:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH 3/5] drm/xe/gt_throttle: Always read and mask
Date: Thu, 23 Oct 2025 09:56:56 -0700
Message-ID: <20251023-gt-throttle-cri-v1-3-9f36f3c8861c@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Use a single function to read and mask the value the callers will be
interested in. This reduces the risk of a caller using a plain call to
xe_gt_throttle_get_limit_reasons() without applying any mask, which can
return unexpected bits for future platforms.

Select which reg and mask it's going to be used according to the
platform and gt type and always use that one function.

There was an odd xe_gt_dbg() when reading the status, which is not done
for any other throttle/* sysfs file, so just make the status be as
special as everybody else.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index c69710f2dbeb5..21da290709fa8 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -57,32 +57,25 @@ dev_to_gt(struct device *dev)
 
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
-	u32 reg;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_reg reg;
+	u32 val, mask;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
 	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
+		reg = MTL_MEDIA_PERF_LIMIT_REASONS;
 	else
-		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return reg;
-}
-
-static u32 read_status(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 status, mask;
+		reg = GT0_PERF_LIMIT_REASONS;
 
 	if (xe->info.platform == XE_CRESCENTISLAND)
 		mask = CRI_PERF_LIMIT_REASONS_MASK;
 	else
 		mask = GT0_PERF_LIMIT_REASONS_MASK;
 
-	status = xe_gt_throttle_get_limit_reasons(gt) & mask;
-	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);
+	xe_pm_runtime_get(xe);
+	val = xe_mmio_read32(&gt->mmio, reg) & mask;
+	xe_pm_runtime_put(xe);
 
-	return status;
+	return val;
 }
 
 static bool is_throttled_by(struct xe_gt *gt, u32 mask)
@@ -96,7 +89,7 @@ static ssize_t status_show(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 
-	return sysfs_emit(buff, "%u\n", !!read_status(gt));
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
 static struct kobj_attribute attr_status = __ATTR_RO(status);
 

-- 
2.51.0

