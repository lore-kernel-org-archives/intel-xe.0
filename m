Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C5CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DFE10E889;
	Mon, 11 May 2026 19:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DODNRg5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755CB10E275
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528968; x=1810064968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2vWxMbKrTDmwTzrt8mUwez42958XQY6CkQ8w2cFJMk=;
 b=DODNRg5EHe7o/wHG0XYBv/UVWFOKrn17FxxI9An/bJthl7B6M9jc5ZFU
 1fFN3hMTXW/xI9QhOsOAaIQDWHQyHWEuU/l/ZiTFEYPMsLhdNnug/lnjR
 KH+TvBzvNrmOVLkPxmLoNhaBhcGC3OEWTFlw44OixsebN7Fs53w4H8yj1
 KiY58QBpfmdQiGHIBUykb89zBFwrhLzY57UhaTVPOi2vmKcA/EmQ0BE8K
 4+TFpzOdGSmF/WfvJ3kjxn1RoL1DCwMtgrLTOdKcj/J+fwCz8TpFqA55/
 qLSzBXuXiX1mUi/vpVewXc8wNrdKLSHOugp56H71vXK+/icGZgJ9sTgPt Q==;
X-CSE-ConnectionGUID: QOAiN6rHTe+sc6GrNpGBOw==
X-CSE-MsgGUID: /+rGnysLQoC/9VYrkUGR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79609908"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79609908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:49:28 -0700
X-CSE-ConnectionGUID: hX/efBsHRXK0EKxSU452og==
X-CSE-MsgGUID: cmVGlqQlSDuAK/DSZR6vgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242550367"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa005.jf.intel.com with ESMTP; 11 May 2026 12:49:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Mon, 11 May 2026 15:49:23 -0400
Message-Id: <20260511194924.2016315-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511194924.2016315-1-zhanjun.dong@intel.com>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
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

The LRC snapshot printer adds an extra newline before the replay
offset and replay length lines. This leaves blank lines in the
HWCTX section of the dump.

Remove the stray newlines so the snapshot output remains compact
and consistently formatted.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..9a2ad920b29a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2593,8 +2593,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	}
 
 	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
-	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
-	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
+	drm_printf(p, "\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
+	drm_printf(p, "\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
 
 	drm_puts(p, "\t[HWCTX].data: ");
 	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
-- 
2.34.1

