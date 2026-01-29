Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11547D73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7310E19D;
	Thu, 29 Jan 2026 23:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYs9UYE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5510E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769730098; x=1801266098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWcTjpi1KnnNIfOprbMWqKfei1pxItRBp9/aBf3loHU=;
 b=BYs9UYE53Kuk++cWX9KGzsYQ/o4dQdHth4ts4SAmF5ge3JKD3KbVJfj/
 5jTi8zzBkVZif9D4qrRxsVWAynwY6GaW9kMFSiky9+IV5HwwyhdUvQDsi
 RvFcSJtvOvmPlo9/rUJESCfHmL7nhSovly0uXRalIyWDI4SOJQuNOcHRN
 KeZeU6/H0Lo6UwMxizxrEsuGNU1uL/QnOb1Thd4N/KGjhMVyKN1tSXSlT
 kD4nwenJqTvJPgUjPiwt85rpNMm2E0yTZNLC3TA1z3awXILsXnEExs+uH
 DrFpYyh0BgE3QReura23+PEQ7KN6amYRyRA8C+69sgnjhMbdrcxWpDzpf Q==;
X-CSE-ConnectionGUID: rm4c43YmRzmD59DGQ1e5bw==
X-CSE-MsgGUID: uokOfYUHRXmdmUm8n8ONIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58560066"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="58560066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:41:38 -0800
X-CSE-ConnectionGUID: PL0KNLVHSDKaDRhkxxxGtA==
X-CSE-MsgGUID: GsC630foTyW1CyNUmgO2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213201733"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 15:41:37 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/3] Fix warning of kerneldoc
Date: Thu, 29 Jan 2026 23:38:35 +0000
Message-ID: <20260129233834.419977-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

v2: add () for xe_gt_tlb_inval_init_early. (Michal)

Shuicheng Lin (3):
  drm/xe: Fix kerneldoc for xe_migrate_exec_queue
  drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
  drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

 drivers/gpu/drm/xe/xe_migrate.c       | 2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c     | 2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.50.1

