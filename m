Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C376C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 11:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7010E562;
	Tue, 11 Mar 2025 11:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9Kv6ZyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C110E562
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741693276; x=1773229276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfNGNagf53CXXeRopQzNgR9TH+sIFgD7UcGV08wh0ZE=;
 b=c9Kv6ZySQl4q9wBxWu//+XZMZldwughMT4GCuU9O6utHXuw0QCQTtvzR
 rgsGGH1CDoH1OnXSGloqIKDu8fAys2vnK+ULqdUtey3ESyNmyLnqhHpTA
 V6AEQgtWVE3SVWk6nHl8aLY1DJWqinwXR0cDxKJMULT04BDPIVw5eESCd
 W7R+oB5sY2WKn0dqIEON+pVu5h1tWtwv6AGZwIKMVWfACXxqbtTrenS5G
 jZTfqGk4nraQNZiDCAgm3AXrmEPUMRfRpwUt8KWfuTvjIiXF83Tdu9s6l
 G05953W1wY7p7yxeGi/8T7VG8GgljfcVVYigi3shG2hvQNnELRVoXoKQt A==;
X-CSE-ConnectionGUID: ovFJkfakS2yVj/DQOc2gdQ==
X-CSE-MsgGUID: HLJ7y4vZRXCv7libiALRlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42637132"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42637132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:16 -0700
X-CSE-ConnectionGUID: pmEet+8RQnGDaYpwUF8hBw==
X-CSE-MsgGUID: CJo75V8jScCrsnGVbSJ1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120015681"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Don't check CTC_MODE[0] if VF
Date: Tue, 11 Mar 2025 12:40:41 +0100
Message-Id: <20250311114042.1954-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250311114042.1954-1-michal.wajdeczko@intel.com>
References: <20250311114042.1954-1-michal.wajdeczko@intel.com>
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

Starting from commit 18778b5fdd01 ("drm/xe: Eliminate usage of
TIMESTAMP_OVERRIDE") we access the CTC_MODE register only to warn
if it has undocumented value.  There is no point in doing that on
the VF driver.  While here, move this check to a helper function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 2a958c92d8ea..fca38738e610 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -40,11 +40,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	}
 }
 
-int xe_gt_clock_init(struct xe_gt *gt)
+static void check_ctc_mode(struct xe_gt *gt)
 {
-	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
-	u32 freq = 0;
-
 	/*
 	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
 	 * platforms.  In theory it could be a valid setting for pre-Xe2
@@ -57,7 +54,17 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	 */
 	if (xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC)
 		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
+}
 
+int xe_gt_clock_init(struct xe_gt *gt)
+{
+	u32 freq;
+	u32 c0;
+
+	if (!IS_SRIOV_VF(gt_to_xe(gt)))
+		check_ctc_mode(gt);
+
+	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 	freq = get_crystal_clock_freq(c0);
 
 	/*
-- 
2.47.1

