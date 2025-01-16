Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35123C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 13:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5F10E597;
	Thu, 16 Jan 2025 13:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7Wm0eQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335B010E597
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737032785; x=1768568785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MIfyXy9IQJXUnlwxLCPMD/uc6lF1fR4GaQSdTUZc8t8=;
 b=h7Wm0eQ4huLRO06u5UUkGavF0qEUrtD/zbrZhZ+2nrCNhd+drppltSkg
 183GmM3JT2qjltE0y9F78e/7JN6lin043QOCIugW0H3oBpIlxsFaL0Sh/
 cxU7LPrb5svV+Lz527b3E6trOp/F/Psys2dMRSxKiB0Gdvw4lYK5rtz0/
 37JzziGjqCvN2ks3uaOCD4XJvFzbol6YAw66vmE/tUpNKEzPn8oE+Fj2t
 S8AGIj4Slum68qau+TzEoVH2UrTm+Hn3A2ubXQ/UtRb6JjmXgZR/QQD8r
 AG7LORf04RZ77yVflxpfVyb6uLiSmk9K8ij3myjPVVYx3V70ua25P25EY A==;
X-CSE-ConnectionGUID: E51lvftWRTiL9lwZE7e5mA==
X-CSE-MsgGUID: ALokeglLRduytZDILOjtmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41095090"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="41095090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:06:25 -0800
X-CSE-ConnectionGUID: dopUaetVTtWl0xjiRV9bPw==
X-CSE-MsgGUID: hVYpC/mDSxKFyS6/mgzLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="106076652"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:06:23 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH 0/2] Refactor some graphics descriptor flags
Date: Thu, 16 Jan 2025 18:24:45 +0530
Message-Id: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
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

Refactor dma_mask_size and max_remote_tiles and place them in
the platform descriptor as they are more related to the platform
than the graphics IP.

Sai Teja Pottumuttu (2):
  drm/xe: Refactor dma_mask_size
  drm/xe: Refactor max_remote_tiles

 drivers/gpu/drm/xe/xe_pci.c       | 31 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_types.h |  3 ---
 2 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.34.1

