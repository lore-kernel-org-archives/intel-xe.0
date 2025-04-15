Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02109C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D97410E733;
	Tue, 15 Apr 2025 11:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlf+lwXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DA910E745
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744715738; x=1776251738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Dg4uWtt/xQvHaOXJ4/iXwiZTA+euOfftZRn4vegoDU=;
 b=Xlf+lwXktkcYVXjA6whbXCKzutZMdQhN83YsVUezh58WjyAzZ8x8hIJL
 81J3reWCjSGMLt8VM9rfPGcVAUgw0P7TK6BTbx9FqyPerd6F3QZQEpVs1
 KH88JWn3cOqcrB3A89jAoFeVQEMAYRDH/tLGDVa298p218KoYki3pG69L
 QPDpgToPTD8azpD/Lh7WjHLD2k3E+waWrkp0TipXy1uxZ2UZt5a+gJbOm
 SNV0bzNx9XCc06Pm3y0Y3d3pkh1B8U0h4ztF7W/jgN88psapg104MPCut
 2ygng6qHqHBtrXUIUxLHQxKLRDAdNq9g8Q7UhY7k01OxfDtSvE9etv/V0 A==;
X-CSE-ConnectionGUID: mr78WMXvQ6yi74uOx/uvxw==
X-CSE-MsgGUID: atZkvDtZRJ6oNHwR9rhxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46383316"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46383316"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:15:37 -0700
X-CSE-ConnectionGUID: cLfxwZaMTmiuztgA78iMvg==
X-CSE-MsgGUID: lXPBq5ASSLy1a9oe2JPunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153288239"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:15:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
Date: Tue, 15 Apr 2025 13:15:23 +0200
Message-ID: <20250415111523.149214-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

This limit can be hit, for example when running IGT compute-square on MTL:

    [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <= 48` failed!
                   platform: METEORLAKE subplatform: 1
                   graphics: Xe_LPG 12.71 step B0
                   media: Xe_LPM+ 13.00 step C0
                   tile: 0 VRAM 0 B
                   GT: 0 type 1
    [   63.582408] WARNING: CPU: 0 PID: 2439 at drivers/gpu/drm/xe/xe_ring_ops.c:395 __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]

Increase the value to allow this test to pass.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 1ae56e2ee7b4..121279c826eb 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 48
+#define MAX_JOB_SIZE_DW 64
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.43.0

