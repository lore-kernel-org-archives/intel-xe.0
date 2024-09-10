Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD5EE01F2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151710E8F5;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCq6Gt6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5914910E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qKwxJrswa/z8fg8j1lzUwwAkK/gEMpkGKIZXZHifRY=;
 b=DCq6Gt6OrryDOhKn/pJK046tGmW4wFENINetAAw2C3CwE6JX1/3egv2J
 VF8xCdhAaB64gh5rEvFmm/xu+8CppTonKUSAiRI085hY6p3uoR8sm5vJc
 zNXa6Sd5dbw3BvMGDtvv3C+aB92FbZ2eTxT9SVVD6nhTwPXl4cOGxa0yF
 8vLlGWdzvRQ5+jhYWDYn0gB2wjX71Z7/n3o6UiEl9/rSl1yE01kYBfZzs
 Vstm0fl1B9vXhnbOux5o1tGKyk//k7zX2QTzyD+1VNbFRI8UbV0i81bEH
 GTfOUmvQkMqSnqwSZk99LYWE1I8l9pom6xdFSoDFPnojURqWbpm+CRMhz Q==;
X-CSE-ConnectionGUID: TQJBbyZ2QmmnCnjGweuhPA==
X-CSE-MsgGUID: vSDZoO7wRj6Jt5XyZr3eWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144306"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: cYgTnkOeR3m8qSpV6OWklQ==
X-CSE-MsgGUID: VVRyNNnrSgWV7Pj6F5KIHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989585"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 15/43] drm/xe/lmtt: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:35 -0700
Message-ID: <20240910234719.3335472-60-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 8999ac511555..a60ceae4c6dd 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -193,7 +193,7 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
 	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
 
-	xe_mmio_write32(tile->primary_gt,
+	xe_mmio_write32(&tile->mmio,
 			GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
 			LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
 }
-- 
2.45.2

