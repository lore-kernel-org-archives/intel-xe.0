Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28088D30CFD
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627C410E57B;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+o3bMgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C739C10E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUFfKzKZBQz8y4AVI1oCihkh4TI39QrawjICS1EKPgM=;
 b=A+o3bMgDOL57lT/kEwrCZ5KayOjCoCszTPU4Hnl8zBiRWIv1ASGFZVGj
 Pvvh3oXkcvRk4hQVcWl0X5A500JEMrIo6E7QVL0uJzudMft+5/sA8Th9u
 gdVAGhBgrO6yhIU6hfw/TGc2gehrUpcZdQE4kB/JZEWZWFlEv3w7codND
 6+vAGSYfWD33yQv+vBDHCYqvt3VLDLxSlpeDpyTFlpJF3mLCstPBvjBpu
 LurmoP3KwO9yyYkkDlF4FPMoKUqhyq62T1GtR0SJlVrtaEonO9wx6n2rE
 zMdjUO0b2hUPVa5u6j/sz25jIKGRA0bDEZFZNXajXuPvwQ+cZ2dr+LgtD Q==;
X-CSE-ConnectionGUID: YIkEyVOLSBWKJ3eKAh7/YA==
X-CSE-MsgGUID: ZjpiZm8HReyy1uCk1u0z5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311142"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: 9SlvJ44gTReKWki+UAsxTA==
X-CSE-MsgGUID: 9jYdFuBtSDi6kUNm7aTNNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147387"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 37/79] drm/xe: Drop unused header in xe_hw_engine.c
Date: Tue, 13 Jan 2026 15:03:42 -0800
Message-ID: <20260113230315.3081153-118-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_hw_engine.c doesn't use anything from xe_macros.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 6a9e2a4272dd..4d3ee5226e3a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -33,7 +33,6 @@
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
-- 
2.52.0

