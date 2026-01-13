Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92E8D3189D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E238F10E5AD;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StGk5QJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5510E575
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpzIkxsSS4A4ZeJGJombbLngffa6I2QqtkFnHsXLWcM=;
 b=StGk5QJVzfs+0Z8eHJrwqcHYE3+MyMHB6qDx8XJcBAoYctiVjr+9t086
 2K+eGgE7SatHPEpg4VvD+/NcDIE1+gFZbrosAdXNazfsjT7lOWrh+Ee83
 VdzBnge7wcpgQT4XUEJmcl1rs0WhJYOoHJke1HRjuVJg94sXKI1HFoVDs
 vqTWvp0AUxZmMFq3yAb8c8NKvYczRFtgK6YE+jjfznwnZks85R4n0QwUy
 l987Pu6NfWYWX9AJu8oFVWWRGUYk1Ja0IQMd9/GCDpOAlxfE+4JXUOXha
 VNlspkH3m9sIAKjkF9Nit2rAeL00jCG7s8PRIaPN6AVAHBhRJUqvDEyhZ Q==;
X-CSE-ConnectionGUID: QnzitMv0QCiY8vcAfle9rg==
X-CSE-MsgGUID: eRAixgSRQ322wNXNrimWog==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311154"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: SVFV4m4ESL2NqYk+OHQUuw==
X-CSE-MsgGUID: iltdtdalTEyFvGgQOa0JoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147414"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 49/79] drm/xe: Drop unused header in xe_pci.c
Date: Tue, 13 Jan 2026 15:03:54 -0800
Message-ID: <20260113230315.3081153-130-matthew.d.roper@intel.com>
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

xe_pci.c doesn't use anything from xe_macros.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5c705124270e..2c3656126751 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -24,7 +24,6 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_rebar.h"
-- 
2.52.0

