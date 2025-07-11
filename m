Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D53AC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E680A10EAC1;
	Fri, 11 Jul 2025 19:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHTICfh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235B10E3C6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262410; x=1783798410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FA27kau2oiXiAwkHa6VgTC0XtLd5C2v0mJBiKBscoxg=;
 b=bHTICfh9/EukFldt8lrVsMY+XwUEEcr0dPO77Ux5IHm65rKuSrZWqeSR
 IpPS8vbXc/2oYoBIhzysrpL/WKU74yhl/EyAUCgUcBtyZH7AtRakGr7kJ
 /DAy1+U/e4SjYAiBIfE0Migt7BHbruMwUTBZ/9R7dLNxwM3Pk5+FgK1ep
 VxIRYxH5E8eKAU5GA0jgbT17oyUrYak4xryGkOlHtJncojg5uYR/2rRFw
 KNLSip4Mb+8AONA5+A5SBggKWjTAWbcA8l03AjERARdGHBCvATCYgb6TY
 JiAmSyIiDpyBQk6VecBddBxSFVVM1at6zHNhhV4q3sj7Z0gJUUWv1MKEg Q==;
X-CSE-ConnectionGUID: dN4jNEcASFSVZmpbFFiyPA==
X-CSE-MsgGUID: 4tbsZWzeSX6SjQu9uvWccg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651032"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:29 -0700
X-CSE-ConnectionGUID: UrAFOYkxT1iVHG4y50sGAQ==
X-CSE-MsgGUID: njKgSLuvQACUsf+sWeYfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160461987"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 0/6] LMTT invalidation
Date: Fri, 11 Jul 2025 21:33:10 +0200
Message-Id: <20250711193316.1920-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

To be able to invalidate LMTT, GuC must be running in the VGT mode.
To force VGT mode in GuC, we must send at least minimal PF config.
To avoid errors while resending PF config, we need to make sure to
cancel any pending restart work prior to the GT reset.

v1: https://patchwork.freedesktop.org/series/151092/#rev1
v2: https://patchwork.freedesktop.org/series/151092/#rev2
    drop unused num_fences (CI)
v3: https://patchwork.freedesktop.org/series/151092/#rev3
    rebase (drm-tip)
v4:
    cancel restart worker prior reset (Fixes)
    push full PF during restart (Fixes)
    update full PF config with core provisioning
    drop function suffix (Matt)

Michal Wajdeczko (6):
  drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
  drm/xe/pf: Resend PF provisioning after GT reset
  drm/xe/pf: Move GGTT config KLVs encoding to helper
  drm/xe/pf: Force GuC virtualization mode
  drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
  drm/xe/pf: Invalidate LMTT after completing changes

 drivers/gpu/drm/xe/xe_device.h              |   4 +
 drivers/gpu/drm/xe/xe_gt.c                  |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         |  19 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 100 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  34 +++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   1 +
 drivers/gpu/drm/xe/xe_lmtt.c                |  54 +++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h                |   1 +
 9 files changed, 207 insertions(+), 14 deletions(-)

-- 
2.47.1

