Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D25D68BDA
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 01:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4771910E056;
	Sat, 16 Nov 2024 01:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9QNi02J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242AA10E056
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Nov 2024 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731720479; x=1763256479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EdQVTn0Xdhi+J+AH1Liik8NVr4s1oc2zyy5RMcVAzC4=;
 b=B9QNi02Jeo+XP2XDC1v/T3TAAL+IfnlKaVpPD+9CLBT8M86d4ZPPO6hj
 KIPgb5jkKdbRQGBxTNIagjoA7FM0gmENMZXZ49cWZ4WtpJ6NE6UvWFeCE
 1zbmErwYimiryd/YbcrswvYmh3SaDwHdg+w2jgkygrCVfcx55twn+tAir
 Vu76d8O+/yvmiKaYkl+zN2eDSIJsji1TPKVdc+zRafNhOKe8jDPyH37U1
 SpX5dqN5vaFOdZTvUMvdgIXxNCgirS9HVi4Q2C2Z4C/fSUZZHjMHAseJ6
 AfGrRP1TXXIkgFhDiBlctcYm1GOciV5JTA64guumCLfrk11J9xeag9FwD Q==;
X-CSE-ConnectionGUID: hgX/rgzmQmqxlGpeK7eF0Q==
X-CSE-MsgGUID: cjmnMrmeRT+kl5aq4PIfOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31690759"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31690759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 17:27:58 -0800
X-CSE-ConnectionGUID: m7SMWEJaS/qexp9TkxOYfQ==
X-CSE-MsgGUID: aRfN7VlmSDqi4kXIMXFUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="93556873"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2024 17:27:55 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/3] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Sat, 16 Nov 2024 02:27:52 +0100
Message-Id: <20241116012755.2297439-1-tomasz.lis@intel.com>
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

This series adds two fixup functions to the recovery worker:
* for fixing drm_mm nodes which represent GGTT allocations
* for fixing content of outgoing CTB buffer

Tomasz Lis (3):
  drm/drm_mm: Safe macro for iterating through nodes in range
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 177 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 144 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  26 ++++
 include/drm/drm_mm.h                      |  19 +++
 7 files changed, 371 insertions(+)

-- 
2.25.1

