Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0776EC98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD610F2EE;
	Thu, 24 Sep 2026 06:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4eMWLES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E2C10F2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230176; x=1821766176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KN2q0bgMrY5CjOmcfBmIRA+qsxZmmprcF4SXqGOJhEI=;
 b=D4eMWLESPOi0Au0AC2Ado0/r/yys0EZBY1sE0qV1lYLiNW0468dqPJiE
 NbmC1HURJ95IPWELEJQ4qbDDbenzTlLzhTFHHUhKvfi5RU7s0fko3rdId
 YTdhOg7QPX3uxDowChe2nromKo/A0tTpe9L3Q70MZlmxInyxVXePyk6eW
 P6xFjfusZaj2I7/PnCO/z1KO3X7JEIgqUC8KaY/uS/CEeLkGi/oO4cwPU
 jlnhnMLvXktKvZJHJtSdo/M3QFDb1k9FNJoUG9cGlV20HOR7CsaLoo5nc
 van5UDtquUKucIjngOEZmhRg8dcuiI7whMdiG1hjCaVr52o3fu8LfuCH8 A==;
X-CSE-ConnectionGUID: VzrpMW+GSSCcm/vUekOg/A==
X-CSE-MsgGUID: +bamBvp6RdOysvTm7Ru4vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853966"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:36 -0700
X-CSE-ConnectionGUID: WnuoR4lwQPy8UNZluszEng==
X-CSE-MsgGUID: Px6GMtQJTLS/x8pUA4T+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096651"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:32 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 05/10] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
Date: Thu, 24 Sep 2026 11:39:06 +0530
Message-ID: <20260924060900.146167-17-mallesh.koujalagi@intel.com>
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

Replace the runtime payload length check with xe_assert(),
as oversized messages should never reach code path.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index c78e8021a8ea..2fb317175922 100644
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

