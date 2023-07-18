Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4218CEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 19:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ABD10E3B8;
	Tue, 18 Jul 2023 19:39:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081A10E3B8
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689709196; x=1721245196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BwUL08MvKkTl4pB3EjGk1PXl/tQhD/wHhNkVGfSc9DA=;
 b=UqzEvH9lBAGhFL3JLoda+ofBfPzcj+59fgc/cVN7WBRZIbGNSjp39Zkg
 zSxcPbrROVnpTDDlwTvG/UhNyr7v+9uE07a7uaAq3e3wKKmBBTOcWrOOv
 brWQ5CbH/Y+1xjvdQuiFkI78iaBdkJitTtl+KHhV8Xeuy8opcYkHuQRl7
 BgQG323+PC+PbTGotdx+voQvIr2telOuzRt9QqsTn4/3DujRZ4IzUgE16
 cp1M7yWT7jc12hSmnUamAE0xKJW3D0znqzeSkOO4AIcXxFs6cJGdNp/rh
 swbV/F8r/onKC206j8CzJffRxgCj948lxOTipyf3Tjv+fvsXPGN63v6s+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368941493"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="368941493"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717726729"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="717726729"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:39:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 12:39:24 -0700
Message-Id: <20230718193924.3084759-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230718193924.3084759-1-lucas.demarchi@intel.com>
References: <20230718193924.3084759-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Use FIELD_PREP/FIELD_GET for tile id
 encoding
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use FIELD_PREP()/FIELD_GET() to encode the tile id into flags. Besides
protecting for eventual overflow it also makes it easier to see a new
flag can't be added as BIT(7).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 223b8f84c546..379c5d617d72 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -150,8 +150,8 @@ struct xe_vm {
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
 #define XE_VM_FLAG_FAULT_MODE		BIT(5)
 #define XE_VM_FLAG_BANNED		BIT(6)
-#define XE_VM_FLAG_TILE_ID(flags)	(((flags) >> 7) & 0x3)
-#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
+#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
-- 
2.40.1

