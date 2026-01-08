Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A8D14885
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9FE10E2EE;
	Thu,  8 Jan 2026 01:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeuj9sk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFD710E2EE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767834834; x=1799370834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=InNkODTwF+3OiLTW+8aVzrq6cCAMIEetm8dDQCoJUSU=;
 b=eeuj9sk1l/8g5HckJ9DPzBM1kD9OKOkfAJqiJx8ya35TB3+WNqCI8pO1
 yy9y+DJHdjh+WmUeK8H8Tkvst4p4idpmDz9Blzm6oDD7OfqZ2tHZopnBq
 g3z8lB07V9nH5cdfTvsmWxnw6xqX686RGtH0fDohAfAmpWEXxD7swcjCc
 f0NGV0N22SjtlBpkbZz9l5akvO+PRlOqh1WDXTvMpgI9oATRdByLpLPJ5
 X/k/DxIbP0GQ5itOuI+v3PkqS4LsxKjNqc+760n7dvBg3YGCSKGyf7Yxt
 bq7wTA5nlowwR7DUwhAzGttl/o6RLIlH/s3C+g7XMyusDl+gV0LJ29vyT w==;
X-CSE-ConnectionGUID: OhbjqQ/sRfmr8tbLxcuPog==
X-CSE-MsgGUID: 2vMOIaMGSNWGxACuhid/rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73066454"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73066454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:54 -0800
X-CSE-ConnectionGUID: qVS86anBSOK4iAlMZLFOZg==
X-CSE-MsgGUID: eAKwwM5qRySmiiBJSgid1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207915162"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:53 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/3] Enable GSC loading and PXP for PTL
Date: Wed,  7 Jan 2026 17:13:41 -0800
Message-ID: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
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

GSC loading is required for content protection features (PXP, HDCP).

Since PTL force_probe was removed before we added the FW, the driver
needs to keep working if the FW is not found. Therefore, the code has
been modified to allow the GSC FW to be missing for BMG and newer HW
(older HW platforms require GSC for power management, so on those we
don't want to continue if the FW is missing).

Note that I haven't pushed the FW yet. This is on purpose, as I want to
get CI with the FW missing to test that case. Once the patches have been
reviewed and tested without the FW, I'll push the FW to intel-staging
and re-trigger CI to make sure everything works with the FW as well.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/gsc: Make GSC FW load optional for newer platforms
  drm/xe/ptl: Define GSC for PTL
  drm/xe/ptl: Enable PXP for PTL

 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
 drivers/gpu/drm/xe/xe_pci.c              |  1 +
 drivers/gpu/drm/xe/xe_uc_fw.c            | 11 ++++++++---
 4 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.43.0

