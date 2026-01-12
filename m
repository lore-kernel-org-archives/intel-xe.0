Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9ACF45D2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 22:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392D10E034;
	Mon, 12 Jan 2026 22:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POrgsjY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED2210E176
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768255219; x=1799791219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g0Xz126IJs2Vr2+WCT576/x0xuluHFh6SaB/3NjdlvA=;
 b=POrgsjY58lBL2tmsCnI8kaOX3cx4fAMNizbf0MiNN8lv5fTwcfadYH2O
 VVx6E4ZdnrkifN55Y0WFvNNYPVVcw79PI97HmqH5cCPlB/rG37aplvHQ1
 lM8mZWWdqNdGR/rjHkAuocWwHwABqZyzxLB8mpAjzTvUwGFKBWbk4mHFT
 4Y6Fm9RMRPvNQEJ2aArHkU5Ulvs9ICLjeElAY08WwXpm2TY5dcCa+/Z9u
 2IorA4xuSWP36RClfJU9zy9juxYzXKYbgPiDAHScyDZQxeq7C75ry/MsU
 OcIXbhqwFikB4N+8q7yZL694TfXrBgRV4Hwfgf+vVg+w6y6SH+V205zHV w==;
X-CSE-ConnectionGUID: Zn4WaSpLQb6nP2FOR0HnhQ==
X-CSE-MsgGUID: a0wx1BRGTb+mMr7ULlPE1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79833166"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="79833166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 14:00:19 -0800
X-CSE-ConnectionGUID: +cpEpNxiS02w66rMjfuTsQ==
X-CSE-MsgGUID: SzHjbwGiQL6BbMmE0PdoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203366555"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 14:00:18 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.brost@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe: vram addr range is expanded to bit[17:8]
Date: Mon, 12 Jan 2026 14:03:30 -0800
Message-ID: <20260112220330.2267122-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112220330.2267122-1-fei.yang@intel.com>
References: <20260112220330.2267122-1-fei.yang@intel.com>
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

The bit field used to be [14:8] with [17:15] marked as SPARE and
defaulted to 0. So, simply expand the read to bit[17:8] assuming
the platforms using only bit[14:8] have zeros in the expanded bits.

BSpec: 54991

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index c64d98bf1723..4f807eade2b7 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -155,7 +155,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		*tile_offset = 0;
 	} else {
 		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
-		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+		*tile_size = (u64)REG_FIELD_GET(GENMASK(17, 8), reg) * SZ_1G;
 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
 	}
 
-- 
2.43.0

