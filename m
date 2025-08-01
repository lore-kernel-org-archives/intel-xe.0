Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB4AC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9473110E863;
	Fri,  1 Aug 2025 14:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irsZ1k7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23C810E863
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058513; x=1785594513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GaR9rCp2ezkzW8JqiOcEINmmGgOomWugWbEmYlsL47Y=;
 b=irsZ1k7x+C5mcdvM5QzpS9GZSAjLKPzaXlyqt9DnfOHm3jc+pd/BNJ62
 NRYNzdMJoxu8sPqILK5cj0T3OYVdYtdIGW/EoQ4WTKshNJ30OVDRzyxt6
 jpdjGIcqQwnC2Ve/vI+IqdfEJ/jn6BDP6qehF0e31f9dWfHq5l5cW8WlH
 ERTl5rAqMNcYlTWaoCd34Sm0TsB9W7xNd41qii+wzIEtRxm7PyBuAVvVV
 x1a/zVo97uNHfuO+qnKyJQn3zmNH9UtgnG9TURKS1HUY4y1Wen5PFpvue
 tWTI1c/+7MmvKws+kVvv2psVnT8Tdo3CVLxWlYoXjSHEbWK2YM/8AnVQ7 w==;
X-CSE-ConnectionGUID: gXOOrrVCSXCnC4V8RokERQ==
X-CSE-MsgGUID: /I7kGzBQTUKqZIgyaCj4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55466014"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55466014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:32 -0700
X-CSE-ConnectionGUID: rsFKU//bRcmjkl2FlyZtIA==
X-CSE-MsgGUID: oMVxAMcSRL+uxqa8IgR9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162858526"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] Misc PF improvements
Date: Fri,  1 Aug 2025 16:28:19 +0200
Message-ID: <20250801142822.180530-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/152303/#rev1
v2: add asserts, drop logs (Piotr)
    fix comments (Jonathan)

Michal Wajdeczko (3):
  drm/xe/pf: Disable PF restart worker on device removal
  drm/xe/pf: Make sure PF is ready to configure VFs
  drm/xe/pf: Don't resume device from restart worker

 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 79 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
 6 files changed, 113 insertions(+), 6 deletions(-)

-- 
2.47.1

