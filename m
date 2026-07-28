Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA8C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964310E985;
	Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Osr9az4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7010E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255101; x=1816791101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=554A9tzEwUm7qq+REg3bp7JbtQSIQ39S33GIeFG1Z58=;
 b=Osr9az4YSWhbv+EJDsKQUCMzJskBHQDs5kF72M5QZpZ3JqvhfOtOxOCb
 YdsTL2P3rX08GXCKpkb2iu2Gw7YJDZ1UiiQ63xVu87EYxVTldh4/nuIXq
 vf9ktytuZKG08c0vnkwP+718rMTsO1gQdb8/hAgqdpYvry3Sp4bKrAhnn
 Dt+tPO2YZfMYTncG+7TkA5jpw5xg2bc0MzUoSv2O/vdnE6o04rxvCZMZO
 OjF75h8BFWo7B13vIbYiWgixlVr8PpihTGxtuQSZec8vTDOOG+KQ1ZNEP
 OB+pyST0ydByetzJgQtcsxEDKu45Q99vHGogk6VjHEBrRsGAPBGB0pVhI g==;
X-CSE-ConnectionGUID: NskuLl5nQIyySEmK6r7yag==
X-CSE-MsgGUID: qArFH6cIQLKBrU/dcyQ4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386304"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:41 -0700
X-CSE-ConnectionGUID: 05mIYmqqRSCaahNEvDlu0g==
X-CSE-MsgGUID: 8h5Hou28QRG68f2uLJvJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819449"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 19/22] drm/xe/pcode: Report 'Mailbox failed' error using
 SIGID
Date: Tue, 28 Jul 2026 18:10:34 +0200
Message-ID: <20260728161039.579-20-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

Report 'Mailbox failed' error using xe_log() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..014632e11338 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -14,6 +14,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
@@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 	}
 
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
-			err_decode, err_str);
-
+		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
 		return err_decode;
 	}
 
-- 
2.47.1

