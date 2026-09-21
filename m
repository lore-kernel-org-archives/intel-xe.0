Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFAEC982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 11:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2F810E301;
	Mon, 21 Sep 2026 11:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yj2lQLDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A4710E301
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789990238; x=1821526238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jPY66Zq1rkBBxp9w6sDLqmBxUvzxFqAVyc0RPKw2fl0=;
 b=Yj2lQLDNgEwUKouKVidl9ds16xruKMNSiPNBymK70pc+uaeAg1hXmFcZ
 I11E43vGmRY80M6Gb886Tp6DucPO5hsKk6+6uBuQAIe43GdSLxfu1dfGm
 6napHtRql4N6VUNZKhT+mnCsz210eGQ/iY3nYH+ZROWjwU/Mt9vmU90gR
 hpJBStEyLmpsKKw9hfSgFXvrG25CPE6DPAwxuGTb61eWsDcwfIbHl4CA2
 5st8dNx52mHjM4ACz5TjyseMnKxPb6ld/cs+rgtFzRT0qsCDVnbqZqd3c
 ktzI0tZXAWxNTLTiWwUaiwgPkwq+BVOUhzCv7ikmUqB0ywK/mCP/LMJ9z A==;
X-CSE-ConnectionGUID: uQVP7DjLQtiqkVHeznmyOA==
X-CSE-MsgGUID: jrK0+4qRT+qKo4K/jPcGQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="92993978"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="92993978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 04:30:37 -0700
X-CSE-ConnectionGUID: zn8D4Z63TGOqV4VMitlPNw==
X-CSE-MsgGUID: kI0IuVRMQ9+RmWDY4+b1aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300549119"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 04:30:33 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v1] drm/xe/sysctrl: Fix byte-order reversal in mailbox frame
 transport
Date: Mon, 21 Sep 2026 04:30:31 -0700
Message-ID: <20260921113030.4075591-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

sysctrl_write_frame()/sysctrl_read_frame() memcpy() mailbox payloads
into a u32 array before transferring them through the mailbox data
registers. This treats a little-endian byte stream as host-endian u32
values, causing word byte-swapping on big-endian systems.

Use get_unaligned_le32()/put_unaligned_le32() to convert each mailbox
word explicitly, preserving the little-endian wire format regardless
of host endianness.

Reported-by: Sashiko AI Reviewer <sashiko-bot@kernel.org>
Link: https://patchwork.freedesktop.org/patch/751309/?series=172513&rev=5
Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 72baf1aa4b3a..d5a34a24a0d6 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -8,6 +8,7 @@
 #include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/unaligned.h>
 
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
@@ -63,16 +64,16 @@ static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
 	};
 	struct xe_device *xe = sc_to_xe(sc);
-	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u8 buf[XE_SYSCTRL_MB_FRAME_SIZE] = {};
 	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
 	u32 i;
 
 	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
 
-	memcpy(val, frame, len);
+	memcpy(buf, frame, len);
 
 	for (i = 0; i < dw; i++)
-		xe_mmio_write32(sc->mmio, regs[i], val[i]);
+		xe_mmio_write32(sc->mmio, regs[i], get_unaligned_le32(buf + i * sizeof(u32)));
 
 	return 0;
 }
@@ -84,16 +85,16 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
 	};
 	struct xe_device *xe = sc_to_xe(sc);
-	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
+	u8 buf[XE_SYSCTRL_MB_FRAME_SIZE] = {};
 	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
 	u32 i;
 
 	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
 
 	for (i = 0; i < dw; i++)
-		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
+		put_unaligned_le32(xe_mmio_read32(sc->mmio, regs[i]), buf + i * sizeof(u32));
 
-	memcpy(frame, val, len);
+	memcpy(frame, buf, len);
 
 	return 0;
 }
-- 
2.43.0

