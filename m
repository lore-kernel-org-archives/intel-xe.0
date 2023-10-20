Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27195C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 09:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEB610E0EB;
	Fri, 20 Oct 2023 09:55:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBFB10E0EB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697795742; x=1729331742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GFx3BxO8q+NoegGml1ue1Mib/+oHCTR5/j1igeXC23U=;
 b=PKp+7+QCbzBOkPDXNTiuRjk+86OplvRE12fbji30tNGJdlODjbPYb4MT
 ikAUlCKWSCuvocvRf7ieOipz2qn8RCHUOosHLykrb4XSr1hCF73K5/pVQ
 N5p8f9QLpz1LOlmEvQdJNfXy24nWQBHcN7arFvrFFPgtdD0ZpVLqqtswz
 ZDBXI7t9JzfmEYbgU30HLUFWqQD8LeOClsNv5W0Bach2k0l0xmo4/pPpf
 eP/L88DC9G4h1FNOVPZZDY2Mpu7xgZROVbHcA0HD+fZwOpgV/osvUqn9j
 z3puTRFQaXHZI3mvU5yIdEfXQ8vPT1PIrsc1vGCOJvVOEtV3w/ZaOHBm6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385344008"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385344008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 02:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707185117"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="707185117"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 02:55:20 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:33:51 +0530
Message-Id: <20231020100352.1974990-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V9 0/1] drm/xe: Count and report low level driver
 errors
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
Cc: Vishwanathapura@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds low level driver error counter. Devided
into below patches:
1. Add APIs to count different category of errors under Tile and GT
2. Add counter increment at all existing error tap points

Focus is not to add new error checks but maintain counter for errors
on existing errors which can create performance impact.

TODO: Later on when netlink interface is ready, we will export these
counters through netlink interface.

Tejas Upadhyay (1):
  drm/xe: Introduce and update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
 drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
 drivers/gpu/drm/xe/xe_guc.c                 |  9 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 12 ++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          |  5 ++-
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 13 files changed, 183 insertions(+), 49 deletions(-)

-- 
2.25.1

