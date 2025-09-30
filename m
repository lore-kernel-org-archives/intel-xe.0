Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE99CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B7710E642;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyM3VYX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2410E2EA
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9u3UYx2uxzHk+xECi5pa25DjSnzIZmCYfOj+qYAb3bg=;
 b=eyM3VYX5Epq5LkNFPWABCbyCcz7sK6CNe2SfjYbg4GjiYcNVmLPdTq5o
 QAGju1XE5vbbi4+RK74XXPpi0DroPZmvY/fOZA9ggoCZIQPkdgM8Jk0OE
 ffTBFlhtNE8R5VRwwEE44s/Im4h+sQx+NpAyoZ4Z8Id4ySiN8WShs4qUR
 kKnNK2dBtG8dtjV4XM/L7LdirsV1UzzuvNWBZK48M8nx51YMXxtJ2r6rS
 YMXhRERU+M0zx/QSj+yx95m4WZ9W152Kk0Lq3Vn/UgRidvYLC9sIEke1b
 u09tTuyd9TFwVsMh/zdDr8wVOYaUkfPLnODCY4g1pf3W/7OkZTT3w4vN3 A==;
X-CSE-ConnectionGUID: t5pb+X9SQL+/Ca5z1zm99Q==
X-CSE-MsgGUID: fzqP8KylSOSOpSDJEc+/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397749"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: tcY4WTmtRfKYzLYKvJfdmw==
X-CSE-MsgGUID: nQ8fZRidQEGjoppVLd5LBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229462"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 10/23] drm/xe/query: Report hwconfig size as 0 if primary
 GT is disabled
Date: Tue, 30 Sep 2025 15:56:27 -0700
Message-ID: <20250930225618.140071-35-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

The hwconfig table is part of the primary GT's GuC firmware.  If the
primary GT is disabled, the hwconfig is unavailable and should be
reported to userspace as having size 0.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2e9ff33ed2fe..1c0915e2cc16 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -436,7 +436,7 @@ static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
+	size_t size = gt ? xe_guc_hwconfig_size(&gt->uc.guc) : 0;
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
 
-- 
2.51.0

