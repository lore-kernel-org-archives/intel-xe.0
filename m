Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A83CE7AA0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BFC10E10E;
	Thu,  5 Sep 2024 20:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyiKf66y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773C10E051
 for <Intel-Xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725569476; x=1757105476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqglAr8hhuLk3e6jiq/Qqsty+mAIfCCwykV+gvcEj9E=;
 b=MyiKf66yP/Mi3vxkBih8n2fwCFeIEZ48WiLwf44RAwJ5JRIeruaeyvDZ
 o6jHcmWR56Ct54+qhip02qfvqcgoPJqG0V4BGlrcCidkx60pRpzxi4HWj
 PuTIohvwsR+GZdEpK3pVhLH7s/Yjs9f9r4JWH+Qos/cyo9MLZ8j/K37tc
 alz2BNkL77SDF/4UXCcqSHyWsqyoJxgt+Qjt5Od09Xh8rlTgonTqOLRIx
 LEZHzwAidr1vTcA2Y3iW4zqwKRya1oZeReZdOcPZwXUFcrNqMtHuizGfu
 0EkQ3jaYazeRR2dHwcFo3XXgmZscg/owjjyl6hQwk6ojWQrdezDpArPce g==;
X-CSE-ConnectionGUID: naOdWsquQSepN+UpXL6XVQ==
X-CSE-MsgGUID: s6lKhgXCRZKK5eOQzh88vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34982277"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="34982277"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:51:07 -0700
X-CSE-ConnectionGUID: Nio/gfaFTMmVcuaIUdJrCQ==
X-CSE-MsgGUID: rzbWQ9YcRxGfqQmB+rpH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66486747"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 05 Sep 2024 13:51:06 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 01/10] drm/xe/guc: Remove spurious line feed in debug print
Date: Thu,  5 Sep 2024 13:50:56 -0700
Message-ID: <20240905205106.1063091-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
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

