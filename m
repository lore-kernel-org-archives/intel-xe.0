Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6506EC47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA7610EAB7;
	Thu, 22 Feb 2024 23:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9nymoHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B3010EAAF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 23:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708643971; x=1740179971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Jjx2G6n6eo6/lsZM2BRXb/QYdcdRqNynfSnCNa4wew=;
 b=Z9nymoHn5QddMqHqC+rg5taYTQTXQIDBbqJiACs/dbAZ2vqB6KyZLygb
 zjSM/LxbKu6viHsaoUNTg7biziEeTyAnlNLPvATwc8twKP/ds/TjlR45a
 8bja3d+tWCs8bzcMC+7dH3A9qcfanL9voHsOSRrzGCs254+Kv2DU5+oUH
 0vPWz3iX51x5MJGr5Dm2PxrBhieVFGJdvwoLkQWO1thjk2m0icAgoKzbn
 Pk7kgebA9rqza82efonNw3MnTfvjgKiy6oXf0LTxg6gXBXaqqCXLqyBuH
 2kDtvFlo1F2nwRSuHZDnJkUSpOf4oltG/uaEcWbZugBgT1SjfSShbB5wF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3067681"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3067681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827621143"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="827621143"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/3] Fix execlist mode
Date: Thu, 22 Feb 2024 15:20:18 -0800
Message-Id: <20240222232021.3911545-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

While not supported, execlist mode shouldn't be totally broken either.

Fix execlist mode so some basic tests work without a kernel panic (e.g.
xe_exec_basic.once-basic)

v2: send with correct patches  
v3: Fix in gt tlb invalidation layer

Matthew Brost (3):
  drm/xe: Fix execlist splat
  drm/xe: Cleanup some layering in GGTT
  drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer

 drivers/gpu/drm/xe/regs/xe_guc_regs.h       |  7 +++
 drivers/gpu/drm/xe/xe_execlist.c            |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 37 +++------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 52 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +-
 5 files changed, 66 insertions(+), 34 deletions(-)

-- 
2.34.1

