Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC44C78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF3A10E14D;
	Fri, 20 Sep 2024 14:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3G9ygMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C5A10E837
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726841360; x=1758377360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NgRcjsVvzNMRFQNc5dWbzis40GlsZ0VvNr/2pF/Si18=;
 b=A3G9ygMW4bxpCsAUDByM1QdNZWOYhHo7pDBDK5A8EoldoaGA3JC5i6Mc
 1p0540nYGKZvKQ/eO1tbiCmEXcrsFlCt1lLnsW99V34DArAiaL4EIubKj
 eU9Xy1icYhJ74LSV/irgKxgRIWRAXEZkpbcpsmlN7c74Pj3rHGrrtlRqA
 r4Tr0c/WN2vHM/Ezq1mAkYwQRM5ezLQNQriFDpkqx1AlWwTqOZJ1l59mo
 4NzUS5HUgPXWBvNWpKd0Y3fD7QtfPvFnRRIWIsZ/lfpUzqOq69Cnjqkvt
 xyBMwOewFNqIV7rTkw1lufKVrcKh5VZ13vP1fqovZQh/BufFXJMUV0ONC A==;
X-CSE-ConnectionGUID: VsbcNnqRR+qYbMNBDpMlow==
X-CSE-MsgGUID: G6QDF5AJQKmbYSabi9HFKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43368330"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43368330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:20 -0700
X-CSE-ConnectionGUID: 3pihki6rTUWi/0SHHdn3BA==
X-CSE-MsgGUID: JM6EKTYkTPSYgNe443Q/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70182559"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [CI 01/12] drm/xe/guc: Remove spurious line feed in debug print
Date: Fri, 20 Sep 2024 19:59:11 +0530
Message-Id: <20240920142922.618649-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920142922.618649-1-badal.nilawar@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
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

