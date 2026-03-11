Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23791049524
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 09:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D010E20D;
	Wed, 11 Mar 2026 09:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1RwIRdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECF010E04F;
 Wed, 11 Mar 2026 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773223060; x=1804759060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bI/btbONON9G3trYcFCis9chSVGO43gW9VYlSHW2nU=;
 b=l1RwIRdofl38rcDmKajiDGO7eHGvalKTkhzJcdGEzaiUDATl6MrlMFT+
 //5tL/NILJFReYOEOrJH2Gcef7F19AHCGiDeP5cbh1haLUIsjLZxMfuCA
 8xSFdcqSdEjpx2kH8Yj62t1noTLRNWawa55rzEYO5mQc+YGH/Fccfxbeg
 IJtJmisxFgsa1zZfB6vW5etGWagFmdLyQ41eTAaSdDrAOioVBaaeuxPAI
 QWCDS9vMXDpKrSJZw3qT6BTTn7/n1WQD1YqUCLGX7hNTdzZJSRXj9S8wD
 f6alxSkC5u8/m9DwFLlh2XdWfEcZBIbtXa40zr3wd0yZLzDTtYx7CDUlY w==;
X-CSE-ConnectionGUID: gwBR9rlqRsekhbnp9ENwWw==
X-CSE-MsgGUID: 8pHjMh8NTbSRRklfdxmDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74325901"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74325901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:57:38 -0700
X-CSE-ConnectionGUID: P1Np9L/jRPKDRQekogkxWg==
X-CSE-MsgGUID: o8q8qZd/TSavEXFw45L3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217095711"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:57:33 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 maarten.lankhorst@linux.intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 0/4] Add support for clear counter and error event in DRM RAS
Date: Wed, 11 Mar 2026 15:59:14 +0530
Message-ID: <20260311102913.3387468-6-riana.tauro@intel.com>
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

Clear Error Counter : Add clear-error-counter command to DRM RAS to clear
a specific error counter of a node. Implement the callback in XE driver
to demonstrate usage.

Usage with both get-error-counter and clear-error-counter:

$ sudo ynl --family drm_ras  --dump get-error-counter --json '{"node-id":1}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 3}]

$ sudo ynl --family drm_ras  --do clear-error-counter --json \
'{"node-id":1, "error-id":2}'
None

$ sudo ynl --family drm_ras  --dump get-error-counter --json '{"node-id":1}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}]

Error Event Support:  Introduce `error-event` support in DRM RAS to notify
userspace whenever an error occurs.

Each notification includes the node-id and error-id to identify
the source and type of the error. To receive notifications,
userspace must subscribe to the 'error-notify' multicast group.

Userspace can receive the event by subscribing to multicast group.

$ sudo ynl --family drm_ras --subscribe error-notify
{'msg': {'error-id': 2, 'node-id': 1}, 'name': 'error-event'}

Riana Tauro (4):
  drm/drm_ras: Add clear-error-counter netlink command to drm_ras
  drm/xe/xe_drm_ras: Add support for clear-error-counter in XE DRM RAS
  drm/drm_ras: Add DRM RAS netlink error event notification
  drm/xe/xe_drm_ras: Add error-event support in XE DRM RAS

 Documentation/gpu/drm-ras.rst            | 17 +++++
 Documentation/netlink/specs/drm_ras.yaml | 27 ++++++-
 drivers/gpu/drm/drm_ras.c                | 91 +++++++++++++++++++++++-
 drivers/gpu/drm/drm_ras_nl.c             | 19 +++++
 drivers/gpu/drm/drm_ras_nl.h             |  6 ++
 drivers/gpu/drm/xe/xe_drm_ras.c          | 52 +++++++++++++-
 drivers/gpu/drm/xe/xe_drm_ras.h          |  7 ++
 drivers/gpu/drm/xe/xe_hw_error.c         |  5 ++
 include/drm/drm_ras.h                    | 13 ++++
 include/uapi/drm/drm_ras.h               |  4 ++
 10 files changed, 237 insertions(+), 4 deletions(-)

-- 
2.47.1

