Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8618FC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D2F10E066;
	Wed, 22 Jan 2025 21:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7znbLyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E0610E237
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582363; x=1769118363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Pt2xyQ3USD6yPRsvyH9PifvkxNr4na5cD5smmI/mkY=;
 b=F7znbLyyMRkInK8qT0YVCoXm8HBZazaPlpr0z84odQDEMqleE6TUHRWh
 XVTrBKZHE8lkP/IXHW0pgRY09I17WKER5dHoleqh50WkxF2/xyg9hUeOE
 /vdDPUrW1+XNybdGvb4F0i8eEVt1wHAybCoB1ZpJJZXz2XK0Jtw21keMj
 G7tQMsUliLarcLXDqsD8xGLs1s8abtpUcDccZnWVYn3wyIV2mFz0pQmHW
 de0XykXen2ugtvZvHiUHsgKpgvTOjnyBQBeUFv5WjuxFOY0aBfrY0hgYI
 4b41RnRB5OqeoI9+XqEdLljyowKfjptrhLU2s+wbEdYAeGgV7ZXgxQo/L A==;
X-CSE-ConnectionGUID: 54YBE3Q6REWqQ+TWIcLIJg==
X-CSE-MsgGUID: P5bCDmkmSM2o8vNHMT5wSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37947608"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37947608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:46:03 -0800
X-CSE-ConnectionGUID: 49L48x7hRtGm9O8LJb5DRg==
X-CSE-MsgGUID: W4a+vDXkT2CpaCPEf6jrGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112239271"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 13:46:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/3] drm/xe/devcoredump: Temporarily disable the line wrapping
 of ASCII85 output
Date: Wed, 22 Jan 2025 13:46:00 -0800
Message-ID: <20250122214601.3560156-3-John.C.Harrison@Intel.com>
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

Line wrapping is required for doing emergency dumps to dmesg. However,
it currently breaks a mesa debug tool. So temporarily disable the wraps.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 81dc7795c065..18a7ddb561d8 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -462,7 +462,8 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 		line_pos += strlen(line_buff + line_pos);
 
 		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
-			line_buff[line_pos++] = '\n';
+			/* Line wrapping currently breaks a mesa debug tool. */
+			/* line_buff[line_pos++] = '\n'; */
 			line_buff[line_pos++] = 0;
 
 			drm_puts(p, line_buff);
-- 
2.47.0

