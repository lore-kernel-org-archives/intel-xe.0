Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CF7CA5FF5
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8A510E70C;
	Mon,  5 Oct 2026 05:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvC5NBQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9875210E70C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 05:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791178128; x=1822714128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpaOycWoHI/caTiUFAVXCIAChwKflxBC2AoZNI+qqqo=;
 b=LvC5NBQ52/P7DYZvpVE7mP0z23exftaphbd+vpv2TXzQB+U19QyOF6kN
 uJFTXzOAQMWcW0gnQALWULcaqsNMMP+/hjSIC6JkhIHIP4xmCOtFkS06d
 /AmFZzoeGgdNEwZ4a5wCjed4nNzuxtKtGftkQjTWWGwYob6jN9iCb15Ql
 v0S27gEMaHJKiAnTFmHoyj0k6q2TfdDFHlYqhQA27CeTIYxrta0top+dz
 oD8O0aDdUoS1GNkQox5jfY0Ktj3S14gychd54TTRZ8pT2yE9X249DHvk5
 XEi67tNlUOp011Qx6/+I7TULsBvRtJO1AcOR77flZzzag64Iju1zWXiEx g==;
X-CSE-ConnectionGUID: HiwpyRLgTui9Y0pmiLGpdQ==
X-CSE-MsgGUID: z5y0IetwRTyKdW4gGwa5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94330089"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94330089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 22:28:48 -0700
X-CSE-ConnectionGUID: nrKivHbxSMCBzoRqaBp+dA==
X-CSE-MsgGUID: ztCgI7AyT0i2tWcal6vhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="274526337"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by orviesa006.jf.intel.com with ESMTP; 04 Oct 2026 22:28:48 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe/oa: Zero OA buffer at allocation
Date: Mon,  5 Oct 2026 11:10:11 +0530
Message-ID: <20261005054011.2542699-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005054011.2542699-1-krishnaiah.bommu@intel.com>
References: <20261005054011.2542699-1-krishnaiah.bommu@intel.com>
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

Zero the OA buffer immediately after allocation because kernel BO pages
are not guaranteed to be initialized. This prevents stale data exposure
through mmap and fixes the xe_oa tail-address-wrap test.

Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
Assisted-by: GitHub Copilot
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a3484e943c55..3bb8bbef4c37 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	/*
+	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
+	 * hold stale data from previously freed pages. Since the OA buffer is
+	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
+	 */
+	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
+
 	stream->oa_buffer.bo = bo;
 
 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
-- 
2.43.0

