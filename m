Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7DDCED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E684F10E475;
	Tue,  8 Oct 2024 06:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKxOofHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDABD10E475
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370411; x=1759906411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4Gfr81amz1ZiCPNfhd3s8Ppp4dlMmYeWPPM2SQ4g1g=;
 b=gKxOofHVGviy9XKKuhvEM1pUl+Yuz40hBYSjN4OaU6vmhguwqhQM/fS/
 HV6kLFbaL6WCDwmwzjcdB7E9u1YkeGPLObVyZh8UdQA0dPKP8tRWiNoy3
 xrfq5+4SbAcckjypCYPf+YDqESzMAPDAxlvHSMppPwVToI5iN1av2qGky
 P/NW/YJVcpYShTT7BsLxwdYfP2nuvMuCCRhRVgDmmlg48Mo+dMn7HRc88
 qm0TrVcUZSOwaIF7k6p2QmBDrzdCv8hIbJSfu1t/HBp5mFDG8k8I53Bp0
 g6eLLC7AXNNm6EeTSxsEEM9qjwWzOQjeCKIh7sJHLOFX6RyLFRrk8Ro71 g==;
X-CSE-ConnectionGUID: QPfd2rkCSoCdy8smS4W92w==
X-CSE-MsgGUID: fWiFXLM4TbKC2Thwd2QvMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430479"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:31 -0700
X-CSE-ConnectionGUID: q0qPJJ0MTp+mxe6+id2ZIg==
X-CSE-MsgGUID: ZoH52/a2Q1Kiwot30rw/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577777"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 22/26] drm/xe/query: Update handling of xe_force_wake_get
 return
Date: Tue,  8 Oct 2024 12:41:11 +0530
Message-Id: <20241008071115.1862704-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

