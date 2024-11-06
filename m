Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3895D44D7F
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A74D10E70C;
	Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kchBFvkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C4910E707
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905992; x=1762441992;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFn0sNi445JMNrOnftJK+luakahi7D/mQ7aIAv6+PZY=;
 b=kchBFvkJK+g760LRDuBy2Ir9ZXE88BTQL4o0txIGIajMyWcyyyoMStGr
 NRigfovdVeXOJqzliheJjnQGfQrdf9WSGKZbt4c3XKw2YptL55Qt2r8VC
 0HNs4k/bUA12uCbZbYGttlOsxgtlyVQI2L8bXwnPE3JURY5Ekh0PnGzat
 hk/KgETbXbM7QG3Ea/K75uJMCmnSvkKCkevtaKPie1CGhvpRgFVFvNAGi
 V4oAY9bKdUkS5hb1hydDwa98G1cOpFdXpqLqTv8aBqdlx/MF9DPawQKF1
 9q6eNgpbf8nqQcYyCVNp8S7X2txZ12WG/8CKnUlrVpyC8gq0JEwAAK5Gy Q==;
X-CSE-ConnectionGUID: Ai/7BR9OSieINNeEHiWHZA==
X-CSE-MsgGUID: xtATae57QguSS9JIUOAs2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867678"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:10 -0800
X-CSE-ConnectionGUID: hWci+MBfSJOeb8KSr8xZkg==
X-CSE-MsgGUID: ntiUePAYQ/yCSdFl3TOTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136781"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 0/5] PF: Add support for VF scheduling priority
Date: Wed,  6 Nov 2024 16:12:56 +0100
Message-Id: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

v2: s/priority/sched_priority (Michal)

Michal Wajdeczko (5):
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
  drm/xe/pf: Add functions to configure VF scheduling priority
  drm/xe/pf: Allow to control scheduling priority using debugfs
  drm/xe/pf: Adjust scheduling priority based on policy change

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 25 +++++-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  2 +
 7 files changed, 124 insertions(+), 3 deletions(-)

-- 
2.43.0

