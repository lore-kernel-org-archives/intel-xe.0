Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E7FCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A1910E0B9;
	Tue, 24 Sep 2024 11:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKlXx0Xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996D910E89E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179146; x=1758715146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79QS5VOr5nrd2VpwHNCwjiYDaDpzWwqPnGh6IlLDrWQ=;
 b=WKlXx0XwCTT55fO4v9DdkdsFzPj7ZZaGBUZK3nlBK9zOW80FMa2CNcD7
 UfjJKVYOBafyREfHZ4rma+A0+8thBsUEJapvVdqzh/vqTg+BxlLWzv9Ew
 NKQqUW77loINW2CK4+l8+jLteP0/85P4j10FR0XHOrJDHI3/BgVAz1IYG
 /Xr9KmJJiTXsctL/uWjKmRm8B4MQ2cugHYTz+euFx+t86KVccT9ROjXFV
 2PPytuTzyqtJhaXUfnY21KhszIYb22aCVLw6NuiUnTJ4/IicD+Rdo2rlP
 jLKXQe3mxCv8fGYswNzxHSEiQoHoURdgool1uxnjwOSQc64sRy6kU2kOh Q==;
X-CSE-ConnectionGUID: X0PqVkeCRzW8ks6hxIaC1A==
X-CSE-MsgGUID: ZEMpbiCGS7Gy2KiXyEl+3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957049"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:59:06 -0700
X-CSE-ConnectionGUID: SA54zK0mTWuGDzW9ytyoSg==
X-CSE-MsgGUID: Me9ERl3lT5Wx65mjvKbDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319304"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:59:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 19/23] drm/xe/query: Update handling of xe_force_wake_get
 return
Date: Tue, 24 Sep 2024 17:46:37 +0530
Message-Id: <20240924121641.1045763-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented
domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL
does not necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..143910a67783 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -118,6 +118,7 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
+	unsigned int fw_ref;
 
 	if (query->size == 0) {
 		query->size = size;
@@ -150,8 +151,11 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL)  {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -EIO;
+	}
 
 	__read_timestamps(gt,
 			  RING_TIMESTAMP(hwe->mmio_base),
@@ -161,7 +165,7 @@ query_engine_cycles(struct xe_device *xe,
 			  &resp.cpu_delta,
 			  cpu_clock);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
-- 
2.34.1

