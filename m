Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC6C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF4610E215;
	Mon,  7 Sep 2026 10:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bY20whES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735C10E78F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778436; x=1820314436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P03we2qL9eg038Ae4bZjioB2vRI0OjLz/WGNBsooBJ4=;
 b=bY20whESNuMes+gaVeFZ+S+Qt4rZznEGGLyvp9rlNSeaIFuJTx7gu+k+
 OlaTkq5mSan69AZpioGjNh2wLL8LAcDGxQkNhyGxuWt5EbeiAdLf4uA32
 g+s3Y9vko7dIW00KCT1R5m37/RVb0rCF7bZg4p9e/+TZuixWbA47ODH3L
 GnBzZKXmrU5AqASXInsAm6BoOvF6qpo6hRKa1HgBjxm8eYAFQlP2nIbbB
 mlwDDjDkzVZ857nmGXLgIWxWqwjZGhUHhrSV5pzFFLlLmZdvDaoBZins4
 pqq3LFHE7J5xmmhZx0vjegIFF2QkIaJgEca7NT/k+LgnWVIRXCv+Qr1aD g==;
X-CSE-ConnectionGUID: IpmnWovPQkWvV/43j3eSyA==
X-CSE-MsgGUID: dP21kkDTR8iml6Kvez+LoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024517"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:55 -0700
X-CSE-ConnectionGUID: oaarZAezRU6sCquosw7I8Q==
X-CSE-MsgGUID: fm4CNGIgQ1uZdUCwkhhcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908403"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:51 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 7/9] drm/xe/sysctrl: Improve firmware response error logging
Date: Mon,  7 Sep 2026 16:23:21 +0530
Message-ID: <20260907105313.2208003-18-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
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

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v5:
- Use %#x after REG_FIELD_GET change. (Michal)

v6:
- Move REG_FIELD_GET to different patch. (Michal)
- Update response message.

v7:
- Remove le32_to_cpu. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index cdd929ebed4a..94ed2d378b89 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -233,13 +233,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
-		xe_err(xe, "sysctrl: Response header mismatch\n");
+		xe_log_err(xe, SYSCTRL, -EPROTO,
+			   "Response header mismatch: %#x != %#x\n",
+			   hdr->data, req->data);
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

