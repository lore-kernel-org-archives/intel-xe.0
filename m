Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE54DC9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8210E558;
	Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma/axhMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEEE10E558
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4i6pA1nZPKwtRXbWRc7wFOA6RlU44tQT50IxOYqypyg=;
 b=ma/axhMp7KInCG1j9bH6bTrJrIWTli8wF1qLlppsZ+UsdCbnpvfdRhUd
 T7nmI/9TbtWc7qWh/webXh7l5hh2IrX/+y4joyU6RduHmKovl2TaSEZ7d
 aiXUT2ai8/feXX1xtr6yJ2kPdeGNll1VwJlULt4CpKhQlUyWgnMiLbCma
 9kU7TjNvh7ZyMyQ10Lv3Tsr6Bv3BX9RKk+VxoN7DQImU/nkamYR0haJ43
 Hg/c24WrOT1cUnYt49LIn0fzKhoQRu1c9jizIOvEBHvV+uKAiAWBiOCsF
 NveMFODOq5WTz+Ci0nLF1VN/5msCh/tlJ1jJAkjZv8dOUWSX+bbGlA0s/ A==;
X-CSE-ConnectionGUID: ikDdT6z9RqSPcTxsG7C20A==
X-CSE-MsgGUID: lHzCNgIzTwWZelypzMe8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120169"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
X-CSE-ConnectionGUID: Ewr735G4Tju18+xOao0I4g==
X-CSE-MsgGUID: 9BgVD68QQl6IAVhNZev0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651592"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:21 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/16] drm/xe/configfs: Fix out-of-bounds read in
 parse_wa_bb_lines()
Date: Thu, 24 Sep 2026 23:01:21 +0000
Message-ID: <20260924230120.389685-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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

The outer loop advances the cursor unconditionally at the end of each
iteration. When the last token of a line is terminated by the NUL rather
than by whitespace, e.g. "echo -n 'rcs cmd 1'", the cursor is already on
the NUL and the increment steps past the end of the buffer, so the loop
condition reads out of bounds. The leading strspn(p, " \t\n") already
skips the line separators, and every iteration consumes at least the
engine class token, so dropping the increment keeps the loop making
progress.

Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/xe_configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9ff39ec8c07d..c4ef151c9008 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -776,7 +776,11 @@ static ssize_t parse_wa_bb_lines(const char *lines,
 	ssize_t dwords = 0, ret;
 	const char *p;
 
-	for (p = lines; *p; p++) {
+	/*
+	 * Each iteration consumes at least the engine class token if it doesn't
+	 * error out, so the loop always makes progress without advancing @p.
+	 */
+	for (p = lines; *p;) {
 		const struct engine_info *info = NULL;
 		u32 val, val2;
 
-- 
2.43.0

