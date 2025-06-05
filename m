Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6B8C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 19:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C7D10E045;
	Thu,  5 Jun 2025 19:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgYez6/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E859910E045
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749150488; x=1780686488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcC6dtKNd/1yZ00Wqs2NJdE1KYCF8YIGmeYtAtOSiEI=;
 b=WgYez6/wX8fZ85b6Arca5MPKYVdMwmVeu3lyFT3SfNXtVACJnb9+4Bzf
 ISHgj46gQk74dwhK7iVN5nF5Ssb7dGHcwOARUtGTv0+Fg+mQl7Ql/9Hoa
 6g1Vez3H0jc7g2y6EseoD5kwcA08CxRxi8GYmZRxft2vkJFz8mpSGU0wo
 iyZimlfLkOi2x3/9FGZ5e9DQPKe4OSdHk0SQTyxwr6v/8IFmrzZK0Ovfr
 XMqDerfxLv895MhoKkGmj1qf/NHxCoJhADjurnEY26bxdEWLSSf/HDYYt
 O7BtECMylArfwfTnqTYJXwt9a5Yi3fTe5NqbyPhQxQYzpZST6ugJuAh/S Q==;
X-CSE-ConnectionGUID: r23KWAXTSLKfbkmtHcnUbw==
X-CSE-MsgGUID: U5TX9zqCT2SnrqGbIa8kHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51432754"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51432754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 12:08:08 -0700
X-CSE-ConnectionGUID: J0mss/WSRKqtj5xe9VMTYA==
X-CSE-MsgGUID: SHZ2D3MiSI67lVow109Ltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="168761530"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2025 12:08:07 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 0/3] drm/xe/bmg: Update PCI Id's and Workarounds
Date: Fri,  6 Jun 2025 00:38:01 +0530
Message-Id: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
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

Added new PCI ID's and workaround for xe2hpd/xe2hpg.

Shekhar Chauhan (3):
  drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
  drm/xe/xe2_hpg: Add set of workarounds
  drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID

 drivers/gpu/drm/xe/xe_pci.c        |  1 +
 drivers/gpu/drm/xe/xe_wa.c         | 46 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
 include/drm/intel/pciids.h         |  7 +++--
 4 files changed, 35 insertions(+), 23 deletions(-)

-- 
2.34.1

