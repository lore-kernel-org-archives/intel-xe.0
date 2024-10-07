Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8BCCFB443
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2210E30A;
	Mon,  7 Oct 2024 06:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIk4oTLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5410E30A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283353; x=1759819353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4Gfr81amz1ZiCPNfhd3s8Ppp4dlMmYeWPPM2SQ4g1g=;
 b=JIk4oTLBdiimJJWcd6S8Ii8Jl0VJhPDk2qu2CYxPuazIRv7ks4LmyPVv
 tTD5B3AYS6XPeYFV5dsYmNblnjXQ0bYE1AMEIILMc1tp0aeSFdoQjP4g1
 ivB1o2vZTIR1iahpakXM44OSYzMFREahwbxtfAqdjCryDqZPibDmgG4IP
 F4pi6xR/wzYgb90zgmvetFssCm8U1a6E3nq3AvLGbOjmMschHu3qg7+nL
 T6J2kskPvAhvZls7rpwVmTSmQ6NsQnpRnhGMW7EAFl8S4nmwzjlecbTze
 KR87bqG3YH0oz7ExW7T2zLHyvGzkY3XQr7rANefUDrWrnTv+Imjf085Cz A==;
X-CSE-ConnectionGUID: /sjLLYi1Sn2pnqdsJDCmcA==
X-CSE-MsgGUID: UYxszyFlTNGT0lRnZ2RP2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548472"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:33 -0700
X-CSE-ConnectionGUID: sPHJttNmTNaR4MqxJdbF1A==
X-CSE-MsgGUID: kZlXmo2JROmrldzC14tBrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842593"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 22/26] drm/xe/query: Update handling of xe_force_wake_get
 return
Date: Mon,  7 Oct 2024 12:30:13 +0530
Message-Id: <20241007070017.1732886-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

