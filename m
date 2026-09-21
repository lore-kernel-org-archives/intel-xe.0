Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D077C982F0
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A045110E791;
	Mon, 21 Sep 2026 13:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/WJXh+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8DF10E79A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998013; x=1821534013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BP/SRTVB9ccehTKKeKLUbxN3D0tKPTPm9Z2zLG2YTTU=;
 b=B/WJXh+4X/WMGt38Pd7D77u+P7SEpeMinmxg5+OY6OJjmZSRYoKRPAl5
 2ybBSYOhej0eGop5nMqZF1qRrlp3WgqDzI0chSRt8eK/ceztGxsP16xAZ
 dlItqG33ULN9KCQ7K+hjHN2DTkpLlf0aPph/tnuv+V7+MXRlOmaDNyADJ
 GwJv70V0O674AIqRNLfPE30zqfcIFgXZG6Eu9+CJFSsPLM3J5KBfvCTRQ
 3kGS1ZVsmmQVmyE5sWw3TJotXExE6NWwQr2cXFgZHyxreJqclkGeaPRn7
 rsEgCBUdJdEsPNUyfsTWTrKOx7GYflat6+OqzcP0iA7nZuHTZ/k8kgV52 Q==;
X-CSE-ConnectionGUID: Y+pEcse6QdOrZGf1ZvZ9dw==
X-CSE-MsgGUID: a9B+ZDitTSKHm4wjDaGmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036294"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036294"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:40:13 -0700
X-CSE-ConnectionGUID: 99C/XRExQduY8J0J3zoa6w==
X-CSE-MsgGUID: l/jXpS8IQKGGT4dmlizZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298899340"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:40:07 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 06/10] drm/xe/sysctrl: simplify mailbox header handling
Date: Mon, 21 Sep 2026 19:09:33 +0530
Message-ID: <20260921133927.128281-18-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
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

Use u32 for the mailbox header data field and remove unnecessary
cpu_to_le32()/le32_to_cpu() conversions when encoding and decoding
header bitfields.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 50bbdab072de..750178a0974b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -20,20 +20,20 @@
 #include "xe_sysctrl_mailbox_types.h"
 
 struct xe_sysctrl_mailbox_msg_hdr {
-	__le32 data;
+	u32 data;
 } __packed;
 
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

