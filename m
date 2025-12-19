Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A7AE66892
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3510E036;
	Fri, 19 Dec 2025 21:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bL8ylJrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAEC10E036
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766179030; x=1797715030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IP6ObKd/7ZmnOt1JFaoOttolvWHiwIctku5jkkrQnUw=;
 b=bL8ylJrLMM+6OVFTINcTk09iCYhLT2b2O+DL+jxqAM1wHWGQlFlpkus0
 C8xA/oUQKu4q807dUKVZMKW0EmXOlkirgnrUXaH9iFMwUERjcNk0swg2S
 CVR7Yu7+UVUozuZAk3FOdbBIqzn4NG2ddRz2qVsq0ZxSO35Nl+gPMgSKd
 1cMMtb/I3YU2R9LkPXc3sec/1E/kmZxhlnnpPUs12j7unHpUgpAKqwsvO
 j+6GeYmHkUMFAEh0o7n93ZjwBMaHh3H5SxXFw1alX/J8EvD/zJ2VDaca6
 mCLYkLKLucf6VdI1M9V5+VZs2tZdNP+7OFlITED7oCL1ZH2zVrie7d9kf Q==;
X-CSE-ConnectionGUID: lIH0uUI1QFe5VrO8rQUyTA==
X-CSE-MsgGUID: LaTICgkGQQyDc0SgckXp/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68036833"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68036833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:09 -0800
X-CSE-ConnectionGUID: QIlJBsfjSqWtcVi3gLP43w==
X-CSE-MsgGUID: NoXcn9b1TriTPnGJfhURBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199447605"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 0/2] drm/xe: Add xe_pci_rebar
Date: Fri, 19 Dec 2025 13:16:47 -0800
Message-ID: <20251219211650.1908961-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

Quick re-base and CI resubmission of Lucas' series from [1].  The
prerequisite PCI changes for v6.19 are now present in the DRM trees via
the recent backmerge, so that should unblock landing of the Xe rebar
patches.

[1] https://lore.kernel.org/all/20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com/

Lucas De Marchi (2):
  drm/xe: Move rebar to its own file
  drm/xe: Improve rebar log messages

 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 106 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      |  91 -------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 122 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.h

-- 
2.52.0

