Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14715E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78E610F052;
	Fri, 20 Dec 2024 21:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNsE+uUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073410F052
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734728561; x=1766264561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kVyLf9sAs5aqcovN5xlt38NJClyUn50xwNoa7gXuybs=;
 b=MNsE+uUhxH4hTwOXLphkejW53BPSkBZdRowyEqyTn7mZTgzR857Jgx8m
 KdM6scHS0Kl1uYT3bt6o6Axho0q5G/VIPminNfIAhX00SL1KlR+7jNB9s
 I9HxKNzqUzg/fEsnHdIHoZjIi0rg1oIk+SaQJliXXHMo3ku9r545oBFYq
 s0pyn17g3B0t0VjDnlCVXLQmt4T2f/aKVts+DNOMm9VvY0BOQ5CeBNGH0
 tpmCZXD6BvQwPTF7P1ha/iKytqIT0hjwzBzqdYytlFx0LIBLbJeR3ejun
 TlTSb3CzhL+0qlgSiqLIwY2YMC058RIw8L3F9Vp87MYFmLvlwS9gDZhZp g==;
X-CSE-ConnectionGUID: m8MSp9a+R12Bb7DECpeFAQ==
X-CSE-MsgGUID: 3He2XnA+Q+GZPkJsc03Cqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35314418"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35314418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:02:41 -0800
X-CSE-ConnectionGUID: 1ioV3HvDR2urARV/XyibeQ==
X-CSE-MsgGUID: JgL3bUxZSaSMHbTX3S+mPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102727903"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2024 13:02:40 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v11 0/4] drm/xe/pmu: PMU interface for Xe
Date: Fri, 20 Dec 2024 12:59:23 -0800
Message-Id: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and C6 residencies.

v10: Fix a leaked ref in pmu_enable(Riana)
v11: Acquire runtime ref before pmu lock

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (3):
  drm/xe: Add locks in gtidle code
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile           |    2 +
 drivers/gpu/drm/xe/xe_device.c        |    3 +
 drivers/gpu/drm/xe/xe_device_types.h  |    4 +
 drivers/gpu/drm/xe/xe_gt.c            |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c       |   23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h       |    1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |    3 +
 drivers/gpu/drm/xe/xe_module.c        |    5 +
 drivers/gpu/drm/xe/xe_pmu.c           | 1094 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h           |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h     |  147 ++++
 11 files changed, 1314 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

