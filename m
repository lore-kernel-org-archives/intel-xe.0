Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81568D2FED7
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 18:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347B910E0E7;
	Tue, 27 Jan 2026 18:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKbFZfVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2558A10E0E7
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769538270; x=1801074270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bHki37h5UpeZBkcdnxRt6E91fvw1sygymEFsBL9BHpU=;
 b=iKbFZfVX4A7Ma4BL2lOqh2iBguiZTZ5qoW1J5U6GJ3GMAv8aeapZ1+i4
 MnSPGsGIBGoePMucqleaAkGivLCYNBTDb129Ub0iTvn2eBCCc2QLZECZM
 c8xUgBKM7wfMbaFabXhwEBgXmi+RnI5sIxctdnkX6OIXnwEsXHr/dZQkv
 qeyeaiRmAZryeKnLGfSZFv+63uy9AmjiZ3cKRFZj6QfiDFLUjZoO/wT7s
 SWeeQQmEDqXQJzFrsccrtRgklQv97ef2i0Ree3TolKfX5hHp5Rsrwq4VY
 4IAnnqM+DcWt+56Ne/SFNZYX1r1htLEzUcbYRQ/Vbv8/MyjpKP5djinNc g==;
X-CSE-ConnectionGUID: IpEVXL4vSA23pjluazCHBQ==
X-CSE-MsgGUID: DkivEIpIQ7u6qpspy0QN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644420"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70644420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 10:24:30 -0800
X-CSE-ConnectionGUID: F6QEgK5ITJ2BIkobx9awlQ==
X-CSE-MsgGUID: EmIq4NZXTNWL0ss4OSCLcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208491649"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 10:24:28 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 0/5] Crescent Island PMT support
Date: Tue, 27 Jan 2026 13:24:19 -0500
Message-ID: <20260127182418.640701-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
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

The Crescent Island (CRI) GPU supports PMT from the via
Xe driver registration.

The CRI PMT MMIO mapping is shared for each PMT feature and it
is necessary to set an index register value to access the correct
memory space.

The PMT driver has a callback infrastructure to access data areas
with driver specific access. It is does not support the PMT
control access.

CRI discovery/control spaces are part of the access window so a
driver callback is necessary to allow for the correct window to
be exposed.

Add control path callback support to the PMT driver.

Add CRI PMT discovery information.

Update the Xe driver to support the CRI PMT access.

The crashlog access needs to be done with power enabled (telem is
only available when the device is powered).
Determine which access is requested, and do the appropriate power
request.


Michael J. Ruhl (5):
  pmt: Add register access callbacks
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks

 drivers/gpu/drm/xe/regs/xe_pmt.h          |   5 +
 drivers/gpu/drm/xe/xe_vsec.c              | 257 +++++++++++++++++++---
 drivers/platform/x86/intel/pmt/crashlog.c |  39 +++-
 include/linux/intel_vsec.h                |  26 ++-
 4 files changed, 291 insertions(+), 36 deletions(-)

-- 
2.52.0

