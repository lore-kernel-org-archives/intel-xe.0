Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CDC624D7
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 23:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C9710F379;
	Wed,  2 Sep 2026 23:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbmu2pD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DD010E073
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788392444; x=1819928444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kKjz0FyDHOSoMk2Od5ey7F8gvu+BFZXNQxwNuRFTk+U=;
 b=hbmu2pD31J42tPdc6by5jqjsLYGO0eyomc32+5NfweJQhIg1R98BP+Fu
 kNG3icXMvoebR+e6+7S7Pv/xjEqj8SCiawN03Nu49baYFnctmLSPV82Cx
 KZlL2rOhixL28RjzOwXQslS8Y8uWuEL6Ru0aHAOszbCot1UTFDz/6fdsr
 OZKWRPymR2OYah89Q4Cm0jis58PYYiC34Q6ND3kv8zeMO2KDEWGyL/vCb
 N8gNIrJHnZN/Y2jEn9zN5mVD3dHlLiqHTyP2A3wDWIwdLI/FPyW1xfGk4
 2RXL6uMKgfEQ6aZR+oOU4EK09d5qJq7MOlagr4pf8tJZ6gVVJ6i4HVxrj A==;
X-CSE-ConnectionGUID: DsHAHaYiSYGDC3eosH0mFA==
X-CSE-MsgGUID: kcT/EUaDTsGCGkJpqe6r4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88738928"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88738928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 16:40:44 -0700
X-CSE-ConnectionGUID: sVMVOUfsS06CNEX4UKOX1w==
X-CSE-MsgGUID: qjRo52NcSY6w/HJiGJWe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273054826"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa003.jf.intel.com with ESMTP; 02 Sep 2026 16:40:44 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 1/2] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Wed,  2 Sep 2026 16:40:33 -0700
Message-ID: <20260902234039.885267-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

From: Zhanjun Dong <zhanjun.dong@intel.com>

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
index 25fe9dbc9141..3b70b8a88259 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2633,8 +2633,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
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

