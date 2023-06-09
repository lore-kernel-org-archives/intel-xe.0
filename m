Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA764C7EE37
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A56510E6E0;
	Fri,  9 Jun 2023 18:26:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CB910E0B6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335182; x=1717871182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=okp57uUScFjPK23LElAeJw+LqsOOfxoi33pPvmVhfXo=;
 b=cpsxbdvOcQh/Y+f2F5KDZ284FwFqluGVqctAQHl+dorHbfZJtMgX638k
 yG/sZDwp9Ccp8Jp5ZTvoYfCFga6HuIXPFSuLHVHgtQ79S8zJ1KCbiz0WC
 hY3MtlSVMZ/Uy9+vEujcA3sHhY+eDhBxxfq+ir42oPK5/DDcEne7yfOkq
 nsRcxsU8c64E1mnskhXkLFUuzmMj5OJr8Q8w/h/lA9djEILGgnTrbSDl/
 rRa4wRbx5dg9E26+xPFwnav6BO3ias3SehRLmmk5H9Sf4vmmnFx7jechW
 FHBDPXaogLT8yEn7faAMCJDyX4Rvwo/BjajnHsVel3THyAYdQi8mpZoYL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361019677"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="361019677"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800304998"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="800304998"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  9 Jun 2023 11:26:24 -0700
Message-Id: <20230609182627.143150-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] A rebind fixes
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

This should help with the CI issues we are facing around xe_exec_evict.

Matthew Brost (3):
  drm/xe: Handle unmapped userptr in analyze VM
  drm/xe: Ban a VM if rebind worker hits an error
  drm/xe: Use Xe ordered workqueue for rebind worker

 drivers/gpu/drm/xe/xe_engine.c        |  5 ++++
 drivers/gpu/drm/xe/xe_exec.c          |  2 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c |  2 +-
 drivers/gpu/drm/xe/xe_trace.h         |  5 ++++
 drivers/gpu/drm/xe/xe_vm.c            | 40 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.h            | 16 +++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c    |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h      |  5 ++--
 8 files changed, 63 insertions(+), 14 deletions(-)

-- 
2.34.1

