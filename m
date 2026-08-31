Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99672C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E23310E7D2;
	Mon, 31 Aug 2026 10:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWr2uvPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9F10E7D2
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173140; x=1819709140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Ei6s6sbEAMfTkcVnswuKMgCXa7WkFF44qRsthCZM5M=;
 b=AWr2uvPM2YDZqMB/YsPIGtDb3ZRKGluOlVvGCLRJ8XDP+Vor+d77EDUo
 gqRq1JG404eMMShKlJ3WGH247Hbf8Tr4iG/GEmN8ypzIDZtAvB/bd6L/H
 4ldUZ3AAtXyEfTLiUy11c+tnJY8/Y5kf8FqsNZtjWfNo26KlAbw5hW6CG
 b8m60gdPzotrICEcCqKf9E6wFfW8x+52pzg8svDcFInCM5yJVkgZuexBZ
 9Dq71jFOVSJByzTPBIsCTC27qPSfpmXnmgifjnv4dTf4gK8aNhWoflAxV
 bWZ5tlX4DuRbM8iq08br1Kk0dG9p8MKxciuDY+9c+q+Oor0mZsbzFBgSt A==;
X-CSE-ConnectionGUID: ugxfxS1FSvGeWYz20of3IA==
X-CSE-MsgGUID: C1zUcvpfTpy0XDr8jCFChw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264645"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:40 -0700
X-CSE-ConnectionGUID: HWwOo2dfReiRMiz8D3ow7A==
X-CSE-MsgGUID: KzTzB1k/QQyw99MQVS0uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685573"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:36 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 7/9] drm/xe/sysctrl: Improve firmware response error logging
Date: Mon, 31 Aug 2026 16:15:04 +0530
Message-ID: <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

v6:
- Move REG_FIELD_GET to different patch. (Michal)
- Update response message.
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3aa868f60b38..87e656820279 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -233,13 +233,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
-		xe_err(xe, "sysctrl: Response header mismatch\n");
+		xe_log_err(xe, SYSCTRL, -EPROTO,
+			   "Response header mismatch: %#x != %#x\n",
+			   le32_to_cpu(hdr->data), le32_to_cpu(req->data));
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

