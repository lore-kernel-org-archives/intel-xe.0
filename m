Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF7C7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5519310E5E9;
	Wed, 28 Aug 2024 21:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM8Y+3OA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0565A10E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724879331; x=1756415331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VHfl5FzwgIAS5Um1ZRZFXEMxjygNlfvD/FW9HuJ/LW0=;
 b=YM8Y+3OA5nfyALcGBZaGvUmgP+Hlq982V8J2A2o59al8V9g/TBZOniRT
 8wGgYJxu2QgU5r1mpwPmvGQZ9t+iwQzoeYmVSCdpW5mX74MtHVb2zgMR1
 qRfWVoETP8/1J2BxmG6Cz4+bI08KWPeJ2r+rGIEGCkHZkqd+I/LxavElX
 FybZJZfFA4AEmmrAim8nmL/hLBduxrmEb3FNyVZgbralkDqnyKLgJfJIj
 NHS8fnOaorP4OKTyoCkRzaenKxPwJEOTffKvlLevdrE59MSIJO1OlptuM
 KeSqr0ZULze9X1pbCv/wpQXduzIGnPlkAT9paRnHEYpxa+6Rcze4StmJn A==;
X-CSE-ConnectionGUID: FZApfcrDSCCmEK/EtAYV1A==
X-CSE-MsgGUID: wYPG/gu8Qu6B3CncxjR2QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23626033"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23626033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:51 -0700
X-CSE-ConnectionGUID: gkOcJPCXSly2ns5WlGCxTQ==
X-CSE-MsgGUID: fpZhL22QQCuwZkfkUfFz9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67720219"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/4] PF: Improve VF control
Date: Wed, 28 Aug 2024 23:08:05 +0200
Message-Id: <20240828210809.1528-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/137095/
v2: rebased (xe_migrate_clear, xe_ggtt_node)
    fix duplicated functions calls (Piotr)
    put RESUMED state on the main diagram (Piotr)
    fix missed use of default timeout helper (Piotr)
    increase severity of the FLR timedout message (Piotr)
    review KUnit changes in kunit (Lucas)

Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

Michal Wajdeczko (4):
  drm/xe/pf: Add function to sanitize VF resources
  drm/xe/pf: Fix documentation formatting
  drm/xe/pf: Drop GuC notifications for non-existing VF
  drm/xe/pf: Improve VF control

 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   82 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |    1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1258 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  107 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
 7 files changed, 1422 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h

-- 
2.43.0

