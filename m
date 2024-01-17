Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 18:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0E510E78E;
	Wed, 17 Jan 2024 18:26:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F5810E78B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705516015; x=1737052015;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zei+7OMXIkN6ySvj4aDl87NinFrffe9DTQOMu2SeWII=;
 b=Novjr31qaRqKjQeJycXwFtsVNFr99lgBijmVcDLH84vimFidvpT8kRPp
 Gt60yJypohmlyMAmoX+2GzDHYl3wfzgJIv3L3x7CC2HNA6P2EwDcWLPwu
 TEOYRm7X5LiIc5gYNrs0FB4hAjwLd7RDtCKFgd5bxwdJU986PsolD2j5b
 ROXeS2GiIhV1XTl3nk1rEUrUtXeSPiAzJhKBtiSg21sh9fLK7J2RQ/ruE
 moQOAaDgM4Vh/vAOW+iBa3+Z2pqPZE51dof9a/isWk8VmOezrmXrDOIKP
 Pyc+2QygbNNNAauYBlt3QCSG/IdqgQhbmjCpfRDH4O8WurJG48isaT+xL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="6943246"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6943246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 10:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="92085"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 10:26:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/2] drm/xe: GSC proxy support
Date: Wed, 17 Jan 2024 10:26:18 -0800
Message-ID: <20240117182621.2653049-1-daniele.ceraolospurio@intel.com>
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

The GSC uC needs to communicate with the CSME to perform certain
operations. Since the GSC can't perform this communication directly on
platforms where it is integrated in GT, the graphics driver needs to
transfer the messages from GSC to CSME and back.
Since the CSME is controlled by the mei driver, we need to use a mei
component to communicate with it.

Re-sending for CI to make sure the docs compile correctly after fixing a
typo in a variable name.

Daniele Ceraolo Spurio (2):
  drm/xe/gsc: Initialize GSC proxy
  drm/xe/gsc: add support for GSC proxy interrupt

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/gsc_proxy_commands_abi.h   |  44 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  22 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  66 ++-
 drivers/gpu/drm/xe/xe_gsc.h                   |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c             | 537 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h             |  20 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            |  13 +
 drivers/gpu/drm/xe/xe_gsc_submit.h            |   1 +
 drivers/gpu/drm/xe/xe_gsc_types.h             |  33 ++
 drivers/gpu/drm/xe/xe_gt.c                    |  13 +
 drivers/gpu/drm/xe/xe_gt.h                    |   1 +
 drivers/gpu/drm/xe/xe_irq.c                   |  44 +-
 drivers/gpu/drm/xe/xe_uc.c                    |  14 +
 drivers/gpu/drm/xe/xe_uc.h                    |   1 +
 16 files changed, 790 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_proxy.h

-- 
2.43.0

