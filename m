Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D9C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 18:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2210E4BF;
	Wed, 22 Jul 2026 18:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvKTyCRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CA10E4BF
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784743581; x=1816279581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhWYd+W0CttTNgcX91dauu0Pw1MnQzuzexGKxRFURTY=;
 b=WvKTyCRnLCuo+fyXKDUA+5RppQcOESsTe4z/hgfNywd5TMb6FIyNfxWW
 BRPMY2iRk+cqn6E7ZmhrYGn8RrJQv3zTelA9W49mr4Vu9EaRSNXvO8g1D
 800I69U3aggbKgNxHSrJmYywzuM3SebaVfZzLhrqiC+qlwFRtn8nn1F1U
 QgiHefAXV29n3+IS/eVYZn7pg4biHHff4SRsrq+enbl59WnrL23ecxS9x
 if0jCXe4gtTZRbiQfWGADrTSRW174DWi0AOum7Ql3vOahhKhvI7XWW5kB
 i3OGbkSG+UVdCvpSB9qu+8fJi50JtLxd5qaVd9aoPf8AJ+oeQlK9gEspE g==;
X-CSE-ConnectionGUID: sCO1InloTp2uqej8onYNHg==
X-CSE-MsgGUID: xNbGxoDjRAmYW+eMJ9jw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95744219"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="95744219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:06:08 -0700
X-CSE-ConnectionGUID: o1rR+jU+Q2SK6cdYaSkTHA==
X-CSE-MsgGUID: 3/9EjRN4Th2BC8umF671Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="253802242"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2026 11:06:06 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 1/2] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Wed, 22 Jul 2026 14:06:04 -0400
Message-Id: <20260722180605.2498906-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722180605.2498906-1-zhanjun.dong@intel.com>
References: <20260722180605.2498906-1-zhanjun.dong@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..0b5f0a6d7d13 100644
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

