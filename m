Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B57CC48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 20:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E8410E281;
	Tue, 20 Feb 2024 20:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4qNgBCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E050D10E281
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708462560; x=1739998560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=na42XdT+EoHDLj0mNED2bPkorFU9HhRryobFpssSRiE=;
 b=Y4qNgBCstOohdfzniaWGYxXUUVo7taXgT7x7bN2ZaraMcR1EB+PEP/rG
 GOtXl03husAxNIjVkUw1Rs1T3FG0Z/oJ73G8L8UpkFQXj4mCcrPZUt0Ee
 kiC27hJL8BF7hZmwV5N6QTL1BxmDAolGgAx+eUz3D7vwjDNhOFGSBmd6Z
 GRZvLGn24PnOCXQiZqlyieaUvygwaMkMdM75JEbuxwOorieZP1sOeaawM
 JEzJ6C2p02MZH+YRHteA7idRPzukm4ljnhsRkigzJTvzhvhA3HePpI3Hx
 Z9SoGW7HeuzKN6ModM/KpQemk7u0V7MrMPp/z335dnzH1Q+xhsmI1XMz0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14007771"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="14007771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 12:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="35939023"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 12:55:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Fix cast on trace variable again
Date: Tue, 20 Feb 2024 12:56:07 -0800
Message-ID: <20240220205607.1873084-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Same fix as commit 8d038f49c1f3 ("drm/xe: Fix cast on trace variable")
that has been inadvertently reverted by a later commit.

Fixes: a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 0cce98a6b14b..e43c3bde3202 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -32,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-- 
2.43.0

