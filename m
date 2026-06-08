Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36700CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951F10F909;
	Mon,  8 Jun 2026 19:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6Dbr3q6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AC110F909
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946343; x=1812482343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cGtV+GVCMTAw33419sy6qlLqxPHx6qXedU2n8gMKRCc=;
 b=Z6Dbr3q6EpJg8l9Pl5O1SXhabx7Fln8So6vyxLbEUYc8QWUQlsrZCJZf
 1TyB+cqbo0uMVwKUWs54V9ftHp8Yc3kSRvcQ7IqhHzMmumkre6YolPaC/
 MB3lqROeiOcHUYYKxI7j/Woa3P4dUcRx6p8XLi6VGTshnUg4H7HmwDvCz
 BqAmQ2uYChPcoirS8y59juTFPJrqO13/pYItCJ8zaNQVlF0gxteUvntOX
 uRcJplraADGtjCOPPR5qdLnwpfwdcW3WK2OqXvTU3baA8d93CPZV4K5zF
 KLLUYcZLeLMpECDL0722sd5pLfx2a1RCwRrUrNUJK3GZlTj+drXijmpyu w==;
X-CSE-ConnectionGUID: OOo++RlIS4uaOn4fuwhQcQ==
X-CSE-MsgGUID: tvIn1aGLR56xGxhvcTar3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92019429"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92019429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:19:02 -0700
X-CSE-ConnectionGUID: EsrP9gl4QhqeEHt77sTYiQ==
X-CSE-MsgGUID: 04sd/X9fRCCre2I99ZEDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244789344"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:19:03 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 4/9] Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
Date: Mon,  8 Jun 2026 12:17:47 -0700
Message-ID: <20260608191831.2337033-15-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608191831.2337033-11-julia.filipchuk@intel.com>
References: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

This reverts commit 4e53a9b93ad2f9bdac73a52fc852c5137468e4ee.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f97c874edadf..3f08a3b54062 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

