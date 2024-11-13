Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98801D637A3
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5410E05E;
	Wed, 13 Nov 2024 17:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kutq2hxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389610E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731519933; x=1763055933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vdy23o3RIPyImBSMJulNFu5+fUpRTDv+0F7Bo8MKq/U=;
 b=kutq2hxb39T7n2dycacS0JQVXjh05yfvlJ3LAAkX3vxvfkUosjVfCyZL
 B419sp5eecSJquBU9oGhOwKi6PHf2OYeJGxYBCtgFq1vfX/A+dO2t8NLH
 b8GvmmS4rawrAn9UK8q4xQYUQZS0GYjCzxEQWhe2Kb5YM2/2ANKQhKlSZ
 LHvftUGuaMSnQd9gs4A6C04UYgSCbBhTOcr30jv62dyeQACK+n4IaCxuA
 3nSEv98cB4eX0a5IdHrgKDULA+ZtqSe+/jvF1f/rVJlGiYQyjvKXk07dI
 zh5if1NEvDpa/n3aRrLID/Y2u71eAngVG5BPb4kRBUZJv+SPcCANcLto/ A==;
X-CSE-ConnectionGUID: pwTbmm0VQUWRpJ/LQY5K6w==
X-CSE-MsgGUID: JM15zTnZSbudHJPtFwdJzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53970845"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53970845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:45:32 -0800
X-CSE-ConnectionGUID: fFOQ5KPpRDGS2AE5Vh2rzg==
X-CSE-MsgGUID: G8a7p28oQWKZMFkhkpPImA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118754305"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 09:45:32 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 0/3] drm/xe/pmu: PMU interface for Xe
Date: Wed, 13 Nov 2024 09:42:39 -0800
Message-Id: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and C6 residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |    2 +
 drivers/gpu/drm/xe/xe_device.c       |    6 +
 drivers/gpu/drm/xe/xe_device_types.h |    4 +
 drivers/gpu/drm/xe/xe_gt.c           |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |    1 +
 drivers/gpu/drm/xe/xe_module.c       |    5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 1044 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  155 ++++
 10 files changed, 1263 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

