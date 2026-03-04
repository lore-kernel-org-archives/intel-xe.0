Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2827EB7ECD
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 11:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE3410E17A;
	Wed,  4 Mar 2026 11:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCHR++YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6F710E17A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772623512; x=1804159512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Lq1Td9Pg3SoGW5D4UlytZZPZZk1PE9oOel+vwJkh1w=;
 b=CCHR++YQPHg9qx/Vq3f3jIzu4pyBOfMmgvPwc9OEiaEqKYi/2KbDw4rf
 DrX/Tex9GETcKI1Q48mvxW+sIjfrrgaiQEsiGXp5QeJzWDD/RJFYoaJgT
 6HsYZB4hIQUpJXzYuC1RqJnkQCyEqK0Q5/CViIs3CuRQFgROloFksG6W7
 NK9hUHQYn2NGB4DvFIooZg4g9Dw8wQLTe8g3tnrnSgrVMJfMmbWcadPYd
 Zay8hjfJ9UhrZY67gkOWhEWEPZSes0mrV+dFHIBfXJjYpH3ffiWD2UQYp
 HNCe0X3fflnNA79jxywZXsjgvAvJXLDEDghw1pR33l+o1b+aQuIn2d+AA g==;
X-CSE-ConnectionGUID: eesaa1GgSSCKDEmf5BsYTg==
X-CSE-MsgGUID: PCh41E3jSoqEGSwB+54wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91254789"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="91254789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:25:11 -0800
X-CSE-ConnectionGUID: fNdu52oCTYOrqQLzRLfhqA==
X-CSE-MsgGUID: yzzVhcljRMOvSd2Y8ExsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218426623"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:25:09 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
Date: Wed,  4 Mar 2026 13:25:01 +0200
Message-ID: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
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

snapshot->ctb is u32*, so pointer arithmetic on it scales
the byte offset from xe_bo_size() by 4, overshooting the
intended start of the g2h portion and writing past the
allocated buffer.

Fix this by using *u8 to get the arithmetic right and also
prevent future mishaps.

Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer objects")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 46ad1402347d..1b4b9b713d42 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
 	/** @ctb_size: size of the snapshot of the CTB */
 	size_t ctb_size;
 	/** @ctb: snapshot of the entire CTB */
-	u32 *ctb;
+	u8 *ctb;
 };
 
 /**
-- 
2.43.0

