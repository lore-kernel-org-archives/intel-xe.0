Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE5ECAC595
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A8710E4E9;
	Tue, 17 Sep 2024 17:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mA1l5/be";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE14210E4E7
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595819; x=1758131819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LRUrguDhP7ff//9lhfdBriFhdywwLzoS4k83jsjJ7w=;
 b=mA1l5/be0y7EwIBPqMc/HzBqdfFbu4mLywujIZwoXUjlOT/1YNYmLfz9
 oz4YAlHp/yFwcMXSmnqU9SD27xjwGpCtbTHmbL2TGmYn1bhQ+aaCNPgOi
 /mQL4pxnkHW/TdvoJI4yAqnlZhRQ8a92yeiV4SsRJDefu14hSWX15JsBa
 RtDEzDZfLHUbkgrwAGqj6Z98SPQXQWIIiTlCLp32wgqD6img7Flqku/wv
 iQBXbzMkjJGsyrGstaOYITFC3p/lmnrGLv2z2lyjeUKMrxzv/d86nZ3O+
 WJChZB9LEy8PYLR2O/6DTeMvTA8LwQgHdLwF+UEYJWK82KiZhK3V96Ee/ g==;
X-CSE-ConnectionGUID: 8LCO3RMhQGiDyhxQ8hMd0Q==
X-CSE-MsgGUID: AbljvjFVSyOkoIMkzMlcTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562026"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:59 -0700
X-CSE-ConnectionGUID: qbc/OngeRhqqMCrI+tYwrQ==
X-CSE-MsgGUID: 2aOpRepnTNCeZm6d+9H3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926539"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 19/23] drm/xe/query: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 23:44:21 +0530
Message-Id: <20240917181425.515871-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..0d8717cdeb6f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -118,6 +118,7 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
+	xe_wakeref_t fw_ref;
 
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

