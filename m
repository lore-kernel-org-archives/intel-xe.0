Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1418C5DF8A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28BC10EFBD;
	Thu, 20 Aug 2026 10:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6Cja9bq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5784810EFBD
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221020; x=1818757020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ypiZ2+yeA8B3BjvzMDkdsgsaXXZVILoPIToO54q8ps=;
 b=I6Cja9bqocylz8gxc7yc6gq2PjhOapJA48+xOm0DEChvdo5RPdtosJZT
 SnmSg9/8CbWVwhQLTuM4I10XAOK2WOkOF3pUbIXzOdwe3n2FBwxKTdH5j
 WP0Dcco1SDVISMU5W2cBvXKKgez+2PhSzD3kVj96DGriPWgZjwryI8Dpt
 P4YPZkeG8v8mZj23sNv6itY/EAgbmesccS3UIq2w3Ou6Yl/GiHEbb26Jn
 6OnDtszKd4OOs66CZt0PElFEYO1B54DsayBJUP2aTN+HrW1Cm/g/jBE2i
 FhK40jF25yjgVgJWV7wQa+koiC1v4TZ8K63qON/l5TmRI2ysogDgkV6F5 g==;
X-CSE-ConnectionGUID: j7ocpUx+TLGbRWIkpfvfsg==
X-CSE-MsgGUID: VRpBMQk1SByf8PB4C1fyiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113290932"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="113290932"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:17:00 -0700
X-CSE-ConnectionGUID: jpLTR1x8Q+WNfFz5TxDbtw==
X-CSE-MsgGUID: o5djbTyUTQmstAHQMXmoKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="271176431"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 03:16:56 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 4/7] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
Date: Thu, 20 Aug 2026 15:46:37 +0530
Message-ID: <20260820101632.527214-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
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

Replace the runtime payload length check with xe_assert(),
as oversized messages should never reach code path.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index ac58571f2a43..c043b51cacc8 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -105,10 +105,7 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 
 	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
 
-	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
-		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
-		return -EINVAL;
-	}
+	xe_assert(xe, data_in_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
 
 	size = sizeof(*hdr) + data_in_len;
 
-- 
2.48.1

