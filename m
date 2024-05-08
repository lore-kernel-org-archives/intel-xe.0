Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A2C25B4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 22:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B295113253;
	Wed,  8 May 2024 22:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuedBy8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3B113252
 for <Intel-Xe@lists.freedesktop.org>; Wed,  8 May 2024 22:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715208570; x=1746744570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vj3jk+84NNlPEJ2atrqbkF5D2AXDqUGjqqXae7bH5dA=;
 b=DuedBy8z9/WQooAuDIzGTSfrktxDTq4toNnOiHVGjPIrRTBmdd3lEuYT
 9OlhN8M49XxFJIK8nI5E9ON2qvnOBSFeheHm+crUgTQsQXraCoU9/rfHA
 sbFSzJ1lLjn7k0glmTloMs6hfw+rzjeztu0IK2jOIigauFX1hzdHtJFSx
 oNd9jN91hgFgOrGlI5NeuC9UnnljCY26DmYfPb581aC8dWdTkoQ0JGC3b
 P2Y4k2QziEVAr+ep8sP5P0QetndrL1upXeiWeKO7adPL/OqRGRIGBnBmd
 SE6fU8u5Eqz1rctuTUWbpmDwuRuBNARj4RlZSPEmpZW4bzO0ptPrza3aa w==;
X-CSE-ConnectionGUID: +u6Bpa0mTdilv2QbBGRS+A==
X-CSE-MsgGUID: RbYraFxdR0y6JCcJ9A+RTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10938733"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="10938733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 15:49:28 -0700
X-CSE-ConnectionGUID: 630P9l1ZTZ6uubL1X7iNMA==
X-CSE-MsgGUID: 4Yb5I2phSQqEBX0tkWM82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33565756"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 15:49:27 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 1/2] drm/xe/guc: Remove spurious line feed in debug print
Date: Wed,  8 May 2024 15:49:26 -0700
Message-ID: <20240508224927.11341-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508224927.11341-1-John.C.Harrison@Intel.com>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
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

