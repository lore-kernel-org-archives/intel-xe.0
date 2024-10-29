Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620DBD3A696
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CB810E060;
	Tue, 29 Oct 2024 19:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5AZRixO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A21610E060
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230800; x=1761766800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hz8w++bBpKhEWBH54Gp9+Mv4wtVwC6f5AUJuSL0PMHM=;
 b=F5AZRixOUWKhUYRwufJUsM/Bs94tsnNf2LgZZ3NIb0tWhIT2Dso+WqRY
 sqYLmHDsb58Smz0Dfr30tXumSALMXmu1tF4tfSELVDHmVRqeeuo+MmJFM
 78FwDXj0SJiUMDiV5LpisXALMQzDlMgiZy+rT02/wJrhOE8unt863DDhd
 a4Y0mB3Oi8rsbTwjLhFbzRy5v/zZDH62VB2F06koZ/ekqzxoNjZTrXTcy
 YB5eXmel+LN35r4hwhm1/6v/+cG1GqvWpunIUmwtEjOkf932oMvcRBT9i
 fgp249LGRXZ+s98ElwclLjba/gk6wvnDzHru0HfOY9hRGRPSJdzOkPAko A==;
X-CSE-ConnectionGUID: kWYfAePLRl6stH8sSi+43w==
X-CSE-MsgGUID: ONbHVJuLQRmsRssAVrWtWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17537295"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17537295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:39:59 -0700
X-CSE-ConnectionGUID: 4cC3xvaNQfOTQKgAAWkLsw==
X-CSE-MsgGUID: AGdyyhGQQd+Lmh/4PpJntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81996499"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 12:39:59 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v5 0/5] drm/xe/vf: Post-migration recovery worker basis
Date: Tue, 29 Oct 2024 20:39:51 +0100
Message-Id: <20241029193956.1043614-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

To support VF Migration, it is necessary to do fixups to any
non-virtualized resources. These fixups need to be applied within
VM, on the KMD working with VF.

This series introduces a post-migration recovery worker, executed
after migration to perform fixups.

Specific fixups will be added later in further series.

v2: renamed and moved functions, updated logged messages, removed
  unused includes, used anon struct, keeping pm ref during whole
  recovery, skip handshake, style fixes (Michal)
v3: ordering, kerneldoc, asserts, debug messages, on_all_tiles ->
  on_all_gts, switched 'err' and 'ret'  (Michal)
v4: fixed missing header include in one patch
v5: Explained what fixups are, explained which IRQ is used, style
  fixes, assert to separate patch, debug message per GuC instead
  of one, comments changes (Michal)

Tomasz Lis (5):
  drm/xe/vf: React to MIGRATED interrupt
  drm/xe/vf: Document SRIOV VF restore flow
  drm/xe/vf: Send RESFIX_DONE message at end of VF restore
  drm/xe/vf: Start post-migration fixups with provisinoning query
  drm/xe/vf: Defer fixups if migrated twice fast

 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  63 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |  11 ++
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  17 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 156 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h              | 107 ++++++++++++
 11 files changed, 405 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

