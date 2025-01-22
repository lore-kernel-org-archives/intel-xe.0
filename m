Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BFDC0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5464310E261;
	Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYXDcULT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87010E066
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582363; x=1769118363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=prDK3S0cdhv73SPDPALsPPJZ+lfMT8XWGhFyWNQiKwQ=;
 b=dYXDcULTcdqgAmGbLCuEM275IBEbgXjT89ai0kwT383iwMi2qO77Tcsu
 Tm1jnvbNnAxazEcOJdruN870BXhUtn8zpwezS6JqGIKUndjBa+qR68bIf
 MRv4Rj9FyZNUDjWM2Gfd7YfGX0a+RdBWnYN2okPdox9N65MVfzi2VMHDD
 Zs/T3Hk1qGs8uock8ZtdARDBOAhvuciD/7HaSK/hySR0MTj2A7oIYlwFc
 kPCJdm9v0iLwd7QaDKhcY9/UtJrdX3XYr7ocSnq6h5P6q/7k8PsffvAn5
 D+gaLfzLpLWY7x+IjkxfI0+rEaxkDC7ktEQ4dtXaHBo4X/nvqW2Ue9yCm w==;
X-CSE-ConnectionGUID: XzBWkRovSBKP5XNgiR61SQ==
X-CSE-MsgGUID: 5C4Zm7DpQVSrVD6DMfNZLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37947609"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37947609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:46:03 -0800
X-CSE-ConnectionGUID: 9Pi10VaSRD2IrxRANsGljQ==
X-CSE-MsgGUID: hzSwNeGGQfGgiMkiADfK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112239275"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 13:46:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/3] Partially revert "drm/xe: Revert some changes that break
 a mesa debug tool"
Date: Wed, 22 Jan 2025 13:46:01 -0800
Message-ID: <20250122214601.3560156-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
References: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

This reverts part of commit a53da2fb25a31f4fb8eaeb93c7b1134fc14fd209.

The KMD has been updated to avoid the line wrapping issue of the mesa
tool. The section heading issue has not been fixed yet, however. So
that part of the original revert remains.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 18a7ddb561d8..81a461d62770 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -420,15 +420,6 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 	char buff[ASCII85_BUFSZ], *line_buff;
 	size_t line_pos = 0;
 
-	/*
-	 * Splitting blobs across multiple lines is not compatible with the mesa
-	 * debug decoder tool. Note that even dropping the explicit '\n' below
-	 * doesn't help because the GuC log is so big some underlying implementation
-	 * still splits the lines at 512K characters. So just bail completely for
-	 * the moment.
-	 */
-	return;
-
 #define DMESG_MAX_LINE_LEN	800
 #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
 
-- 
2.47.0

