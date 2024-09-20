Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7415DC78849
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E56D10E14D;
	Fri, 20 Sep 2024 13:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHNwWmXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBB710E100
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726840012; x=1758376012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NgRcjsVvzNMRFQNc5dWbzis40GlsZ0VvNr/2pF/Si18=;
 b=cHNwWmXlTYNSLNhKl/SPkU5TUktfOdI+kg0zeov/4I1EMZmttjZgSvou
 7pgDUcblzIQS/1XdYBM24OT05R+sHiphQ16d0FdlNVu6EyrZtTb3JHlFo
 Co85ePX9XXtxWrDavqMn/Tau4bOUQYMN7z43pFk6f8brCig1mBrpdpDpZ
 A2xDPn2tlPAJW3nMoyJ8/V9JSiHD6Rr12EecFj8g6qm7FvDSSNP1euh1f
 UuE19ubJaFMLAmKy5lUqIufDQFPh8yQFXyLfMktvs7RRf3U69bjxSI+p6
 YSQm0Lh81uSnAfnvCgMxe+izr7Lo1ShmhjmrdaRcbmMMjObUT/xdzvWTU A==;
X-CSE-ConnectionGUID: 6hsBm6KzRO6PwDYMfGynYg==
X-CSE-MsgGUID: zV/qte9DQ++z61NAyjQSiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25363739"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25363739"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:46:52 -0700
X-CSE-ConnectionGUID: xASd3O18Q9GHACPj1GMjew==
X-CSE-MsgGUID: gVNDVk+YSeygISmh3S2P2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="74684452"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:46:50 -0700
From: bnilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [[CI] 01/12] drm/xe/guc: Remove spurious line feed in debug print
Date: Fri, 20 Sep 2024 19:36:35 +0530
Message-Id: <20240920140646.618008-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920140646.618008-1-badal.nilawar@intel.com>
References: <20240920140646.618008-1-badal.nilawar@intel.com>
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
2.34.1

