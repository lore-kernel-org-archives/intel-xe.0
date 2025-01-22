Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A95C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7C710E26F;
	Wed, 22 Jan 2025 23:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZauCYphr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111410E2DE
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737588805; x=1769124805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXtCtSnH97WUL/PtQqj1CJjctFu/8MXnU7txdHlBBYk=;
 b=ZauCYphr2a0ggFhXikLmbtkliwHUN0LUX6OZn8aW2ZKp+Ybfj9Tzsjc/
 OZ4tfOkVjqVYk6dRS8Q0CqxaVGTJnrf5hGo1TfGAK54cWhCYPPofkW1CC
 RYM2crjt3fn2fHLXnqjZ41ud8gZChfu9DDKDll/XwNubH6nNfJBeU2JhY
 tBcDoOMfBkVlXXCFP6G28mjVU/E3CTnIbIhfz2nPjo04mOX1L1H/g5Hbo
 EGu9YT5Ngi7QGX+McuhCvp/e9/FMG+1N6EBDBzgxDu6tQc+CrD5w1C90u
 Xv6nI5wO7TTtfgwdD1eil7lWoAAgZpcoJ/RGjnNwv3hTg1zsEKhnL+5QE A==;
X-CSE-ConnectionGUID: OKtwH+CRSFKUuh3FFHI6kg==
X-CSE-MsgGUID: W8F2fOAOSRCoxWQdBistDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37950136"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37950136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 15:33:25 -0800
X-CSE-ConnectionGUID: BJ0EXdHkTviR1nay0WSoSQ==
X-CSE-MsgGUID: NXOKBnl1SVWMhS+Dy7XfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="112315802"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 22 Jan 2025 15:33:05 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 3/3] Partially revert "drm/xe: Revert some changes that
 break a mesa debug tool"
Date: Wed, 22 Jan 2025 15:33:04 -0800
Message-ID: <20250122233305.3667730-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
References: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
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

This reverts part of:
  commit a53da2fb25a3 ("drm/xe: Revert some changes that break a mesa
  debug tool")

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

