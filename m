Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD8C87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FB410E309;
	Sun, 27 Jul 2025 17:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APxCP2Sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0881E10E309
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636819; x=1785172819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a474n0U4sUM/O05qSAf0BTRA9x7akpG5ReyVKpfPKKA=;
 b=APxCP2SgAqqsmLUKxUIm0QH4NIcJZgktUGYVP7iuryjefpncZi7K51eT
 fQo6Lp2hSaDaSDvZ3+8sn78a5DI6il6/LFtPIKTHLpiBt22UK6E7zqufQ
 7OgPdSODViF9zon97jOlSPhy0+iv6veuz3XF1C8qvkoN2Uzfez7iBeO/R
 LnbovlUrFZ1nwZk1H8ZUYjQZwkd8tCGio7UQdgLtKFYbiT6t1vP0/8q4B
 g2E1xxvwxGwN5cCzNBRV2yvHjYgMI51RdJylJJIw5XCk4UwEMXaij6WP2
 t8z/seIXIL2BjWXy+AG6nHrsL6w+eIrzo9HADNoGkFWaC6SsI4wuuUDk9 A==;
X-CSE-ConnectionGUID: Gk4xrMdOQ+KWzXWhamlxhQ==
X-CSE-MsgGUID: Cy6pXT8mRZGp2oRiWTRabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046718"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:19 -0700
X-CSE-ConnectionGUID: /mFnBV+mQkCYzAtKGwbDSg==
X-CSE-MsgGUID: 4voOPze0SOSDD4T88oNp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556810"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 00/11] Updates for drm/xe/configfs
Date: Sun, 27 Jul 2025 19:19:57 +0200
Message-ID: <20250727172009.587-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

v3: https://patchwork.freedesktop.org/series/151773/#rev4
v4: rebased (as patches 1-3 from v3 were already merged)
    cleanup su_mutex and use it everywhere
    add placeholder for default settings
    simplify code in xe_init
    fix checks for existing config
    fix wrong pdev put/get

Michal Wajdeczko (11):
  drm/xe: Simplify module initialization code
  drm/xe: Print module init abort code
  drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
  drm/xe/configfs: Use mutex from xe_configfs subsystem
  drm/xe/configfs: Rename struct xe_config_device
  drm/xe/configfs: Rename configfs_find_group() helper
  drm/xe/configfs: Reintroduce struct xe_config_device
  drm/xe/configfs: Keep default device config settings together
  drm/xe/configfs: Check if device was preconfigured
  drm/xe/configfs: Only allow configurations for supported devices
  drm/xe/configfs: Allow adding configurations for future VFs

 drivers/gpu/drm/xe/xe_configfs.c | 157 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_module.c   |  29 +++---
 drivers/gpu/drm/xe/xe_pci.c      |   3 +
 4 files changed, 130 insertions(+), 61 deletions(-)

-- 
2.47.1

