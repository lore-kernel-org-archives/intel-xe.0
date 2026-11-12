Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7mj0BL1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA0810E6C0;
	Thu, 12 Nov 2026 21:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86610EBAE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519316; x=1826055316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3AhenyNpRYgfs6eJKsekWUfBV2pa9k1Wzy6QvhV2rA=;
 b=H7mj0BL1MtvAkAK/46Om9Vnnm4d6RKWVUKlfqq6IitxAGHWLniJgsWKF
 HFJVDxQH+WgFYivFfCYW3/2dE+KS6nn4zS9SplnSsU4ZHa8kj09iA08z1
 0hWDFAIMphqrCxB2dPMoC+nS/qEWTpV4xrLy6IUShxsQOqV+nM1E2gCi3
 eUIMdJY7rKeOPJpC6IJbTntU0pAHvcy7eaQ9ig8/SS+87xwAaP/0SRYD4
 /X8wzNZsP0ryyji/jPxEitp7u5Yb14cRXSWxTIW3+EobEZnQhHwdJMHzc
 8b7bW0IhTAk2J3QGf7A7+CjLCuQM1vI+jzJYwxcuCgKiu0Dwpdu8b6Wqs A==;
X-CSE-ConnectionGUID: Vu+IaANyT8uhN3nG+M2BXw==
X-CSE-MsgGUID: PDswgDtqRWepTjlX/heXfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351721"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
X-CSE-ConnectionGUID: Vw/JuG9ZQ6+q9tX8y+wrKw==
X-CSE-MsgGUID: +TGUDjU5TXu9yAFpR6T5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754520"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/8] drm/xe/configfs: Fix out-of-bounds read in
 parse_wa_bb_lines()
Date: Thu, 12 Nov 2026 21:35:07 +0000
Message-ID: <20261112213508.457213-12-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index cc442014cf12..c844155afe52 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -820,7 +820,11 @@ static ssize_t parse_wa_bb_lines(const char *lines,
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

