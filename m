Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C7CF854A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698C10E0D8;
	Thu,  3 Oct 2024 00:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbyJ99wu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CFF10E0D8
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727916372; x=1759452372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZeQs53wm6ed54JkpA6N1W85jW5iKCuP6XPXOUbb8nw=;
 b=IbyJ99wu2gzqAZGAe11HUEdGf7ECX2NRZNNCwMp1cqB+34FaxmFEyXOh
 ZqIrqioFVJhNT4ZeOeDhLmY/eUuUs/7WYZD6bPgWA6JeMvXJe9EbwTF9g
 0PtyTUDVpsnfTw6kjJVY/DK5legH96BO5+L5Ew0Q8t3k1QH1BsBvHzUta
 yjY0cpXNNB61ra4pFxrH/ayyheNUXYPTNPTFNDJbfQEuPWhRDCL8hVwKL
 26dNaeJ4qBnnxPX9hUJQA/1b3dVG+rREgKsyi91QlyACK2ZEDnM/rh3qt
 AER7Gl1KTWjA/+lQgi9RMX3dSZssFkFS/hsIHHXI+yHl+XzhbQP+R6Ywz g==;
X-CSE-ConnectionGUID: 65nlFkNqRvmEnMRBcxJSlQ==
X-CSE-MsgGUID: N06dgdTRRLG8q3bY6fdylQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38460020"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38460020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:46:12 -0700
X-CSE-ConnectionGUID: Y4NzD3DdSmW0cxSus1VsRg==
X-CSE-MsgGUID: 3Ljo8lflQG+jnSrCJu8ipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="97514731"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 17:46:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v9 01/11] drm/xe/guc: Remove spurious line feed in debug print
Date: Wed,  2 Oct 2024 17:46:01 -0700
Message-ID: <20241003004611.2323493-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
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

Including line feeds at the start of a debug print messes up the
output when sent to dmesg. The break appears between all the useful
prefix information and the actual string being printed. In this case,
each block of data has a very clear start line and an extra delimeter
is really not necessary. So don't do it.

v2: Fix typo in commit message (review feedback from Michal W.)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..a63fe0a9077a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1523,7 +1523,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.46.0

