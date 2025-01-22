Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C7CC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6A310E2DE;
	Wed, 22 Jan 2025 23:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e70LEame";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8724E10E21C
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737588805; x=1769124805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Pt2xyQ3USD6yPRsvyH9PifvkxNr4na5cD5smmI/mkY=;
 b=e70LEamenKkLtPfRsM4z/GRtNHjU++t7PgSGFcQEK14PjGCEv3uuq17J
 Io/tt8oikhWQX2ypiSNzCcgThXNYxlf8e7huLnjM8TUYUc1xeLsSI+6Uv
 ny0FaTJ1qRAMXYqgQmeMHvbXyqlfq9gJ/avgIi62BNBqzlQ/dZxOqd7Zo
 VHsfX3vJ6O8MJcKkoNXbpCPp1ODLWSDSJjZpImTF5RNkwFms+Sip6I8tt
 Q00JNDd3MQATzmHYLvdL3W2XtmU83si6nBygyHeKPmBd+MhZr/KhCicda
 q4cF6X7Mj+33ujqKse2x0cvWYbkty2mGWaTstQHgSGD2LlYXNwTfgflc/ Q==;
X-CSE-ConnectionGUID: mRHyCpRQS72ZJbYo3GSjbA==
X-CSE-MsgGUID: RBljd8dvTJqZukDIHh3WfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37950133"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37950133"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 15:33:24 -0800
X-CSE-ConnectionGUID: On6TgOiZTzqGz9vibXBOnQ==
X-CSE-MsgGUID: 1IGOd20zSi+TUEjvwuyd+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="112315800"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 22 Jan 2025 15:33:05 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/3] drm/xe/devcoredump: Temporarily disable the line
 wrapping of ASCII85 output
Date: Wed, 22 Jan 2025 15:33:03 -0800
Message-ID: <20250122233305.3667730-3-John.C.Harrison@Intel.com>
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

