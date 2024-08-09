Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC8C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7729D10EA2C;
	Fri,  9 Aug 2024 23:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0A3tTc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812610EA2B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723245168; x=1754781168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=raBgOu6MZQ2awSmFr3iFX8OP3RWg2H9kjP2qaefEaq0=;
 b=X0A3tTc6QZeHzqmduuVUAi1t8dm+U/6EDHXyrT1D2ywC+wBv00P9SbHs
 3ZViSacLvlW82NsYZl1ZqZirtXyJeGQ6yinX7DHFyAawYTRtPWYOpDg6v
 IeD51WzKnzQHdF+jqX7d27rdgHOh3Zt06jrnYa3spUr4Zww/XN5/aBZuu
 YXaKb6vHR9qvHq1DuLVYeOfunJ938+IDx2tIKKX/T+vL+3pU/tfwWhFQ4
 4mKH0j6PwymzGDvalz8IjVSQmcEvj2Z2VBoyfrxQz+HAmXNlmd+bBksk5
 VzBLqubFnn9MfCeJWAq930g6Nsz5sAgCVjDFwrm/rAnpECXGO+PaOs7ck w==;
X-CSE-ConnectionGUID: Yr+NVg/DQdur5Ih/mRzaKg==
X-CSE-MsgGUID: VbHN9Tr8Thi6L3sBnHTIig==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32845943"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32845943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:47 -0700
X-CSE-ConnectionGUID: pZw6Psq4SYOMBoad+eX1Yw==
X-CSE-MsgGUID: 66C8iZy2Q5qgLeNJt8cJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62107092"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 0/3] uC-related drmm vs devm fixes
Date: Fri,  9 Aug 2024 16:12:34 -0700
Message-ID: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

If HW access is required for cleaning up a resource, we need to use devm
callbacks instead of drmm ones, otherwise the HW might already be gone
by the time the cleanup function is called.

The first patch in the series fixes the managed_bo callback, which is
not uC-specific but it is used to clean up the uC objects. The second
and third patch fix cleanup of BOs and exec_queues in uC code.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe: use devm instead of drmm for managed bo
  drm/xe/uc: Use managed bo for HuC and GSC objects
  drm/xe/uc: Use devm to register cleanup that includes exec_queues

 drivers/gpu/drm/xe/xe_bo.c         |  6 ++---
 drivers/gpu/drm/xe/xe_gsc.c        | 16 +++++--------
 drivers/gpu/drm/xe/xe_gsc_proxy.c  | 36 +++++-------------------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++--
 drivers/gpu/drm/xe/xe_huc.c        | 19 +++++-----------
 5 files changed, 21 insertions(+), 60 deletions(-)

-- 
2.43.0

