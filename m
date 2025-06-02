Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67076C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224EB10E195;
	Mon,  2 Jun 2025 23:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McZkhh1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5210E186
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748908011; x=1780444011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1aIlppHloA+exHbdL8o3n50ITiRzaeC1KJ9tgQmmk5Q=;
 b=McZkhh1x8wwux7zzfiOOlnIlwfg9BKl/Yo76vvdW1wN/v3ctw7AW7ieg
 3/wEM41QleN3V7VPNOgFtKgAGKAfHEXHZzn0KFUXJhopmGs3jIJ4vHw65
 JqK+c+r5W2Zs81CcQlMS8h1/O5ZtMD+JV1QINaZdK9akeh4KOS67YWBJf
 AgJ3jah/ET120dHVs2OhqTWUkibu9oJqT9zWRFPbZPF60jt9EH3SiHoAH
 u9VQHCMtJ34Urv+Ojec2ZKdfNrovZKQLyH/TytJhC0tuxFIN8Ayx1qz60
 xaB4zxMxsI9ZZt0vCh92V4C7DB/Yn70B78qWJkPxqMiSmCXoN06S5Hb1d w==;
X-CSE-ConnectionGUID: /gMKdik8QTeJzRGOTaW5Ug==
X-CSE-MsgGUID: 1WwXLMrST324/mJskM+lZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68361178"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68361178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:46:49 -0700
X-CSE-ConnectionGUID: /TGq3mgaQM61oO3LmtJubg==
X-CSE-MsgGUID: mKabOnAZRk+F8nZXY1gJlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="167846130"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 16:46:03 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 0/4] drm/xe/bmg: Update some WAs
Date: Mon,  2 Jun 2025 16:44:11 -0700
Message-Id: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Additional changes related to existing WAs.

v2: Review comments (Rodrigo)
v3: Fix CI errors

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (4):
  drm/xe/bmg: Update Wa_14022085890
  drm/xe/guc: Ignore GuC CT errors when wedged
  drm/xe/bmg: Update Wa_22019338487
  drm/xe/bmg: Update Wa_16023588340

 drivers/gpu/drm/xe/xe_device.c       |  10 +-
 drivers/gpu/drm/xe/xe_gt.c           |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 137 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules   |   1 +
 6 files changed, 146 insertions(+), 8 deletions(-)

-- 
2.38.1

