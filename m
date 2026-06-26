Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E118CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818F10F56B;
	Fri, 26 Jun 2026 11:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGO33Y5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1DD10F572
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472546; x=1814008546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vyP3eJcKIhx7h6s03qZMYj8k3IWC4BF6bDw5bZNFRPU=;
 b=nGO33Y5z66tmnkLWuUKX9/b2r9Fq+LMtzWHA8l/0HwnZyqoxRhxOHxWL
 VQbZaBV59v7xAmawH+tTFZ2ekhEyYJhzOQ6kkNAIuDOF5lrRN+r0eX0xl
 LZj2QaIwrk7V1IvLOQfqa7UOJtJLT1dLHp/J6eyAbQobksoZ93uC2WQRO
 TThmtHC1IDs9piwc4LWvkRrq1aYtFbVd/Iq17w44ITXiy52IpsJp0NjAO
 8MNEeplU5EigW/ccXMBgvJMJLztfL66C2eZNE2GUD13sK7CuZeIi8183Y
 /c2jfIbhCmJ9gfo+EekDxj60os1QB1gHDaC3dR/KTGJIjbld9nD4GWjxy A==;
X-CSE-ConnectionGUID: u8WqvrnYSHK9m6I7Vsk5UA==
X-CSE-MsgGUID: hFA1dJBlTlqDVol/voFR3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100695001"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100695001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:46 -0700
X-CSE-ConnectionGUID: KZTdex6AQZWS/YAMvkMYlg==
X-CSE-MsgGUID: gmKjrxV+SrS1W6Lz6hh0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214373"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v7 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Fri, 26 Jun 2026 12:15:31 +0100
Message-ID: <20260626111520.487997-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626111520.487997-12-matthew.auld@intel.com>
References: <20260626111520.487997-12-matthew.auld@intel.com>
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

NVL-S with latest GuC should be the first platform combo to
support the special GUC_PAGING_CLASS feature.

v2:
  - Update with the final GuC version
v3:
  - Split VF vs PF versioning. Which is recommendation from GuC side.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 244943843018..feae2d4f4482 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1863,8 +1863,8 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	if (IS_SRIOV_VF(xe))
 		return xe_gt_sriov_vf_paging_engines(gt);
 
-	/* TODO: Have some way to query this from the GuC? */
-	return false;
+	return xe->info.platform >= XE_NOVALAKE_S &&
+	       GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 69, 0);
 }
 
 /**
-- 
2.54.0

