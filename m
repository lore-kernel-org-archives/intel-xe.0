Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB03C98316
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EADD10F2EE;
	Thu, 24 Sep 2026 06:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvi62rA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2DF10F2EE
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230189; x=1821766189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9kbhJNAKflHJ0hVVlgsNXz2165tWHDowk397wbdMaOE=;
 b=dvi62rA9y6rkCy4peO2icycWKFAOQ8VyBVwIaz6kLxYWjXC+e9tixPKM
 DOC9vMB9jLoCeUuZxWJjS4PeHyjh6A6vVcnWo3IaZDDWUdJdU8RMYUsq/
 QHu3oiWNXnd0utkjrmvse7psO6cv99Va5rx+66YaB2Ysvn48i0QiHM2qy
 8Rd8Uk0mt46QRrtvnEyqbpwOOKQTyPxGcAStzPT8nnOlVyE/gc2U+ZbR9
 o6tM6VPacMDHMcdnLkxhB2lLloYwgn04J2spsCfpWzZB48MhgI3V9DfMC
 uwYjah2lcW0qvtqxhr0lgyw76CR6iCxwMV8bwxFuGOeNRK4214oHfWKUM g==;
X-CSE-ConnectionGUID: E9CoUjk8RdaPJh9Qmyr78Q==
X-CSE-MsgGUID: 5DtAcFhjSU2u4swIVmT3/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853975"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:49 -0700
X-CSE-ConnectionGUID: Q2ovHyU3REuTHBMMUld65g==
X-CSE-MsgGUID: olDBBGPgSQq3n9RwsMuMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096682"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:45 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 08/10] drm/xe/sysctrl: Improve firmware response error
 logging
Date: Thu, 24 Sep 2026 11:39:09 +0530
Message-ID: <20260924060900.146167-20-mallesh.koujalagi@intel.com>
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
index cfcfc79e0302..753fcc026057 100644
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

