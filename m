Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A731C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA510E3A2;
	Thu, 31 Jul 2025 19:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSgjw+OF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D6E10E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990431; x=1785526431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FuguvQq5B8y6mw8s1wX5A8FqwCP81krWxCF3WVRIf34=;
 b=DSgjw+OFLaLjNjQCITBVC+3FAhhI5mUDkVmsLkxvj54Ol/0wNhVErUEg
 3xWpqGlCed4P06k3Tk3ESwGRiI5fB6qMfyrilSNp34Y/bB1VHzl0DGkkA
 vGtNOzJE7AWS4meT9za+Tb32d7GGlg8YLMZJa5+4f4Wmvb2Iw0AhMXgVE
 2O6rGOwcc8NOtC24zYXLl2pmlJMVOQKiHTQH/JV/igKxiA/ZtxqxSJiEe
 yCGsuhDO1pVqWg1QInYvQ4JzogGmA5b1pS8yuRZNQ0y88ikTf+xElowX9
 Izd0Lv4Kkzcyr2cpC+Q/NJwGqsOOB0u07djNeTkw471HVnWSgd1aUd7eZ w==;
X-CSE-ConnectionGUID: NerCVunHS4ezcfjM2Z1SnQ==
X-CSE-MsgGUID: dP8Bx6OST3KK9vMnmIIVug==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395019"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:51 -0700
X-CSE-ConnectionGUID: tjmPxZfnRQ+plef7GXVVCA==
X-CSE-MsgGUID: RKy2HgibRCydqYPEXyOVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333949"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 00/11] Updates for drm/xe/configfs
Date: Thu, 31 Jul 2025 21:33:28 +0200
Message-ID: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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

v5: https://patchwork.freedesktop.org/series/151773/#rev6
v6: don't use -ECANCELED, print message instead (Rodrigo, John)

Michal Wajdeczko (11):
  drm/xe: Simplify module initialization code
  drm/xe: Print module init abort code
  drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
  drm/xe/configfs: Drop redundant init() error message
  drm/xe/configfs: Rename struct xe_config_device
  drm/xe/configfs: Rename configfs_find_group() helper
  drm/xe/configfs: Reintroduce struct xe_config_device
  drm/xe/configfs: Keep default device config settings together
  drm/xe/configfs: Check if device was preconfigured
  drm/xe/configfs: Only allow configurations for supported devices
  drm/xe/configfs: Allow adding configurations for future VFs

 drivers/gpu/drm/xe/xe_configfs.c | 151 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_module.c   |  29 +++---
 drivers/gpu/drm/xe/xe_pci.c      |   3 +
 4 files changed, 136 insertions(+), 49 deletions(-)

-- 
2.47.1

