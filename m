Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59209EE6B49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0410E8E5;
	Fri,  6 Feb 2026 18:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRdx3IO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B36610E8E8;
 Fri,  6 Feb 2026 18:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770403024; x=1801939024;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jRk9zUO8K/65BHYu7uTAeL5qQGxD4xpM4JrDZx8CHd0=;
 b=WRdx3IO2TyKHvtbOZWj9j/WmuMdH8Zn6ltea/2d5qIY4+zsNm/dcMaQK
 pO/i9axyfBLD4kVLQMqRztdButnVWk16BDWbro59yzMLFzhLPUfQEPkGZ
 ITiMMRWB9uF8LyGmCK+1biUhuLMZI7R7OTpL9jBv07/aLfh3RFV1TopSn
 3FbQyhBW0Z9J5B936pJLdGCURqluBOJPkh4eAT2GYPdc2ut2FDVr5nOkb
 8R1p7yQ304AX2sXAtBexKhtKZlzxeNLyiiQ6N5JXCCi75q8CZD7q2Wsd/
 lBF6VQ8n4pbJhSTBqSCpobbiPHSiZPj45HOw7XDdoo9BO1q/Oe2zluJoU g==;
X-CSE-ConnectionGUID: R9Ku8xniQMarzfSEBX36aA==
X-CSE-MsgGUID: U6FNyAhxRV2fcvAa0ckBGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516969"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:52 -0800
X-CSE-ConnectionGUID: qr2EYHmbRx2ZMQisLIlg9w==
X-CSE-MsgGUID: 1PARiNNtRr+56RB/awp9FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224790"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:52 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:11 -0300
Subject: [PATCH v3 15/15] drm/xe/nvlp: Bump maximum WOPCM size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-15-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
X-Mailer: b4 0.15-dev
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

On NVL-P, the primary GT's WOPCM gained an extra 8MiB for the Memory
URB.  As such, we need to bump the maximum size in the driver so that
the driver is able to load without erroring out thinking that the WOPCM
is too small.

FIXME: The wopcm code in xe driver is a bit confusing.  For the case
where the offsets for GUC WOPCM are already locked, it appears we are
using the maximum overall WOPCM size instead of the sizes relative to
each type of GT.  The function __check_layout() should be checking
against the latter.

Bspec: 67090
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index dde4f4967ca3..900daf1d1b1b 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -55,8 +55,6 @@
 #define MTL_WOPCM_SIZE			SZ_4M
 #define WOPCM_SIZE			SZ_2M
 
-#define MAX_WOPCM_SIZE			SZ_8M
-
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
 #define WOPCM_RESERVED_SIZE		SZ_16K
 
@@ -186,6 +184,14 @@ u32 xe_wopcm_size(struct xe_device *xe)
 		WOPCM_SIZE;
 }
 
+static u32 max_wopcm_size(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_NOVALAKE_P)
+		return SZ_16M;
+	else
+		return SZ_8M;
+}
+
 /**
  * xe_wopcm_init() - Initialize the WOPCM structure.
  * @wopcm: pointer to xe_wopcm.
@@ -227,8 +233,11 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 		 * When the GuC wopcm base and size are preprogrammed by
 		 * BIOS/IFWI, check against the max allowed wopcm size to
 		 * validate if the programmed values align to the wopcm layout.
+		 *
+		 * FIXME: This is giving the maximum overall WOPCM size and not
+		 * the size relative to each GT.
 		 */
-		wopcm->size = MAX_WOPCM_SIZE;
+		wopcm->size = max_wopcm_size(xe);
 
 		goto check;
 	}

-- 
2.52.0

