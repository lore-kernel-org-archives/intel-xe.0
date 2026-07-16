Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEBCC44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 15:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1C10E273;
	Thu, 16 Jul 2026 15:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlbYf3S7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3EA10E314
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784217078; x=1815753078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhWYd+W0CttTNgcX91dauu0Pw1MnQzuzexGKxRFURTY=;
 b=JlbYf3S78mHNDM04ruMZHo5tDB1uQgyo0r4mNjiyE8OSzlhzGLPTKO0w
 sJ7fGGjueJ1oZIaj1dPGOfbuIR88/Rpq6I5QbwxTXr5wPZwnuxpuoZUhv
 JmAKydR3jXlukgpYpcbs48wYN2UROxehkdo0SadUTwVFgWlPKpfgXAL7O
 nPHVtN4tDW6ehK0OZ3wDVc1gFArHj1UPkW8OjZgdtSq0nk7n8EG2phrP5
 EGpB+yHh+l/RpokGoJjAdAQzU1mtk/bgfIGV5C4UsKR10VSeHisF5GZEl
 udLFWBs6UaTV8JTD6atNTkyxB4XWzVvobHzsls/JF3nXw1YNNlHz9d/UM Q==;
X-CSE-ConnectionGUID: eXuyy3IUS7+ziYz+uPdCng==
X-CSE-MsgGUID: sk/smgryRq+A5TNQVqz1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84659650"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84659650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:51:17 -0700
X-CSE-ConnectionGUID: NRMixU4QT56p7Q9Wderxkg==
X-CSE-MsgGUID: P3gjjR4qQrO11s9I+2a43A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256590477"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa007.jf.intel.com with ESMTP; 16 Jul 2026 08:51:17 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Thu, 16 Jul 2026 11:51:13 -0400
Message-Id: <20260716155114.1427366-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716155114.1427366-1-zhanjun.dong@intel.com>
References: <20260716155114.1427366-1-zhanjun.dong@intel.com>
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

