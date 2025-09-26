Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF519CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C18890B2;
	Fri, 26 Sep 2025 15:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMdLhjga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD99B8951B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902390; x=1790438390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mau0cQ9ATkYUBj8/lfP2XftaTeQUm68MlxMVSCgeLpk=;
 b=AMdLhjgaXz5GsXzGqWkI82rkO27oNCX/tvf8VKeDmLgJJsjpMOH4GL9S
 ExPHYvWcBUAjtvwclXD2F5efC8UqzW/7+z8L4MUP+5DBFd3D6ZKzQ2BUJ
 NkayVpzM3b/hl8ed49EFzPxQ8VLttI8HpHRTaoQ8xccktQxDJVblky0tC
 B5PtJpD0/p5uBLdIB14UFq7xyvgRkwY/aYKc3kbDTglSd7p7EbnqyasQ5
 QU/q2DWBdOkfsTnV72Do79T0HP+4hwsePUNVb7sfjEl6eeXl6XO1p6fTj
 ruImpC/DsQU3jBFpdRJrDqkcJcAk0BYxvHd4vjihMN2QI2cqzeA9adFF7 A==;
X-CSE-ConnectionGUID: /n3o1ZxrTUKAd/jowzHDhQ==
X-CSE-MsgGUID: FNuMTYZTSD+R8PTWYEkz9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63872187"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63872187"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:49 -0700
X-CSE-ConnectionGUID: mdwXrf5aT6u7n2gvGithGA==
X-CSE-MsgGUID: RYiZtThdT7etM6815sRUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182914419"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Date: Fri, 26 Sep 2025 15:59:51 +0000
Message-ID: <20250926155948.145934-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926155948.145934-7-jonathan.cavitt@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Add guards against this in xe_pmu.c:
- Use xe_root_mmio_gt instead of xe_device_get_gt for the tile 0 case.
- Check the return value of xe_device_get_gt when this is not possible.
- Return early from xe_pmu_event_destroy if GT is NULL.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..531022d80731 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event *event)
 
 	gt = xe_device_get_gt(xe, config_to_gt_id(config));
 
+	if (!gt)
+		return false;
+
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
 		return false;
@@ -219,6 +222,10 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 	if (fw_ref) {
 		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
+
+		if (!gt)
+			return;
+
 		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
 		kfree(fw_ref);
 		event->pmu_private = NULL;
@@ -497,7 +504,7 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 static void set_supported_events(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
 	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
-- 
2.43.0

