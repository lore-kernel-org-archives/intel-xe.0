Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49CD1BDF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 21:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521C510E4D9;
	Mon,  4 Nov 2024 21:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDe/ewR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE3910E4D9
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730756092; x=1762292092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ALvxx5PHbsfumpAdKDXQs2DgEZ9GXfg5x7b2ByWuHzI=;
 b=EDe/ewR7HRI2IaEsPYqlShnldoyYgES/zQ797Rx0rL0mECLm/120xDb7
 BvmGlmC5nNKlYIzJBF7UiFUS49tP0H9+HiKToKBuEAAK7X8ydXTcDuBoV
 6nxOww6WIs8E+0mMja+sTacO5Iv3jn/Nkk7okD8diKqSkGCgZdC1C6uNj
 OFdGbor8fvyBaPWI0L1TWyM5hP1ZphpG9eaImFHLi1MrqxqsJTSaD3W+O
 afFEkV3PP43FhaGXqxk04WzYyVOKZyzVUgRt1HUrBXiTlM7Dfg0PNVxZt
 drduf+E66G/JTW15q9BC8K4l6opAGZGwDCSY2zWHiXz/zGDMvpKl7X8+z A==;
X-CSE-ConnectionGUID: qVUPDtwwS9O5flUZAVkpBQ==
X-CSE-MsgGUID: WbJuUH/bS3CBm8hFmSFWBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30638516"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30638516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:34:52 -0800
X-CSE-ConnectionGUID: TXkK66aqQVCvo53dCl3kng==
X-CSE-MsgGUID: LmXHnulWT7qFxl8+DVv7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84208430"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 13:34:52 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v6 0/5] drm/xe/vf: Post-migration recovery worker basis
Date: Mon,  4 Nov 2024 22:34:44 +0100
Message-Id: <20241104213449.1455694-1-tomasz.lis@intel.com>
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
v6: Improved documentation patch, updated one debug message

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
 drivers/gpu/drm/xe/xe_sriov_vf.h              | 121 ++++++++++++++
 11 files changed, 419 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

