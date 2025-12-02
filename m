Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D13D116F5
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C1910E515;
	Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNF+ULC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F2010E512
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643879; x=1796179879;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fqk3jzUQSsDu200DRutvRD8CRxeglpp64WfMWq0hi2s=;
 b=XNF+ULC4iEjrpm8iIvUEoe6BA2JGrvQH8aG35/JqNMmhbf/FTvI5jPW8
 v0KujRibOb0Jo0vpGTHQ4I/p31wuVhrjWRJboy/pNk5FVoKGyyzqwpOJx
 PijctDwGd0ljwLL4mzaYtuQF1LHyvjsc09sGXFVWnRuqq1NLaQ8ofnnWO
 XtaQeKfVXcVCO8Zet4fpEqfHuCw7bjlqfyabcgYQz7/ToqpXDlgfKWgYV
 9MEc+GE7vwWxIpZES0xVIx5qbeASCKfoVWqTJ+12f03+pqjSCVc+Iqo7K
 urt8JVDJ2EgGGIDyuTWsOez/p3kMDLaU72xlAreu0BqJOFiwNMnl7liyz A==;
X-CSE-ConnectionGUID: 5lgg+srIRS6Cww/gGDTGFg==
X-CSE-MsgGUID: 324o6NUHTceSc6KfAfCTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635554"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: yF34fV9BSX64AWjjad12XA==
X-CSE-MsgGUID: DogJ0Sp3QjS/5wsc9rKnxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077384"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/5] OA: More OA and register whitelist changes
Date: Mon,  1 Dec 2025 18:51:10 -0800
Message-ID: <20251202025115.373546-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

v2: Change to Patch 2: Change gt_id to u16 (Matt Brost)

Ashutosh Dixit (5):
  drm/xe/oa: Use explicit struct initialization for struct xe_oa_regs
  drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
  drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit
  drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
  drm/xe/rtp: Whitelist OAM MMIO trigger registers

 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  8 ++++
 drivers/gpu/drm/xe/xe_oa.c            | 49 +++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h      |  1 +
 drivers/gpu/drm/xe/xe_query.c         |  4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 62 +++++++++++++++++----------
 include/uapi/drm/xe_drm.h             |  9 +++-
 6 files changed, 87 insertions(+), 46 deletions(-)

-- 
2.48.1

