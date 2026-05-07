Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F1DCD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 18:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B91610E2BD;
	Thu,  7 May 2026 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMGBt48F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057F010F26D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778177182; x=1809713182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJMVcm8QJbJrEY9vSvxLa5Adb2waQH0kPKgL4a+VTbU=;
 b=nMGBt48FtaXY1d1MUPDKKObzyINXKYTwdY0yTa+VAEAmfLvr4GB942ce
 gxSdDlt4q6UUu8QhYQR9Meb3IplaXA+1JZqI/27Ra/E3bc5xFVcwKd6z1
 VQSRDdQSA6Mj7RcEiTDH2jZCrH8PA+0PmpQPD0PiXL2N8CNVTMHOnL5SR
 loWoedov6nesFEyQQnTsLv4lZjRQ//AK8mc7rAOpzIFAlPWfeL9OUYjCC
 80R6UI4fwF4pK8QpGk6cQTsNz4YD5JgxapuG7ogkOBOTvOfha+K1nwzrG
 w7hpIiGYdFNco58RH8w0JVdEIfrrMxKwxtZeGJpSEhFRzpUgVO+uHkJzy Q==;
X-CSE-ConnectionGUID: DzoGrfYoTbCjCPehww7VEg==
X-CSE-MsgGUID: xTjQNdnbThiaXIzg/LhKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79325189"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79325189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:06:21 -0700
X-CSE-ConnectionGUID: 4MOJimIuThKl0L8l9TSTHA==
X-CSE-MsgGUID: yyFS/pFvRhWgJga5Fq7eZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="259968793"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa002.fm.intel.com with ESMTP; 07 May 2026 11:06:20 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 2/3] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Thu,  7 May 2026 14:06:17 -0400
Message-Id: <20260507180618.1420986-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507180618.1420986-1-zhanjun.dong@intel.com>
References: <20260507180618.1420986-1-zhanjun.dong@intel.com>
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
index fdfe2ed5f683..3e137e3e5cfb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2531,8 +2531,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
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

