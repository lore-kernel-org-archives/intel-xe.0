Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E36DCD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 16:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447E1121E9;
	Fri, 29 May 2026 16:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMn7oRdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C2D1121E9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780071169; x=1811607169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vSwlzjsCwQzOH9fZsccReUBnhMrftAdfCVGlmaIvXqU=;
 b=gMn7oRdIu2nE8CFCmJdzNk+104YF7c1/HPG7U00rQB35LjKKpQ87g8uL
 +wKLHW4zpimXDOMmjFkQceRLd3PrBqOmuZ3uSoTXX07mft3goNvgrEly1
 aowXZ6na5lD1PEvZ95ogaHLfsqjcNvFS6z7p8OQ0GGaYEjFgzaPgZHOqm
 oX6xtk/LAN3GCL0+J4JKm6Fm/mjPLFrAcQkjk1Wnc5zyrg58JmlZtvxu8
 zvgMs78Ay/GwV83AeLgvrv0f5PYCJwSb9mPjTHMEJofCgoFXU1HwimenV
 j5YmCE0wXGtqi1mhd8dUstgKN7rg6xsvAEszffBxnMPbiWXnzqwJmXqF1 w==;
X-CSE-ConnectionGUID: PuH7j9tCQYmoxp8alrjnuA==
X-CSE-MsgGUID: RE0HBzCnS56XvnDl9GFB2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91498678"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91498678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:49 -0700
X-CSE-ConnectionGUID: uJ2OKOrUS2OPuQ+Eg0oddw==
X-CSE-MsgGUID: XMPQtLlARVGbWauizCgbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="273201714"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:47 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v2 0/3] Add ocode late binding support for CRI
Date: Fri, 29 May 2026 21:53:49 +0530
Message-ID: <20260529162349.1939301-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
loaded through late binding flow.

v2: Dropped "[RFC,3/4] drm/xe/xe_late_bind_fw: Track firmware load status"

Badal Nilawar (3):
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI
  drm/xe/xe_late_bind_fw: Refactor pm flow

 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 102 +++++++++++++++------
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   2 +
 drivers/gpu/drm/xe/xe_pci.c                |   9 +-
 drivers/gpu/drm/xe/xe_pci_types.h          |   3 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   6 +-
 8 files changed, 94 insertions(+), 38 deletions(-)

-- 
2.54.0

