Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665EACF9C69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 22:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF66D10E876;
	Fri, 20 Sep 2024 22:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbQwmFa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A610E873
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726871369; x=1758407369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wdw/DOXNVc3m3shwGe0SGRJggCKHLmsa7CxxwwMvJFw=;
 b=SbQwmFa6nISZfXHp5O2z+RWPMoK2UtuN7FSuA5wCOU8lFbw4EbdfvUWL
 4a8TbA2zXrQGEshMuBzsn5rNJiYlL7+w5f9EthIe/YFG1XLTo6XayHJ7v
 j90Oj4EQilbUko6X5d6RIdvDlrBkRj56CFSc44YlX21XLfD0gxqUPcvCi
 52uWPuTaulOG2VpKB6R0ja1sfQZP82mcCTNw8Gm2O9eBLinlKX1PfNl9D
 eAfuIRTMne6HwIIzdoBvKQXMLpJrBqxChFiUge30MiYnLMfLSpt7h9+nV
 zcB5cfOrW/5EgdvcJlJsrpkXk2QkFr58AXkS1STam1aA8V9ZJWy20+wCh Q==;
X-CSE-ConnectionGUID: ZNJWk1wnQD6epIx2Xm+S/g==
X-CSE-MsgGUID: 8nXPwCugSoCpT3ASfJRfYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13616064"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="13616064"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 15:29:28 -0700
X-CSE-ConnectionGUID: zxAXvxHdQj+mg8g2tH98Pw==
X-CSE-MsgGUID: /xuHBuLnRpmTHAmMtVgY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70328084"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 15:29:27 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] drm/xe/vf: Post-migration recovery worker basis
Date: Sat, 21 Sep 2024 00:29:22 +0200
Message-Id: <20240920222926.846985-1-tomasz.lis@intel.com>
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

Tomasz Lis (4):
  drm/xe/vf: React to MIGRATED interrupt
  drm/xe/vf: Send RESFIX_DONE message at end of VF restore
  drm/xe/vf: Start post-migration fixups with GuC MMIO handshake
  drm/xe/vf: Defer fixups if migrated twice fast

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 ++++
 drivers/gpu/drm/xe/xe_device_types.h          |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  33 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   3 +
 drivers/gpu/drm/xe/xe_memirq.c                |   3 +
 drivers/gpu/drm/xe/xe_sriov.c                 |  15 ++
 drivers/gpu/drm/xe/xe_sriov.h                 |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |   6 +
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 170 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h              |  17 ++
 12 files changed, 289 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

-- 
2.25.1

