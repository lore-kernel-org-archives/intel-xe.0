Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E621C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 07:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784010ECF4;
	Fri,  2 Feb 2024 07:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwXkyisj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158CF10EBFD
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706859214; x=1738395214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEhHckBx4YEFS3WwA5Nsw5A9rAxmsIIFSfTjEiiR+Dg=;
 b=gwXkyisjsDOt0ohGO7+sskskaikBI/ZwII8xpgRsf621ENA61iyayBa4
 i3Dwt9FZBS1smmFMaaCttXt14Poz9GD/ASfqClmIxJAEn+cGmipv34JLt
 DiI1FgXhr/aWVmTr+mI4yQRWq49yv4ytKDqsoza9gGjv9E2N/+tE1bfv7
 1eslPFTpLHy53XonvpWd7yLn0ntuvdqR1aGAb/JZy2LSqVSPoEjB+wifD
 x/1bG+kOO9xftDlTObEO+eyFcRknLvOqsWa+FZQkHE3I6e9mzWtTrvOZR
 yu39ISFcLAhw5vY4l3pwOTYUIX9HfOaGe3s04p5wHkS82pjAlNLZW2FPE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3026073"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="3026073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4634276"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 23:33:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Add support for LNL firmware
Date: Thu,  1 Feb 2024 23:30:50 -0800
Message-ID: <20240202073050.1986142-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
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

First release of GuC firmware for LNL is now available, so start
using it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d896c98dd0bb..9814c5d8538d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,6 +103,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(LUNARLAKE,	major_ver(i915,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
-- 
2.43.0

