Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE91C98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A2C10E711;
	Thu, 24 Sep 2026 06:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kA8emLWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8222310E711
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230180; x=1821766180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oy1S0dB7h/cPyHOmGPoXxlcVjyCtAsGQzueRvSMHNzA=;
 b=kA8emLWwkHVixZHJL6U8nTZfA7c+TkjZEbKMMlu3Eeg2jL0xB2TlFrjH
 DuJvVtvtPkq8f2j7H7Nwxew0/XKjjqkWwFPSNL+fT4xrHXJtrcu/xpbWH
 VNp3kIIXxg/IT2MGbp58GE+/7Y3UvqMNDuVZ4Qq/e+fe+3om4b8XJqlGd
 Z74HB8nVkKODf0jS04SxJ5MJLIErvwaMNuDW0Zr0yqohR/70EqctYnHK7
 kMN2/A2ifaSFzAKG6STzc0druy6IX2AaJnFQe1mPN0NAPLiWOeIC9ZokA
 lT9DBFh8aAz0BeUmv8DsPNM0xoRfMWIDhz5/FUURplJFFeghsF+sBS8AH w==;
X-CSE-ConnectionGUID: WggqG+RBSXG1+jqCBXehgw==
X-CSE-MsgGUID: yVrDS8A1SxyGzE4j4okkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853969"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:40 -0700
X-CSE-ConnectionGUID: pO+NpOFSSxCYff8DbBvQuw==
X-CSE-MsgGUID: akjCVSNjSem+PojaYKB3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096668"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:36 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 06/10] drm/xe/sysctrl: Fix mailbox header handling
Date: Thu, 24 Sep 2026 11:39:07 +0530
Message-ID: <20260924060900.146167-18-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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

The mailbox header was defined as __le32, which required
cpu_to_le32() and le32_to_cpu() conversions whenever it was
write or read.

These conversions are unnecessary because the header is always
handled as a 32-bit value, not as raw bytes. It is written with
xe_mmio_write32() and read with xe_mmio_read32(), which already
handle any required byte-order conversion through the underlying
writel()/readl() accessors.

As a result, the header value is already in CPU byte order when
used by the driver. Keeping the extra conversions had no effect
on little-endian systems and could cause an incorrect on
big-endian systems.

So use u32 for the mailbox header and remove the unnecessary
endianness conversions.

Fixes: 1f95f618182b ("drm/xe/xe_sysctrl: Add System Controller mailbox communication support")
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v9:
- Update commit message. (Michal)
- Use fix tag. (Umesh)
- drop __packed.
- s/simplify/Fix/
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 2fb317175922..2e4247914bf9 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -20,20 +20,20 @@
 #include "xe_sysctrl_mailbox_types.h"
 
 struct xe_sysctrl_mailbox_msg_hdr {
-	__le32 data;
-} __packed;
+	u32 data;
+};
 
 #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_COMMAND(hdr) \
-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_RESULT(hdr) \
-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
 
 static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 				  unsigned int timeout_ms)
@@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 		return -ENOMEM;
 
 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
-	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
-				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
+	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
+		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
 
 	if (data_in && data_in_len)
 		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
-- 
2.48.1

