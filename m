Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA6EC61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A4410E1A4;
	Tue, 25 Aug 2026 11:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWTyx0Z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0710E9E2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655977; x=1819191977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KOr1qKp4QB6dLi93KG7gylcTg/BvrMnNpVDRT8KOdew=;
 b=TWTyx0Z0tDMvc0Fk1rMOyUB3s1R7l8DQ8Z8roHp1eOAeFCQVR6f08/zK
 AfDD2TxrJr9t2CNq6RMcW3ZL8w7a7jjZnsDyHQ1NSWSbWzIA+gY2Ru13j
 mBODMg/zfQVFcNwBh/A6djnPQk9vVdnUXwRbR8YOEqqOYSz2f2sdecKH0
 ENpN2ACBq97IB+YXioHsEQ2xyHyHaEv5EVhjlI1/hKzR+fA3ShtMkIoJx
 Htju22mkcWeyQwISHyc/1m/A5BbSsrnEOBXAHcoew5sGDtDEti5b8vcTP
 SX6mR8n9B6UQAy3nziazy3gEJ4M2VyPbmJ8de3kR/wro0p94QpqqIo3v0 Q==;
X-CSE-ConnectionGUID: ZbMhaMStTlaY8hO/Zy/WDg==
X-CSE-MsgGUID: kr/MKoa7SUawXRSC1tnIUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248265"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:06:16 -0700
X-CSE-ConnectionGUID: 4B7A+y1iRuqBByqzTxQIuw==
X-CSE-MsgGUID: Ai+5BZnwTcusCCsDciBO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131362"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:06:12 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response error logging
Date: Tue, 25 Aug 2026 16:35:48 +0530
Message-ID: <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
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

Use xe_log_err() helper and include additional details when a
response header mismatch occurs.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v5:
- Use %#x after REG_FIELD_GET change. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index f8b518dcafa2..5032d766b314 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
 } __packed;
 
 #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_COMMAND(hdr) \
-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_RESULT(hdr) \
-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
 
 static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 				  unsigned int timeout_ms)
@@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
-		xe_err(xe, "sysctrl: Response header mismatch\n");
+		xe_log_err(xe, SYSCTRL, -EPROTO,
+			   "Response header mismatch: got group=%#x cmd=%#x is_resp=%u, expected group=%#x cmd=%#x\n",
+			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
+			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
+			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
 		return -EPROTO;
 	}
 
 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
-		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
-		       XE_SYSCTRL_HDR_RESULT(hdr));
+		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
+			   XE_SYSCTRL_HDR_RESULT(hdr));
 		return -EIO;
 	}
 
-- 
2.48.1

