Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B7EC021B8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 01:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1010E9F9;
	Thu, 27 Feb 2025 01:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCwNO/AE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2299610E9F9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 01:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740618346; x=1772154346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YgJt8OZ/cMWQtm9bWxA/T0GmNqrNEnCxH/cGbqOuAzc=;
 b=QCwNO/AEB5d5lJwsfR+1zX1cukDeeXgdB+z0Rei0Avu0csFFy17VMGMm
 8WMPKdDuvoj1N9AfLwotg7PGLYFggs3TMY0HtkdjdH8zj2FZ66i2cu/pc
 FpJh6hAyREyHGg+MXxa+uVUYEnqRz8zlSG6FKBHkzSCLvM+rhd7FnJnv8
 iCYytXIVCIoXP4j7+hLkyHuUM6YhqfXvluztxVC2dnZmwLFK7EqfJP8+z
 MDyuw397NE2MYCWRKJZgy7mA+SHxHdrxj/i/E7aCt38AIzxPcxpu5ysxP
 4EjCoqBHc1xhnHjR30II2CBhWyGtIFU63oC+/QD+K96jFmcT0Zo11+kAq Q==;
X-CSE-ConnectionGUID: aAmowrUmQeaxtFWjeUd5zw==
X-CSE-MsgGUID: 4iiiTQ5+QfeNN41UMW/Qlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41744766"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41744766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 17:05:44 -0800
X-CSE-ConnectionGUID: /G+44LvGTK6az2EMkqu6VQ==
X-CSE-MsgGUID: POswBbS7Ty6T74XU3WWv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="116648798"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 17:05:43 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 0/3] Enable GuC opt-in features
Date: Wed, 26 Feb 2025 17:05:27 -0800
Message-ID: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
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

The GuC supports a H2G to opt-in to extra features on a per-VF basis.
We're interested in 2 of those features:

1 - Extended CAT error info (extra debug info)
2 - Dynamic ICS (optimization)

More details on what those do in the respective patches.

This series adds code to conditionally enable those features in both
native/PF and VF. Note however that 2 other requirements need to be
satisfied for them to fully take effect:
1 - for the VF enablement to actually work we need another series to
correnctly set the GuC compatibility version [1], but these patches can
be merged in parallel as there is no direct dependency in code.
2 - Dynamic ICS needs GuC 70.40.1 or newer, but the bump to 70.40.2
(from 70.36) is currently in flight [2].

[1] https://patchwork.freedesktop.org/series/145406/
[2] https://patchwork.freedesktop.org/series/145528/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/guc: move KLV helpers to common file
  drm/xe/guc: Enable extended CAT error reporting
  drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 28 +++++++
 drivers/gpu/drm/xe/xe_guc.c              | 94 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c          | 89 +++++-----------------
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c  | 62 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h  |  7 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  3 +
 drivers/gpu/drm/xe/xe_uc.c               |  4 +
 10 files changed, 236 insertions(+), 72 deletions(-)

-- 
2.43.0

