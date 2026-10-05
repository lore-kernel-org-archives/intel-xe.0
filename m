Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86DCCA6002
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316610EEEA;
	Mon,  5 Oct 2026 22:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahBOoo47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84F10E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 22:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791238000; x=1822774000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12Nh0gxoCpADaNn2Pysx9nEfr//wPDkUYA0GKmOKl2M=;
 b=ahBOoo47/10iz4VFSsMwp49V5iF55+essgQqCrC5+F1YcOjIYCD8qynN
 0AMnAvDd9IWzmHTDOCzIFQPromRj8E0aZPGsWYUoC/cfigVC7Iw6uQwOX
 SP+OPzapabHfGXTgmO5yWgNyicmcVS0UwXcCr+yV94IdIxL239Q8UXgWf
 240GxtIglXYLOE/9ztexz7mDd1sMhuv2BR0NT+U084MMM4EqxL8kUBvct
 IhDFArjRr+YVf0oeQXuv3n7QxRcZ8Jw5NZAVi2ltyFMhpKrRymitehelX
 2K1hzqt9B2NzdACDd4cYvxnwWthKvjtzK3rBsBvdfRzSKMWioo5sEYE0S g==;
X-CSE-ConnectionGUID: vDiKeXxHQO+93Hnq1uvDqw==
X-CSE-MsgGUID: WX7JPyUQTcGhOyPhuAjL+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="109410167"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="109410167"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
X-CSE-ConnectionGUID: urS/f9S1R46CAAEe5NJJrg==
X-CSE-MsgGUID: +HMZc3K5QNueFtyvdZGjGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274732156"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/15] drm/xe/configfs: Fix out-of-bounds read in
 parse_wa_bb_lines()
Date: Mon,  5 Oct 2026 22:06:38 +0000
Message-ID: <20261005220636.602826-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005220636.602826-17-stuart.summers@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
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
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e1cf5af958bc..1c7a096aa046 100644
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

