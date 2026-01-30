Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7943EE6BF0D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 13:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C0610E0B7;
	Fri, 30 Jan 2026 13:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvQQuim9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445010E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780213; x=1801316213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j/YljXsb0FmTcgaDqtS4qv/Ss9pENz4ZGh+3PWa6oPQ=;
 b=WvQQuim9vK6za5Dl2OYCU2dPIDws/2w3msa9tEKB6wxrgQ5m5SoDrbCM
 FnrfJ442o67ChfArjjDrKIbEzU3y4Y6WRCRwtKfl9M3qxYch+4sSeKGlc
 Ozg//UYx2LgMPa8hE4AlVJa3Kde+XauSZ1+aSeA/Y2wqTg4M16DQX/9Mh
 oE2NS7e5pQvl/ds+yZpv7+VPGxB9mXbo1AwMKXMpWwwOa/gZJI/ZVwkH7
 tl7NGI2yxAkMAS8Ac7sjVsphO6rmBqOkgEq5r91EA7kHbiiCiHkh6wwv/
 Oh+kHAZPRn9gAOPg3KOO0EA0IV2sLT8BphkMDgWDMgiOefJJqodua4rb8 g==;
X-CSE-ConnectionGUID: qAxrPSnQRH2P1LBlk255wA==
X-CSE-MsgGUID: xq0AplY6RwKIclxY7yQOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194377"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71194377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:36:53 -0800
X-CSE-ConnectionGUID: 1JHUBTtBQEeStWewFsciaw==
X-CSE-MsgGUID: ty6/N1W7TlC679quscdmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207983227"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.170])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:36:51 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 0/5]  Crescent Island PMT support
Date: Fri, 30 Jan 2026 08:36:40 -0500
Message-ID: <20260130133639.765378-7-michael.j.ruhl@intel.com>
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

The Crescent Island (CRI) GPU supports PMT from the via Xe driver
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

v2:
 - clean up commit messages (reflow and content)
 - remove debug usage of __func__
 - addressed kernel-doc issue
 - clean up some added lines 

Michael J. Ruhl (5):
  pmt: Add register access callbacks
  drm/xe/vsec: Use correct pm state get
  drm/xe/vsec: Support Crescent Island PMT
  drm/xe/vsec: Crescent Island PMT decode
  drm/xe/vsec: Crescent Island PMT callbacks

 drivers/gpu/drm/xe/regs/xe_pmt.h          |   5 +
 drivers/gpu/drm/xe/xe_vsec.c              | 255 +++++++++++++++++++---
 drivers/platform/x86/intel/pmt/crashlog.c |  39 +++-
 include/linux/intel_vsec.h                |  26 ++-
 4 files changed, 289 insertions(+), 36 deletions(-)

-- 
2.52.0

