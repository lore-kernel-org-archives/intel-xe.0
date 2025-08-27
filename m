Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4605ECA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B7B10E8AA;
	Wed, 27 Aug 2025 20:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuD1nvlY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA2410E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756325648; x=1787861648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eT66PeErL8qNtdNtoZ8bzOeSHtbDYR+4K+suA5RC+gE=;
 b=fuD1nvlYD4tHd2UQd0FEuqbLV9kbyoBjV6ZErM5F7NJyEULGA+o2xLPQ
 RdmBT39U6/e5TnUpEnifnghQ5Hvva5L/OfEGY9J7mBaiO+lvolISeKG9a
 RyNeeyM6vjcDTQCVkNGmQEEKPx5yAdOJhw9yKM6KBbBlXyNV5m2AfFZAG
 nAEmafs0BG11juEtZY2PMfEI6DQUM5kJby44q282BimEwOWWSFeD7hru4
 X+IF7D5ir0sj0cyj/sG985B9t07zqdXeBXRPb7zL3W7PeVoKIFWRu71ME
 NnC0AGr9R1PYvJ2Zd7IPdJLzT7Isg5YNVv3YUY58rJl2y7uxRHWh6HOrA A==;
X-CSE-ConnectionGUID: Aj2PPgUST82DATPTlLdQjQ==
X-CSE-MsgGUID: 24KRnJabSVeSEU/3IthezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58439694"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58439694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:08 -0700
X-CSE-ConnectionGUID: nW/33uSQRjKhU8o8jeekhA==
X-CSE-MsgGUID: 83t/ZUgzRdyp4yTP3S6+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169221883"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:07 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v5 0/3] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Wed, 27 Aug 2025 20:14:06 +0000
Message-ID: <20250827201405.116855-5-jonathan.cavitt@intel.com>
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

Error injection should use the error injection interface, and should be
decoupled from CONFIG_DRM_XE_DEBUG.  Remove TEST_VM_OPS_ERROR from the
code, and add error injection support to the function
vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
as noinline.

v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
injection is enabled (Brost)

v3: Add error_injectable function attribute (Brost, Harrison)

v4: Modify where error_injectable is defined and used (Brost, Michal)

v5: Update error_injectable descriptions (Michal)

Jonathan Cavitt (3):
  drm/xe: Add error_injectable define
  Revert "drm/xe: Add VM bind IOCTL error injection"
  drm/xe/xe_vm: Add error injection support to lock and prep

 drivers/gpu/drm/xe/xe_device.c                |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h          | 12 --------
 drivers/gpu/drm/xe/xe_exec_queue.c            |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c                  |  1 +
 drivers/gpu/drm/xe/xe_guc.c                   |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c               |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c                | 20 ++++---------
 drivers/gpu/drm/xe/xe_guc_log.c               |  1 +
 drivers/gpu/drm/xe/xe_guc_relay.c             |  1 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c       |  1 +
 drivers/gpu/drm/xe/xe_macros.h                | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c                  |  1 +
 drivers/gpu/drm/xe/xe_oa.c                    |  1 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  2 ++
 drivers/gpu/drm/xe/xe_pm.c                    |  1 +
 drivers/gpu/drm/xe/xe_pt.c                    | 15 ++--------
 drivers/gpu/drm/xe/xe_sriov.c                 |  2 ++
 drivers/gpu/drm/xe/xe_sync.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tuning.c                |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  1 +
 drivers/gpu/drm/xe/xe_vm.c                    | 30 +++++--------------
 drivers/gpu/drm/xe/xe_vm_types.h              | 14 ---------
 drivers/gpu/drm/xe/xe_wa.c                    |  2 ++
 drivers/gpu/drm/xe/xe_wopcm.c                 |  1 +
 26 files changed, 65 insertions(+), 75 deletions(-)

-- 
2.43.0

