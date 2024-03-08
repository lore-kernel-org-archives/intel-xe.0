Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2FC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 08:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6505810F8E2;
	Fri,  8 Mar 2024 08:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvivXpqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9C110F8E2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887499; x=1741423499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4RkLs5zqcex/nfBQZPRP+QcHG9+dH+iW1q0MlFwKviA=;
 b=fvivXpqC6eHUWC88sHJwCu6koBxQSbR+PN2xUt9jHk02KcmtsQtVH2mN
 0AdKaqqRO1X2OJZcT94EV3D4m0T3BoG+5DXck/Qx/xA9a5+46H6EChnsC
 AjDMY+WisNjJmmvTYqm7V/kprc+BSNgwemd0tiBJUBilw7u/m6fKXvXGF
 D6jmRCn8mmqVt5O3UBNJgkaP3KDn5AyMTS+yl7DmCs7QEC1Z0wn2TzWvF
 UTVMqsMzEwV6iu6tfQEyRgjTO/SHLWtuoPAE8NWAyxpl12Z+PkEdZlGeM
 BkR8bj0dBNcf2at/zx1sAqzybPU7VH23uoiU4ws4INpaeAilUVIgUPAd2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22122935"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22122935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14958189"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:44:52 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH 0/2] Pcode init status and lmem check
Date: Fri,  8 Mar 2024 14:25:15 +0530
Message-Id: <20240308085517.2030484-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Check pcode init status on root gt of root tile and
reorder lmem init to be after pcode init check.

Riana Tauro (2):
  RFC drm/xe: check pcode init status only on root gt of root tile
  RFC drm/xe: re-order lmem init check and wait for initialization to
    complete

 drivers/gpu/drm/xe/xe_device.c | 72 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c   | 29 -----------
 drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
 drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
 5 files changed, 129 insertions(+), 84 deletions(-)

-- 
2.40.0

