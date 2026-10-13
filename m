Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13681CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 22:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A906B10E2C0;
	Tue, 13 Oct 2026 22:28:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38D10E2C0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791930530; x=1823466530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFFcW4FwjBJoi4iwAASYST9NKB2R9UrXCEkH52DQc/Y=;
 b=F2ZR/diKxjKxgG3DhuB0rIVNs7YhgUZJr9EecmpryQXxN0QkMFyXlxwb
 Hs3QoHBjfxh1Z3IsjYTLQjr1nB1NNNqCH4bjXON4xnkyWGbeaktyXtXBO
 pSUaSUi3Hs8Z36cr66tTA9eIYHnyQl/KKeRDxg0zQZWOT+4zCJw8fyvxr
 UKxC5R7B9mfp24VpBl3swcI56/2ygL/itQBrh/DsGyLEVQRHej/8bp9Ws
 YVMe/c/ZN8H9DMqlwBzOH+ERK8EKpUWRBZHB8xMUF7q26yiZcyEBdunQf
 1Fp5PLHamyUWmnlCTfdP7RW2YpI636DBZPdnjT4v1n1IiqUw0GoY4hpMc w==;
X-CSE-ConnectionGUID: 6LsHv+ktSN62apXjzRLtBw==
X-CSE-MsgGUID: TbMVhqp1Tb6l6Bx3v8+zZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="555669"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="555669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:28:47 -0700
X-CSE-ConnectionGUID: p3/EjEmiQiSlcBlJWrHfUg==
X-CSE-MsgGUID: v+6SDbPEQ0+YL1FN6VDFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1163672"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa007.jf.intel.com with ESMTP; 13 Oct 2026 15:28:48 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v11 1/3] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Tue, 13 Oct 2026 15:28:45 -0700
Message-ID: <20261013222846.308259-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
References: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Zhanjun Dong <zhanjun.dong@intel.com>

The LRC snapshot printer adds an extra newline before the replay
offset and replay length lines. This leaves blank lines in the
HWCTX section of the dump.

Remove the stray newlines so the snapshot output remains compact
and consistently formatted.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index de9a9560ecf3..fe2909b7b84d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2718,8 +2718,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	}
 
 	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
-	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
-	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
+	drm_printf(p, "\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
+	drm_printf(p, "\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
 
 	drm_puts(p, "\t[HWCTX].data: ");
 	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
-- 
2.43.0

