Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4593CA0FED
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 20:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFB10E3B0;
	Tue, 26 Aug 2025 20:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de/31fnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBD410E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756241881; x=1787777881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qqtWPKBI6IdPa4Xwv22qzsFsbmIkbncywN5mBLfHtFU=;
 b=de/31fnJJn2GebwVN3sW2XpMQntmGawm72A0TQns0FZNarJm0WKyO3Zk
 UYK2mU7losUqLWeq9kYBGP59zmo+fDL/qWJU0sP2+KSRbxaERwTFM6ayk
 8GDKqHOuNXWNkQTfO9vT8JVUM2iP21LcVEE5onKZVHAlGH2gVlFoDmLmE
 JKt8ZYvpw4CA7X8Z8QqsE74w5g1cbx/mmAke7SkKhVLMg/P5w5RlbQgJY
 AJe9OEJM6BIa/w0/s66/WONyweL/qNus1NevX5HH9ExO0q7co5Dv3d/Nk
 Wm4iiZCV7dmPXfHO9YUBxxlDQ4YkLnq955u8KBsm6YN9MgZwYZ9zlnYVT Q==;
X-CSE-ConnectionGUID: L4eFTLZXS7OtivhBPnC4Ig==
X-CSE-MsgGUID: QbAfVp1ZTquYCmIt5dGkCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58425199"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58425199"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:58:00 -0700
X-CSE-ConnectionGUID: 4buajD6PRkynIkneXw7XBg==
X-CSE-MsgGUID: TdmpRTt1Q6ardsdzBhKvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169583880"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:58:00 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 0/3] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Tue, 26 Aug 2025 20:57:59 +0000
Message-ID: <20250826205758.235606-5-jonathan.cavitt@intel.com>
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

Jonathan Cavitt (3):
  error_injection: Add error_injectable define
  Revert "drm/xe: Add VM bind IOCTL error injection"
  drm/xe/xe_vm: Add error injection support to lock and prep

 drivers/gpu/drm/xe/xe_device.c                |  8 ++--
 drivers/gpu/drm/xe/xe_device_types.h          | 12 -----
 drivers/gpu/drm/xe/xe_exec_queue.c            | 14 +++---
 drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 14 +++---
 drivers/gpu/drm/xe/xe_guc_log.c               |  2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c             |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |  2 +-
 drivers/gpu/drm/xe/xe_oa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                    |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                    | 20 ++-------
 drivers/gpu/drm/xe/xe_sriov.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                  |  8 ++--
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    | 45 ++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h              | 14 ------
 drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |  2 +-
 include/asm-generic/error-injection.h         |  2 +
 26 files changed, 58 insertions(+), 117 deletions(-)

-- 
2.43.0

