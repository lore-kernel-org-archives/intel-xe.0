Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4895FCD3423
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 06:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F37710E257;
	Mon,  4 May 2026 06:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnCOsyZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B2710E257
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 06:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777875782; x=1809411782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Atd93ytPnDdAGeEX8kl0NXLMEvfoyw4e0mfxegoazbM=;
 b=HnCOsyZesEBzy3Ig4GOYnBjnjnHqq7lGSkNcNjJgW7zDmsIYTqqaeQza
 uV2hBMQI2Op0DBnvYZ2jzvSi+ATheGakIIaUtvpAWZLO4lBIX0d9cAuue
 jR96hOjoQNIl9t1oJnmVPhXlmD3o3kxZ/C/CAuzTGrQu5wUouiu7jwvZ6
 DxibI0Fe9/BTbiw/Jyf9NMIqns4Uhqfl4VtEAo4jP/QaiggwrYdCO7E31
 rq9LQjHgW2pNfXmK/vQtUjrKGf84vw64HqrM8oaWDj7EzVsEg4RPROpzg
 ev6xGubvmecUcsMm39vpBLiL5i+T+5bbdkQ/9zWJGHfPcHSRPZVo3Hm5Z g==;
X-CSE-ConnectionGUID: rdTfayhISL69mQo1r+AQmw==
X-CSE-MsgGUID: eUEQC5FaQkyAQAUXEC94Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78592313"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78592313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:23:01 -0700
X-CSE-ConnectionGUID: gMSeLvzISQuvJJLnVaorhw==
X-CSE-MsgGUID: Vrtxcwk/QAmOZjRb8ZlwFA==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:22:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 0/6] Add get-error-counter and clear-error-counter support
 for CRI
Date: Mon,  4 May 2026 12:26:15 +0530
Message-ID: <20260504065614.3832331-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Define request/response structures and helper functions to query system
controller to get/clear counter values for CRI.

Integrate get-error-counter with xe_drm_ras.

Usage:

Query all error counters using ynl

$ sudo ynl --family drm_ras --dump get-error-counter --json \
'{"node-id":0}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
 {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
 {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
 {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]

Query single error counter using ynl

$ sudo ynl --family drm_ras  --do get-error-counter --json \
  '{"node-id":1, "error-id":1}'
{'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}

Clear counter using ynl

$ sudo ynl --family drm_ras  --do clear-error-counter --json '\
{"node-id":1, "error-id":1}'
None

Rev2: add helper for clear counter
      separate get error counter for other usecases
      move commands to sysctrl layer

Rev3: integrate clear-error-counter with drm_ras
      use drm_ras flag
      move drm_ras registration to ras init flow

Rev4: rebase

Riana Tauro (6):
  drm/xe/uapi: Add additional error components to xe drm_ras
  drm/xe/xe_ras: Add support to get error counter in CRI
  drm/xe/xe_ras: Add helper to clear error counter
  drm/xe/xe_drm_ras: Wire get-error-counter and clear-error-counter
    support for CRI
  drm/xe/xe_ras: Move xe drm_ras registration
  drm/xe/xe_ras: Control xe drm_ras registration with a flag

 drivers/gpu/drm/xe/xe_device.c                |  19 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  39 ++--
 drivers/gpu/drm/xe/xe_hw_error.c              |  13 --
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 187 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   7 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  55 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 include/uapi/drm/xe_drm.h                     |  11 +-
 11 files changed, 305 insertions(+), 36 deletions(-)

-- 
2.47.1

