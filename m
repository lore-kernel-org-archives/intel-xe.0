Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5207CF64A2
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6410E0DB;
	Mon, 30 Sep 2024 05:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svdr37oP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D615B10E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673247; x=1759209247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4Gfr81amz1ZiCPNfhd3s8Ppp4dlMmYeWPPM2SQ4g1g=;
 b=Svdr37oPukD3+AQFkvXCInS2scAcR1GXENIHUvgMaxO7+QDZ8n1cWo+P
 RdTGgbe97l5CNNPBEnp7d/JzxpiB8+x/DxLvB7KaCJTBs+NWeeDD4phS3
 O9mbP3i8vTySsz0iVRiVAN9AnCiYEDmgA3oyAMViJvfO6+F0BXHa2NjbL
 7yX0S8pF2Z5TDEhBwrEuUwVB37WaO+l0SqTt7KbX19/p/07oyn2nDvRh7
 vBI5+/jwtkiAaUzde0huHZ+1+343b1uz/OFNfaG9GVrpaSFl/en0PIGZO
 +/kwj6sGGYa3NL8VbtWXQLgfwqtaAIhPjJKVO9j9JbPj1QJrdsrlelG7N A==;
X-CSE-ConnectionGUID: ibqhLn9SR0+UH4SfqVrN5w==
X-CSE-MsgGUID: k/4oolq+QSe/IfASPurG+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367996"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:14:07 -0700
X-CSE-ConnectionGUID: GSOkB3QiRzak6x0EX63qLg==
X-CSE-MsgGUID: dMuymT2fSsu8d1v0ZJcnbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752265"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:14:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 21/25] drm/xe/query: Update handling of xe_force_wake_get
 return
Date: Mon, 30 Sep 2024 11:01:45 +0530
Message-Id: <20240930053149.1246339-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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
does not necessarily indicate success. Use xe_force_wake_ref_has_domain()
to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

v6
- Use helper Use xe_force_wake_ref_has_domain()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..6e950c13944d 100644
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
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
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

