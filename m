Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28744C25B4F
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDE10E28D;
	Sun, 12 May 2024 15:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMrdtm5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132210E28D
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528967; x=1747064967;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LG102nLYOXfqHt4GA9Wf44Ea/am9H0Hi+tC5RPjOFGE=;
 b=fMrdtm5ii8pDNMfvxfoX4OOLqOQ5FP+uEs9UZG00gPUo79dFglAL6CwG
 pn7SdlCLPfKDQAi5q3z66daFTxhXd9Gg70lr8CkXuz4cV1fiTB8aoO+UM
 dAYi8L7JI09J0aUB5gohU+dsNFSxmVjbK4CjC+HUtuT1ZO7UVq0X7JhfU
 jSUmaAuCNrWPN3wXY0psql+qdYcKzP9kn0i//n24KCP0aLSv960JE5KkY
 K3Dj3aKNrqXcYx4H8aFRmv2rKG+kDKck5IGAx77vLQ6ErQi6Imb33soK3
 Ikp8Sz9ni8FgeXT+gkzqhASQdDfmEY79y+afsuVFL9c1njllNLlt/xH3a A==;
X-CSE-ConnectionGUID: BZWfzTKRS9aMSnbfaIH5zA==
X-CSE-MsgGUID: Z5JQhjceQWagCWNgEVumBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039939"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:26 -0700
X-CSE-ConnectionGUID: lGWO8Yc1T+urwNVv2SWlWQ==
X-CSE-MsgGUID: odxzVF10QSOvkuwBrFs+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332478"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] Add support for VF to query its configuration
Date: Sun, 12 May 2024 17:49:09 +0200
Message-Id: <20240512154915.2040-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (6):
  drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
  drm/xe/guc: Add VF2GUC_VF_RESET to ABI
  drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
  drm/xe/vf: Add support for VF to query its configuration
  drm/xe/vf: Custom hardware config load step if VF
  drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs

 drivers/gpu/drm/xe/Makefile                   |   2 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 160 ++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 747 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  23 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  72 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h   |  14 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  82 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
 drivers/gpu/drm/xe/xe_guc.c                   |  36 +
 10 files changed, 1142 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h

-- 
2.43.0

