Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18CBC982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9344310E665;
	Mon, 21 Sep 2026 13:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLf+tJQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DBA10E665
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998009; x=1821534009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4jFFTAzo6zZmILsBxJtlfjB8kL6PflcuoCJ46lxoe4E=;
 b=nLf+tJQGqV5KQDeENu4JQL8sXuz6ThN1noVqjJuq3rCyv0Y4yC6oZVro
 aLqjwNLQGTubHg0kM86iE2PSSEOXuc+HRfu0N+eBXYTlaxekSxqQQSkMH
 03OjNpwHNacOeLmEYHjiYIdunNa1Jq1il7XpmLq6k0lipK+hf2If/6rih
 Xc2tka0LGt01L+riB3Qw0F69Mf40RffaGPB5zOM8+7V5YVsJ5qW186kcy
 7ChE4ZB8b3eoGUNJM71o+/UrvfcDKpLL+Yukclhr7W/wF44tM7p5JCK3H
 64df9ufx63s34n+ueeI3VcOB7gHKga3c1mnIe0YVOzXHYP9vOTShoANKV g==;
X-CSE-ConnectionGUID: /Tzkp3UMS9SXn1epQlPF3g==
X-CSE-MsgGUID: xOXSzZ5kS3+MqqNMQIf61g==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036287"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:40:08 -0700
X-CSE-ConnectionGUID: s+i+/L7LRICWebI7lMYBaQ==
X-CSE-MsgGUID: oyQYWGLdSyKpHXPkTbQTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298899132"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:40:02 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 05/10] drm/xe/sysctrl: Use xe_assert() for payload size
 validation
Date: Mon, 21 Sep 2026 19:09:32 +0530
Message-ID: <20260921133927.128281-17-mallesh.koujalagi@intel.com>
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

