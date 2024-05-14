Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57686C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE9410E4B0;
	Tue, 14 May 2024 19:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZDoQhXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DB110E53F
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713701; x=1747249701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vj3jk+84NNlPEJ2atrqbkF5D2AXDqUGjqqXae7bH5dA=;
 b=dZDoQhXgMoe/OvxDdYLL4Hnfl+Nj0CyzYj6QMcf17OInGz3SNlMy0lG+
 WtWrINgnnsV6EDetsHd3U941+PDS3lVv69C1pYPXAduxnA5PrKOZjMNbs
 jip/BgqLEBhXeU2g651RkTTkUcop/EiK4XicVF8qixnX1shj02vd0pEp5
 AXQ+sPH/vsKMs9wRENeAT8Iy1mMuKsbjF9G4SAXQReX2/Aaw6wKdmewn2
 bMH11PjTxgksq/tHMt6B9G/6bv1auKmcrpAp5Ym3PWSqGxE5ur2R9n/UG
 C+p/HCKcGYAOLAy256ySbP1pmEOZGQSFFrQsWxvqcdxO0sFH9GBkrX07s A==;
X-CSE-ConnectionGUID: oeL7AyZTQOaOEMVkl3pv8g==
X-CSE-MsgGUID: ECuKZFeLSRWCPF6Ix9hHjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11552838"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11552838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:08:21 -0700
X-CSE-ConnectionGUID: J9FvQyKrT7WVB1e+QD4zUg==
X-CSE-MsgGUID: ioNLR5SyQ8WXp2LIhmY9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35270769"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 14 May 2024 12:08:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 1/2] drm/xe/guc: Remove spurious line feed in debug print
Date: Tue, 14 May 2024 12:08:18 -0700
Message-ID: <20240514190819.1970533-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514190819.1970533-1-John.C.Harrison@Intel.com>
References: <20240514190819.1970533-1-John.C.Harrison@Intel.com>
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
output when sent to dmesg. The break actually appears between all the
usefu prefix information and the actual string being printed. In this
case, each block of data has a very clear start line and an extra
delimeter is really not necessary. So don't do it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0151d29b3c58..ecbf0b116cc3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1435,7 +1435,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.43.2

