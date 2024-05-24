Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988BC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 06:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D010E395;
	Fri, 24 May 2024 06:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzkjfvl/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083310E395
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716533839; x=1748069839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vUEfNxIbzw8eSIETKJZnhtG2zez7SZe5hrHxCQVU6+w=;
 b=lzkjfvl/PsZjtTOKb2eeCx8kJjTYGLeY/HLbSiq2k9qM3uNutxXUXLug
 nsrCfteE1HpS1seW21pvNTj8jry+rJ29qEztSKqf4BcuRFW2I91sgv7St
 UccsnB/P0bpfi3/sSEWqNaLfZsGWS7bKDin1tud2SepViBfL33dK0LDHi
 lj2QZb2DSaz/zS3QKKqX2ViUGGxwi8ucxTEIXbeH372wrIwvUBUJ4cxIw
 7cEUQoDQTAz+4ikjwYR74QMwqSKbEnSvNaCKeOPT+LZgHK2FOWdL9ZV8o
 7NRvV81V1RtrWw3R28OwqJQbPyfNtZ9jMYS6TaDYOeBUs74s0yKoufVI0 A==;
X-CSE-ConnectionGUID: rVmhv2noRA2T0RMuBgxwKg==
X-CSE-MsgGUID: DGzLh9WVSEKhaWeVIDlXQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13014117"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13014117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:18 -0700
X-CSE-ConnectionGUID: UAqoHyX8Q6KQECegpas5/Q==
X-CSE-MsgGUID: Vt1jgVz4RxGMv5Lw9SdsUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="65142140"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:15 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v4 0/2] Enable Coarse Power Gating
Date: Fri, 24 May 2024 12:39:14 +0530
Message-Id: <20240524070916.143022-1-riana.tauro@intel.com>
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

Enable power gating for all units and sub-pipes that
are disabled by default.

Also standardize power gating registers

Rev2: re-phrase commit messages
      fix review comments

Rev3: set hysteresis value for render and media pg
      skip CPG for PVC

Rev4: Rebase

Riana Tauro (2):
  drm/xe: Standardize power gate registers
  drm/xe: Enable Coarse Power Gating

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++---
 drivers/gpu/drm/xe/xe_gt.c           | 12 ++++--
 drivers/gpu/drm/xe/xe_gt_idle.c      | 57 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 +-
 drivers/gpu/drm/xe/xe_wa.c           | 10 ++---
 5 files changed, 76 insertions(+), 19 deletions(-)

-- 
2.40.0

