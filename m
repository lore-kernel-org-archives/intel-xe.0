Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C1CC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A7B10E8D9;
	Tue, 25 Aug 2026 06:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5+MsLA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019DF10E8F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639798; x=1819175798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DJW+0GSV/eFL6WYGlHuAlrpwrAMtuiGLmq52sFWRXcE=;
 b=A5+MsLA6fmMr3FbXe2gzZ0lphc9SP0S7UXQphkF3xWIgz+93YA6sdm4K
 Q7IiTPzpLSUqi+CLzDAfXQQdT5bOpq2EN5LAOSLoUL7CAJABoYjnyySvm
 /KieMsR1Tun7ImDZeE1U2LzPVvXmgsGHPhJshFU7t+SEPnH2r1+lmmU6J
 W9/k58BelC1ltGcJg3FjLi5ziHxzzUv0u8KpFB5kk0bpj2bZfLreOeGER
 emOuw2ywwuO3Y4XcLmJqGu/aBNwaU2LOW+goKBDi6Mot+8wByoNqjCMWb
 NO+1KKQzOiGxHNPJIqx1u9i9iIjkKJQgDI4ociP2vGVCAUrlg3ITdoK/Z A==;
X-CSE-ConnectionGUID: qpOvbYSvTHeA+ra3DLZ5wg==
X-CSE-MsgGUID: d0LeEfCiTnajJwnjg0JgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226087"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:37 -0700
X-CSE-ConnectionGUID: lShb5qpsQLGIWhYa/gW61A==
X-CSE-MsgGUID: oSST/oGgTKqWbSj2O9bCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265428922"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/5] Add support to handle memory double-bit ecc errors
Date: Tue, 25 Aug 2026 12:06:15 +0530
Message-ID: <20260825063615.3697317-7-riana.tauro@intel.com>
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

This series introduces the firmware commands required to handle
uncorrectable memory double-bit ecc errors.

When a error is detected, the driver determines whether the affected
page can be offlined and sends an offline/decline request to firmware
via sysctrl interface. Pages belonging to critical Bos or stolen memory
require a Secondary Bus Reset(SBR) to recover.
Pages configured for log-only handling are declined.

For the rest of the valid pages, the first error is a poison error and a
decline is sent to firmware to avoid marking the page as bad. On the
second occurence at the same address, we request the firmware to offline
the page as this would indicate a Double-bit ECC error. Any subsequent
errors at the same address should be because of memory scrubber and a
decline is sent to firmware to remove the page from queue. This is done
by tracking the firmware offlined pages by Xe KMD.

At module load, the driver queries firmware for both the offline list
and the queue and processes them accordingly.

This series is sent as RFC because it depends on the address fault
handling function which is still in review

https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/

Riana Tauro (5):
  drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
  drm/xe/xe_ras: Handle page offline requests for device memory ECC
    errors
  drm/xe/xe_ras: Add support to query page offline queue and list
  drm/xe/xe_ras: Add function to get maximum pages firmware can store
  drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

 drivers/gpu/drm/xe/xe_device.c                |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
 drivers/gpu/drm/xe/xe_drm_ras.c               |  12 +-
 drivers/gpu/drm/xe/xe_hw_error.c              |   6 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 269 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  94 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   6 +
 8 files changed, 381 insertions(+), 19 deletions(-)

-- 
2.47.1

