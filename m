Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED6C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 12:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333710E91A;
	Thu,  6 Jun 2024 12:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7ikS+W3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97EB10E91A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717676730; x=1749212730;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nHa5HSOPLKSmLp25GiIEx+7Vkp5tnGRIyc4Fn2OD11Q=;
 b=e7ikS+W3FSEKHVOx6q6wRsApW3v1YVwm8gG9tWvR4IJHG85aTSmKi1yi
 yqadvOI8aTgApOTAOnOzgB6ZFw48KjGptQGoxsUqhstDnyzTu5NVs/ndv
 Wu5lG5prFFx4R2qtihq6l/u8+WE/uk3CSv4ReVB4l7gJ8s6VgNUtWmpxs
 CpAF7bl2eDiDgucNzS7vFjtc046qzauDl+eOBXWUiSNpIUjdlhlfDkSI+
 1nhqwRNb+RB64COSqNHF0u2Iginn9ehKx8Sd5K/cC0+VCwwWEPyOsnOGs
 1hOevcpU5hoUEAVST/1cokeD5a5AE5xCxfzcifDvjtRZ2MPEAuX1uxfJy g==;
X-CSE-ConnectionGUID: nzG+/bkhQImbke0F6GDKuQ==
X-CSE-MsgGUID: R0LcHt8yTBKY7vjrHROplQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17273900"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17273900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:25:29 -0700
X-CSE-ConnectionGUID: HPTPiWN/Sl2ozFse/wLYoQ==
X-CSE-MsgGUID: toQLryFmRr2TvgQ5VvTuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38033812"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 05:25:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/3] Assert for multiple or undefined forcewake domains
Date: Thu,  6 Jun 2024 18:11:30 +0530
Message-Id: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Below functions expect enum xe_force_wake_domains as inputs, but doesn't
support multiple domains (XE_FORCEWAKE_ALL). Assert if caller passes
XE_FORCEWAKE_ALL or any other undefined values.

Himal Prasad Ghimiray (2):
  drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
  drm/xe: Check valid domain is passed in xe_force_wake_ref

Riana Tauro (1):
  drm/xe/xe_gt_idle: use GT forcewake domain assertion

 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 drivers/gpu/drm/xe/xe_gt_idle.c    | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

