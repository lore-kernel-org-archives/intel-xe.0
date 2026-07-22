Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6751C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809A510E4E7;
	Wed, 22 Jul 2026 21:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWkfAohc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3510E4E7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784757580; x=1816293580;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UFavr8fQpMIWU3oDmENRMU9Ham/DRKzGfMXVUXErVMk=;
 b=HWkfAohc+4xnrmSndQuSw49GDH7L2IQ1FCsvMESARkztQehNm6Ts+X5F
 ORVt/yzZsWOQy8BGGQ34l3s366AL6pk/O7dP30+KrIFxF1+9EVIf8VL8v
 SubabkxhoA1ei3kv9I3dxEVu6MpiIPAE44/+ElY0gzLk2PZnS1Dv1eCmC
 QS5Iy8RSNBosn8IFPqSyRPgznC3DoXkJl4syG/xYu4fb0ohho3a1QhIsC
 c63K0o9i2bhgtYLI2cDpUnhKAj3UdbkEKCaDbHAiqhb2KlHryAVHz1zOu
 73VX+VWNhphZmtA6LntfOSdSedIElcpHaz5KHBLHtJzVJIpbW4p0xx4Er A==;
X-CSE-ConnectionGUID: Yf0l7ildQR6LHS++lpjWsw==
X-CSE-MsgGUID: 68QR+stHQQ6g/S8mAdfEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96064388"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="96064388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:59:40 -0700
X-CSE-ConnectionGUID: ySSJYDRmTsyK7PY5fBLtOg==
X-CSE-MsgGUID: OFZiEH72Q66Ggs5YKeDxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="258905549"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:59:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 0/2] LNL_FLUSH_* enhancements
Date: Wed, 22 Jul 2026 14:59:33 -0700
Message-Id: <20260722215935.1369012-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The LNL_FLUSH_* workaround is a horrid hack that has been papering over
bugs. Let's limit its scope to determine whether it is actually needed
on newer platforms and add more debug information for cases where it
still occurs.

This came up again in the context of this series [1].

Matt

[1] https://patchwork.freedesktop.org/series/170916/ 

Matthew Brost (2):
  drm/xe: Scope LNL_FLUSH_* workaround to affected CPUs, not GPU
    platform
  drm/xe: Add DRM_XE_DEBUG_FLUSH_WA to force the CPU flush workaround on

 drivers/gpu/drm/xe/Kconfig.debug        | 16 ++++++
 drivers/gpu/drm/xe/Makefile             |  1 +
 drivers/gpu/drm/xe/xe_cpu_info.c        | 67 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cpu_info.h        | 13 +++++
 drivers/gpu/drm/xe/xe_device.h          | 35 +++++++++----
 drivers/gpu/drm/xe/xe_device_types.h    | 10 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c          | 56 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h          |  1 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   |  2 +-
 drivers/gpu/drm/xe/xe_pci.c             | 10 ++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 28 +++++++++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  6 ++-
 12 files changed, 228 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_info.c
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_info.h

-- 
2.34.1

