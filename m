Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBA3D277D0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 05:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5AA10E07D;
	Sat, 10 Jan 2026 05:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR1pwn4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C711010E17E
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 05:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768023217; x=1799559217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qW96Jwaz7hmSnkrrzOYwL4mkf2eqL/4okCGlyNS8LhI=;
 b=mR1pwn4HbbOane4TTe9PxWyTIj45DXgGF/TyH0jfP35zMUPe47RnyQ6D
 lbFzoERe8M6UK9HYY3uErkTf3UawzAevDX+X8b/Qf/wZViiAThhp+YrN4
 f0y7vbWOTor3NRPEpQtPen2l7O7VhiZvD9RdMoiCGHLhgATN7ZNtkK0xu
 TBTN430tcx/c2TLs5BJxG9yUsVw48SkKfBQFluGosGV31Y4z9zv7ssgQN
 Qpo7s53lXmbu8VXchdiJSqn7nt1Trz4jYTKeta1IJxkDN1Foufv/1Xakf
 IK/RWZw8GOJjxv8OkAQZ+pwDLbgfMEvaAS9s8YFDqy8UOCjZJKxOteeMx A==;
X-CSE-ConnectionGUID: PSEJUznCTV6M8IMRxqTNmQ==
X-CSE-MsgGUID: VPBlo9AkRqaXZ2evbx4joA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69308308"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69308308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 21:33:36 -0800
X-CSE-ConnectionGUID: cuSDXlemRs26/S0uMJaLyQ==
X-CSE-MsgGUID: 3CfN6g2XQfGZRmFZzsymGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203650851"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 21:33:36 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Date: Fri,  9 Jan 2026 21:36:50 -0800
Message-ID: <20260110053650.2241351-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110053650.2241351-1-fei.yang@intel.com>
References: <20260110053650.2241351-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

There was a BSpec update to incorporate larger vram size.
BSpec: 54991

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index c64d98bf1723..2159d9c33bb1 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -155,7 +155,10 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		*tile_offset = 0;
 	} else {
 		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
-		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+		if (xe->info.platform == XE_CRESCENTISLAND)
+			*tile_size = (u64)REG_FIELD_GET(GENMASK(17, 8), reg) * SZ_1G;
+		else
+			*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
 	}
 
-- 
2.43.0

