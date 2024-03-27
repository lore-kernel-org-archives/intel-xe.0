Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F9DC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 18:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8775410F73F;
	Wed, 27 Mar 2024 18:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpvS5yr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AEE10F73F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711564078; x=1743100078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2359RsA+91ZcYqAzwM06/n1adAjyrvAjZrV1ib0s4cs=;
 b=SpvS5yr7JaHnnJSVGw4tLGYJ59zFABoeWGq5vq75XXJk0XDMZLUyWb35
 36UxQD/pmX14ygQCufJyPv2x0CON9rM05bkBKyUQ8syOtXTX8IfU5DrUY
 7HGSLemLBqGK4JXLVnMFvMCCuWD9iLdlFZqfeGu+UHpbpBVzypbNTHx1C
 gLzYKQGvxVZaAwqx2Ekmp8Q4HEYyK+pPXYZAnPn/hoIu61idvRxQDctb+
 bQWftPCr7DEuQjYFOzBi5hsgLu33qh05nGMXSU51bsjKOjeUsSMDDbgjK
 E9d1Jc0WRgY9lNjZY7oZCWurginNZyE6YEIHy63QKMYNhW9fCrX70ndgd Q==;
X-CSE-ConnectionGUID: nXqBi+YaRf6eljQ8F7JsjA==
X-CSE-MsgGUID: yidaMpg/RBeorslSw4zDlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18074615"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18074615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20917422"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:27:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Add proper detection of the SR-IOV VF mode
Date: Wed, 27 Mar 2024 19:27:37 +0100
Message-Id: <20240327182740.407-1-michal.wajdeczko@intel.com>
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

SR-IOV VF mode detection is based on testing VF capability bit on
the register that is accessible from both the PF and enabled VFs.

Michal Wajdeczko (3):
  drm/xe: Separate pure MMIO init from VRAM checkout
  drm/xe: Move SR-IOV probe to xe_device_probe_early()
  drm/xe/vf: Add proper detection of the SR-IOV VF mode

 drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_device.c          |  4 +-
 drivers/gpu/drm/xe/xe_mmio.c            | 59 ++++++++++---------------
 drivers/gpu/drm/xe/xe_mmio.h            |  2 +-
 drivers/gpu/drm/xe/xe_pci.c             |  2 -
 drivers/gpu/drm/xe/xe_sriov.c           | 21 +++++++--
 drivers/gpu/drm/xe/xe_sriov.h           |  2 +-
 7 files changed, 49 insertions(+), 44 deletions(-)

-- 
2.43.0

