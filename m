Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE13C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 09:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5642610E3D6;
	Mon, 30 Jun 2025 09:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkM5jVkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7694710E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751274774; x=1782810774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dBqAUwwMO408ZPgCkqjY8TuwV1K44sXP5gORyh2wpwQ=;
 b=GkM5jVkfUULV7Jzqr6sKIjf6vi+jqfmHFzmwVPdimanIXHp0csBDqj1Q
 aQeesDU5FMO7SpKKyEVZ6bQtVkhtu/KaBCeJBXuhgiUvi7QeNFrEBrcfM
 w7jnlWD9JJ8Wtt+mqv577Nz6Nn6nGYdQhP+6xdQgC4kUe8e30anGPDxzx
 x5oveWET5K/vdYYloLF0qOmMBqWEI45FqpBHOx3IamWbf7M0VpTOmDqdm
 birmaw6xc4RjC0VUlO3A9AZJaMYi4OF5mMld33Quy0ztnqx0ejcwDt/Uw
 8/p5cXRtMfJ+w6KPx0AabkGQ2qCmnjNbIWOa8b4VsM1GcDHbxqraWmINB w==;
X-CSE-ConnectionGUID: B+WrLn9ARx6UZ3pW6Hlnbw==
X-CSE-MsgGUID: gq89RpCvQReTjfiBTRqgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="70927915"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="70927915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 02:12:54 -0700
X-CSE-ConnectionGUID: b4MXx61FRGeTfrThzrh/sw==
X-CSE-MsgGUID: lsX6IkGxQNuqWdqmR1/khg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153591507"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 02:12:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, sk.anirban@intel.com,
 soham.purkait@intel.com
Subject: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
Date: Mon, 30 Jun 2025 15:07:41 +0530
Message-ID: <20250630093741.2435281-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Validate gt instead of checking gt_id is lesser
than max gts per tile

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 69df0e3520a5..cab51d826345 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -157,10 +157,13 @@ static bool event_gt_forcewake(struct perf_event *event)
 	return true;
 }
 
-static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
+static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
 			    unsigned int id)
 {
-	if (gt >= XE_MAX_GT_PER_TILE)
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+
+	if (!gt)
 		return false;
 
 	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
-- 
2.47.1

