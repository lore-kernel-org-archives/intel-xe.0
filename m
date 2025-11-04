Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19583CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC97F10E668;
	Tue,  4 Nov 2025 19:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRtioagY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129BB10E666
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286183; x=1793822183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXsbb0MSGbNc0T1a5B+RlXuII/X1q3DXmEIvZyq/q+c=;
 b=nRtioagY+/q0giAhi59Cg59ygb4eHz9pGmhufPPvU7XoGakbt9i0KKr6
 29DGoZWajYufsUqEUTFYnl5GjUdrV67a3sXTTh/1Eet9smv0BlpiG9rsw
 pI8neVTKteRnBjvf1HZ4Byf02y0bYyU2Xf7H3cQ4MHeTyDC92qePiP3iC
 /IIrLAlSrXmft0TN7SDNbZa7KS4ADNO3C7qqYcEsJmzgX0WhpvoEHG1zB
 V7b6I9vZXXi6SDHZrXVTRSbMxD4qSvs0WUBF/yvbeM3KeKiBbCc9yjupA
 uzSy6TeTaAQb+6m/T/juJ2HyiN6ks4x99ZMNllww5fedzP8IzthFnszc7 g==;
X-CSE-ConnectionGUID: Y8+wbhTXTCWjtps4GD5SGw==
X-CSE-MsgGUID: hfPE2JaNRVu6Ab1fYNo8fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686117"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:23 -0800
X-CSE-ConnectionGUID: rs1vJap1Tg6W4Wkfs2I66g==
X-CSE-MsgGUID: HBNWvumORj2oi5fq3SXLFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051160"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 12/12] drm/xe: Enable context TLB invalidations for CI
Date: Tue,  4 Nov 2025 11:56:16 -0800
Message-Id: <20251104195616.3339137-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
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

Do not review, CI only.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9a11066c7d4a..7d643233a6fa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -95,6 +95,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
+	.has_ctx_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.hw_engine_mask = \
-- 
2.34.1

