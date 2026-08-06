Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF1C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 13:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C7210F1F8;
	Thu,  6 Aug 2026 13:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWY3bifk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA52C10F1D4
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786024712; x=1817560712;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zQCckXH33vp4f7OnMpxoDD21Nh552lB0BErDJ5o5jSE=;
 b=jWY3bifkD72vVtflUlxr3ikP4EOpQY4u271kpyROayDBj0Upu8BnqxBa
 CvIpoytJgaOb2sz+wSYSytQPSCjvHT/fz3RlKUgWc1ANeSEHqUjMSjQqx
 CLZgOfh1KQdCoCGonDa3ATx2HbOaWa8p6Lf/+78Vtb99wXlIyTYLqKtgi
 a8Gd4gnTm+hXNgwB0+cOmRzSkjRn6DSHnEExNisuQ4fRXzemc9V7gK94O
 Ce5dPyHXiFTpzbg4VeCZJm57NuAPS5PQxlqv0c4K5YE5qCgaJoKfZucJy
 opAX71h/IW8cFZJ0+V03iv2UCaxgzhfHLpo9Z2pZPZwud6/D1nGmAENPy A==;
X-CSE-ConnectionGUID: xQL7I4SbRXqR1sXzjRrx1w==
X-CSE-MsgGUID: tNDZFZLcSTqzFzpbBEK7cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141302"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="89141302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:31 -0700
X-CSE-ConnectionGUID: dpYy+SOVS5iTEP8fk7BlYA==
X-CSE-MsgGUID: wCAS15fZQsGPPj/euWlFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="265594897"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:31 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH 0/7] Crescent Island PMT support
Date: Thu,  6 Aug 2026 06:58:20 -0700
Message-ID: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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

The Crescent Island (CRI) GPU supports PMT via Xe driver
registration.

The CRI PMT MMIO mapping is shared for each PMT feature and it is
necessary to set an index register value to access the correct memory
space.

The PMT driver has a callback infrastructure to access data areas with
driver specific access. It is does not support the PMT control access.

CRI discovery/control spaces are part of the access window so a driver
callback is necessary to allow for the correct window to be exposed.

Add control path callback support to the PMT driver.

Add CRI PMT discovery information.

Update the Xe driver to support the CRI PMT access.

The crashlog access needs to be done with power enabled (telem is only
available when the device is powered).

Determine which access is requested, and do the appropriate power
request.

CRI FW is loaded at device power.  Support the late-binding API to
wait for FW readiness. (pending sysctl patch set implements the API).

Michael J. Ruhl (7):
  platform/x86/intel/pmt: complete pcidev to device update
  platform/x86/intel/pmt: Add register access callbacks
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks
  drm/xe/vsec: support late bind fw information

 drivers/gpu/drm/xe/regs/xe_pmt.h           |   5 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_vsec.c               | 417 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   2 +-
 drivers/platform/x86/intel/pmt/class.c     |   5 +-
 drivers/platform/x86/intel/pmt/class.h     |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  39 +-
 drivers/platform/x86/intel/pmt/discovery.c |   2 +-
 include/linux/intel_vsec.h                 |  12 +
 10 files changed, 448 insertions(+), 45 deletions(-)

-- 
2.43.0

