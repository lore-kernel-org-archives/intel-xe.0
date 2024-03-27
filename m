Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E3C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 20:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5E10FFFF;
	Wed, 27 Mar 2024 20:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZlDIdE6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F4510FFFF
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711572045; x=1743108045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AA616fwFD2EchGUsWUdPa5npqC2UzbntOOXymjCKME4=;
 b=gZlDIdE67MVsXW4+GbB09EAY3Xn5eTU44xy+rJXlVCAWboFuXe60SoYF
 zWHDqdxtpAoonWO8eZav8ecA4/5J+vH32vnA7X/YvJUY10huFk6pFfMXi
 n1Mv4rUdHJPrHE7JSkcLJctlThRKDmwNXblURyFKCLJ1Hqh7R6qOuefb3
 Im6lB3O5wRDmMxDNfzJdn6yB+Mi2qliXnW04HWlm/pz5vWUl4GHKL4yDO
 0NwoEMf/xMMUG7iUhQQZJi6WRw12UKqoSzUVRFLOY/3/G85zEQRaTKlzu
 1yTQVYL+jicDfh/7n7jqone6BqOsnGlOZxluFcHT3StBgR/eXPS0NC4aP g==;
X-CSE-ConnectionGUID: qG8gJwpwR92rKNYO1a3ngA==
X-CSE-MsgGUID: roxfWBQ4RGmZ0rFjRFXkGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="29182152"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="29182152"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="21109764"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 27 Mar 2024 13:40:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: [PATCH v7 0/7] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Wed, 27 Mar 2024 13:40:34 -0700
Message-Id: <20240327204041.178879-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Port GuC based register capture for error capture from i915 to Xe.

There are 3 parts inside:
. Prepare for capture registers
    There is a bo create at guc ads init time, that is very early
    and engi  ne map is not ready, make it hard to calculate the
    capture buffer size, new function created for worst case size
    caluation. Other than that, this part basically follows the i915
    design.
. Process capture notification message
    Basically follows i915 design
. Sysfs command process.
    Xe switched to devcoredump, adopted command line process with
    captured node list.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Changes from prior revs:
  v7:-  Kconfig CONFIG_DRM_XE_CAPTURE_ERROR removed
  v6:-  Change hardcoded register snapshot fill to follow mapping tables
        When capture is empty, take snapshot from engine
  v5:-  Split dss helper code out as an standalone patch
        Remove old platform registers definition.
        Split register map table to 32 and 64bit each
  v4:-  Move register map table to xe_hw_engine.c
  v3:-  Remove condition compilation in code
  v2:-  Split into multiple chunks

Zhanjun Dong (7):
  drm/xe/guc: Update GuC ADS size for error capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Check sizing of guc_capture output
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Pre-allocate output nodes for extraction
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |    5 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_guc.c              |    6 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  208 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1313 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   21 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  249 ++--
 drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  117 +-
 21 files changed, 2358 insertions(+), 115 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

