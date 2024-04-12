Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6943C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 11:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9377610E90E;
	Fri, 12 Apr 2024 11:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxp1IsH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A8D10E90E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712921570; x=1744457570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DcKsoQG9/mO4diSOAP5l1eWKSd3gWFKXx1pen4e+qpo=;
 b=Uxp1IsH9jkIw77/newkTKJoA8bOoU8HMjl6e+ttK6B2tIQR61G7kmef0
 JdjXhRYQJdtIWzYisdenKU0GUI3e/ke0Iy5E0rFh8CbWcK7V56HeL7AUP
 6A5/TVYeWVzPCwq329OewlDznr/txCr5DU7gPc8CUXzOU5DjD5FFUPG04
 m8irGljWo7sOm0ub2z3A58fhcx5P7EVxwEBnBinvIPnbcmo+IC5miuL7t
 syZxISQZgpCWTiJ7dXAeMAICnPTUebg9hudeFoSWCGaVT0Buvz1nRmLOK
 X4Ck5+LN34a808wq2IxjQsK4S4kNR1NTr9Mo6VJWcxBPyvjAc+TlcEbaE g==;
X-CSE-ConnectionGUID: bbIRj6SaQumL1BGleTKnTQ==
X-CSE-MsgGUID: 3MuPw5EBR6ahXdreM9IP2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11335425"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11335425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:49 -0700
X-CSE-ConnectionGUID: WZWkVwdzTJuWUZLkN15DVg==
X-CSE-MsgGUID: /IRp3oM2TwqcdNqcAL0ttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21272599"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/vm: don't include xe_gt.h
Date: Fri, 12 Apr 2024 12:31:47 +0100
Message-ID: <20240412113144.259426-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412113144.259426-4-matthew.auld@intel.com>
References: <20240412113144.259426-4-matthew.auld@intel.com>
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

clangd complains here, since nothing in xe_gt.h seems to be needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 300d166f412e..35b63512d288 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -27,7 +27,6 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
-- 
2.44.0

