Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B3FCA5FFD
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674410EE2A;
	Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5AgXXi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E1B10E1F6
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227175; x=1822763175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12Nh0gxoCpADaNn2Pysx9nEfr//wPDkUYA0GKmOKl2M=;
 b=D5AgXXi47YxURfH2Bg0Q7J9dqqrsznLi7FOltxtnQB+6RMeeoDxhjP+O
 eAgU7WfHCIP6kp7tK3FT/tDcZUQI/R6Ti+7UbUK14mKbv2dopu35vXxwu
 SinhC9j1pXslYha0vHFO6y+KU9nx1axAEXv0rp2nXtR6ghyF/mpkp+5CY
 WnrMHoBDZNUwhmORoPOGraP5v/hRJM5kbav6T2P4Jj3B3VzbTHmAo8r2F
 QMfu3xvSMQcmOgunCfamjK8ydTriUwSHjOC8EV+VoMZxBxObgzxIt81ex
 mc7xEiglaTe9skXRQif12BnkTJ9RnkulgE2RxLnmnhFnnY6F0V94kn5kD w==;
X-CSE-ConnectionGUID: HMUdRkV0SEGzI1UockB/vw==
X-CSE-MsgGUID: 780iTePvR/SwdERFFauxdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578417"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
X-CSE-ConnectionGUID: VZo21/knRJ6EO1551PKn/w==
X-CSE-MsgGUID: vqD+IZDMTxCzKn4nOG3XcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690858"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/15] drm/xe/configfs: Fix out-of-bounds read in
 parse_wa_bb_lines()
Date: Mon,  5 Oct 2026 19:06:12 +0000
Message-ID: <20261005190611.332940-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
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

