Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70866CA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0AC10E801;
	Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoMunWPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F2010E801
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YPVoBNMq9UD2Sk9rUNMVKO6ZULo5Ws2TJrK2Ykf9LbY=;
 b=DoMunWPANuIKzhuQk4iG0yNa8njze0uDkNiiS1OPQ/DmHSzMmkplPXij
 X+7xEezWlfPjaIn/Rbqd9aA5s+IQ2kQqT5r5leYWPPCNaRGMOVAfDcSM7
 zw9qYaFXEROlrAspxOOG/1Mnr7r6M4nw7XOU6eDUAD5NhqVILNDPTqfP5
 PA/OG7hVJdBzEwH4tooBo92Az2318i+kjShPU00Y8NZulSkhsGEkQ8pj+
 sE2GQTKOZDJnZgsOZcYaN96ppaarTkSvaBTQumxy/7Aa4uLEFtDhaumi/
 rYIqkNfb5sfm4ZqnwOq8kevL830WvaYRUF8aKmiOp0L5Wwt40Gm+ix83L Q==;
X-CSE-ConnectionGUID: KnrDTEmGQJuLIqm/w4Jxdw==
X-CSE-MsgGUID: g2aPJnKkQWywIGSLHItlfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245218"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:11 -0700
X-CSE-ConnectionGUID: dWeWVL2cStOSsT+rzmCatA==
X-CSE-MsgGUID: X2fVclGgTke7ZRtBPjZ+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040562"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 1/9] drm/xe/guc: Remove spurious line feed in debug print
Date: Thu, 29 Aug 2024 23:23:02 -0700
Message-ID: <20240830062310.3450387-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f24dd5223926..83046a5fbac9 100644
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

