Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC19C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76810E487;
	Mon,  7 Sep 2026 10:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/vKHqyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6826B10E487
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778428; x=1820314428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4jFFTAzo6zZmILsBxJtlfjB8kL6PflcuoCJ46lxoe4E=;
 b=g/vKHqyDZkZjmntk+DLPYLbkZw8NGA4oitc9Om0U4s+aONsZQ355HI6N
 ufBW64FtLvMVgdCfbc4yuwYH70jH77CkutDmff/MrVfMME2jDH0KN7MWT
 Bqe7RU0Om7fdwd62RVNj9wJvqIN2YG9o095fN+xWl0w4RbRYtwFrRimwF
 7qUMjJB/lHOIirl3RKloSoJx5WKikG9CRtylVNXkIRnnsHDF8WemNZV2/
 WdjFyIWh345x+lez0Hi594L2OOs3wyGrX7+3Huw4W3F+n3xXXOXndG3uo
 hZmBoXYphU9XgyjpCDsuHo63L+qJgk7staQGP3hG5qmp9cp2RkF53Bi/K g==;
X-CSE-ConnectionGUID: y5EVCmjwSMeLngFhmJygGQ==
X-CSE-MsgGUID: 1lu8t+rASzKVP4X4qrX4UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024513"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:48 -0700
X-CSE-ConnectionGUID: //fYHn0mSpGjQbyi7v2ezA==
X-CSE-MsgGUID: TWgMFYZBSfCxOAAk1qRZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908396"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:43 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 5/9] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
Date: Mon,  7 Sep 2026 16:23:19 +0530
Message-ID: <20260907105313.2208003-16-mallesh.koujalagi@intel.com>
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

Replace the runtime payload length check with xe_assert(),
as oversized messages should never reach code path.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 4841dd7f2724..50bbdab072de 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -103,10 +103,7 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 
 	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
 
-	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
-		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
-		return -EINVAL;
-	}
+	xe_assert(xe, data_in_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
 
 	size = sizeof(*hdr) + data_in_len;
 
-- 
2.48.1

