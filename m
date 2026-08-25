Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F3DC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4610E156;
	Tue, 25 Aug 2026 11:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2d2M1aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1923F10E156
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655972; x=1819191972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1OET95lhy/v95AUTh3iucUbYrXO8XEHtBOLjHVKTYGA=;
 b=d2d2M1aqFcZA+e31bnnt4IY0bpiET/X/9zY8I1VFGO5phE+/WM+CYdC1
 ZwkW7Ky34lsrSCWgO7LEJeMpPfjbWBzvGKtfwS1PdECXZSqBtkYxJwVzP
 zS1h4LnofLmdwrDyjpI5xIldp/6ftBO++ayF0WeLjA4znZEf8pqdz39qs
 GoG/gEy+eFX1X76TgKYxwFSFYmwuGOkXqhzxYLb0cenDduWcw+MdWLpqJ
 gAByOaOy6IvCUqele95gaQroIrfccoaBpr6GJ8FgMbdz94OfzLrCWeLOC
 V4dE8uMHHboM8CB4BSH+D01rWeNzZd7YRauHfC5SZqbepYd6OeWgX+hcp Q==;
X-CSE-ConnectionGUID: F5Z9sPMkRGqkqYOT2u67nA==
X-CSE-MsgGUID: NfagwJYHRbCX55X4uzLuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248261"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248261"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:06:12 -0700
X-CSE-ConnectionGUID: pWtbP9R4SPGIjYGZuaAc1g==
X-CSE-MsgGUID: kwNVWi98ScmlangztZ2o8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131358"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:06:08 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 4/7] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
Date: Tue, 25 Aug 2026 16:35:47 +0530
Message-ID: <20260825110542.1359776-13-mallesh.koujalagi@intel.com>
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

Replace the runtime payload length check with xe_assert(),
as oversized messages should never reach code path.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 81a88da2bbfb..f8b518dcafa2 100644
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

