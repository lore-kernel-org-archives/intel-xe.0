Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51293C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041F610E21C;
	Wed, 22 Jan 2025 23:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4ajr9Le";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882B10E004
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737588805; x=1769124805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GsxE9heYwlUFQ8Dro3Sx9Ma3DqFMLQ5nfP+hzkTmnVA=;
 b=a4ajr9LeQIyFTnkpRmSEcdtxwZtqr2gqYiCvc2xm6i5Zk8bdT+V6+x8o
 F4LIWwVSPxeq4ls7ShTDxZUpIu+6jiXIWRAEf8XWTPWQ81bOmszivDUnF
 ZI4br3vMhql9MJXhxp/Qq8qVe/qRujd1RBMYgTF5ts9v2gH4sktDksKqq
 QDyLZPaA1DLxYBQReZLvRJ/b40yhy6Ds+jfcN3IQkFCdmFkiTgZWUKyKq
 Sh4bQvlC0ctbkGe/vaQgRkxdJXocaBpYhXKJK45De95ttUlwGRiVjU3cY
 FwK0/wA5gp8QJapDmasy8euyOS7FP1KgffnXyVvhP9G7COBaKCjE9awDz w==;
X-CSE-ConnectionGUID: VFFdaiV5TVCbsW6cbb4neA==
X-CSE-MsgGUID: WFvRWOYQRLaF8sNtu5tclA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37950132"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37950132"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 15:33:24 -0800
X-CSE-ConnectionGUID: 8nFIouNQTLCL5VbpGhfpwQ==
X-CSE-MsgGUID: C+ITc5HzRRalaw13XxBKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="112315798"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 22 Jan 2025 15:33:05 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc: Explicitly name each chunk of GuC log data
 in a dump
Date: Wed, 22 Jan 2025 15:33:02 -0800
Message-ID: <20250122233305.3667730-2-John.C.Harrison@Intel.com>
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

A mesa devcoredump decoding tool does not cope with line wrapped
ASCII85 data. The GuC log is saved and printed in chunks. Only the
first chunk was named, thus subsequent chunks were effectively line
wrapped data. So add names to all the chunks instead.

v2: Fix size of name variable.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 80151ff6a71f..d10ba20685fe 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -207,8 +207,10 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+		char name[22];
 
-		xe_print_blob_ascii85(p, i ? NULL : "Log data", snapshot->copy[i], 0, size);
+		snprintf(name, sizeof(name), "Log data %d", i);
+		xe_print_blob_ascii85(p, name, snapshot->copy[i], 0, size);
 		remain -= size;
 	}
 }
-- 
2.47.0

