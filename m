Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A24CCFA04
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 01:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D7010E00B;
	Wed,  5 Nov 2025 01:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMNrzsnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073B510E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 01:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762305226; x=1793841226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YiVRAZOwDHIMyAadDmbCChnOjVvsQJcEtoCOlksYtPE=;
 b=PMNrzsnjOMmUqdTvW2np06k4D8B0BlM38onKx65lJ8ygQtgf0Z5YK3eL
 t3o00ki4zQcPgVvt695Cb5RgseTAtyTgoEdA84MMk5OcmsuEoVFPd30DM
 tQqmxnQfM2JNCV16L3kO6P+zPNnb1tJ1A2eU84U4aK7DDZLlmYTwUPbp9
 j6EcDpFs0y6LDZS9zgmtOw6K4G2LyODsyKwJaBH9mRr69+NTFbmczGf8G
 ncRLC/mtQ4fCbCtm9oby/09VH0+RQo4RJ4l+iUlifejeQE2uH1LqCMuG9
 piEjQ1g7PB+Z/XloRfMjHUEOFmhw2rXTxwBMT3bzG3PzhDtDMlWPzu7Mu w==;
X-CSE-ConnectionGUID: jhP6kwjLQt622Q2EbA1vtA==
X-CSE-MsgGUID: h8fHL638STylG8b2GtjKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75093304"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="75093304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 17:13:45 -0800
X-CSE-ConnectionGUID: aMvxY0DWRD+/HlZARPi9Kw==
X-CSE-MsgGUID: 0RIP6RczRfCveb3JnOk3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187616328"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.224])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 17:13:44 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH] drm/xe: Remove never used code in xe_vm_create()
Date: Wed,  5 Nov 2025 03:13:11 +0200
Message-ID: <20251105011311.3177875-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.51.0
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

Clang is not happy with set but unused variable (this is visible
with `make LLVM=1` build:

  drivers/gpu/drm/xe/xe_vm.c:1462:11: error: variable 'number_tiles' set
  but not used [-Werror,-Wunused-but-set-variable]

The use of this variable was removed in the commit mentioned below as
"Fixes:" but only its declaration and update remain.
It seems like the variable is not used along with the assignment that
does not have side effects as far as I can see.
Remove those altogether.

Fixes: cb99e12ba8cb ("drm/xe: Decouple bind queue last fence from TLB invalidations")
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ce2f2c063eba..8fb5cc6a69ec 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1459,7 +1459,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vm *vm;
-	int err, number_tiles = 0;
+	int err;
 	struct xe_tile *tile;
 	u8 id;
 
@@ -1620,7 +1620,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 				goto err_close;
 			}
 			vm->q[id] = q;
-			number_tiles++;
 		}
 	}
 
-- 
2.51.0

