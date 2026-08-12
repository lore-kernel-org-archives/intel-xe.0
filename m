Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B1C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76A910F0F1;
	Wed, 12 Aug 2026 19:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6YLEFdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192710F0EF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562146; x=1818098146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hu8ndf68w7bsIbrst+SQD3QyeZFgqI3QktcrFSnODtg=;
 b=f6YLEFdbaNkhRq6usSfRNHww5bfqTFyfVxvC8bgtkUHoDB6DxVmQdNOv
 +Hb9e4WcBb6DqzqFYI7ZPUWyJLxmngOY/+4FbW/w9g+wESSL0IMPuKfji
 MJmwhLMfKEt6lytS0q3kcZkJ4khth/Y9cw4ztSyd1VDtsQCgrOh36NcYq
 M66ADSVxtzUiDVqMCzyG7/jn5hQMKcGOK0vAfY+37hQeYFS7CMaB3OwZv
 TZTgv3Aa99+caHUb+5vz/0s9zDwqRIXGvifKdj7t7msUJB4H864ENcWuz
 HOwipgReztauIlxmTB9OwgitYTkWA5pbiu3cE5QMB2MvxfDV8JziN5NKW Q==;
X-CSE-ConnectionGUID: 7tzfpTWqTYGWjwj4Rpc6Pw==
X-CSE-MsgGUID: uNQkCRonR/Skw6aBfFCn3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987592"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:46 -0700
X-CSE-ConnectionGUID: 6ZRlGW6BSP+TkY9Z2Ko3Ig==
X-CSE-MsgGUID: 6DMcmRpYSKuIVTyeSLLMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892062"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error using
 SIGID
Date: Wed, 12 Aug 2026 21:14:41 +0200
Message-ID: <20260812191450.11690-26-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'Mailbox failed' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: say xe_log_err() in commit msg (Mallesh)
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

