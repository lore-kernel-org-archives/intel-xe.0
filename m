Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEF8D68B06
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 13:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96310E02C;
	Thu, 14 Nov 2024 13:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G64CJ8r5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D610E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731589452; x=1763125452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b5tMeBj7G8TGC0pQo4cL7OGITA7DTtYRmijuPXkRfv8=;
 b=G64CJ8r5oDfOH6C4/6g0uKp52B03AJmqT4gf6mXQ0d5OBnh0DpME/Fc+
 SZW1IQ3rbUf/v9uz8QAyrnJ+AVSXOf+xN1lr6VYRCy3usowlFYxNvbv0k
 WsvoTsdERsK8L/JSVgolB+55asTc22lrN7g5KIbvU16COso7m8ueRVLr9
 GcdGDnYVVBw8hfmV4XdyfVd7UkdD01lCo9+WGKfv6v9AYg6Vqiptjy8Hj
 bwOHPT3Ms5z60vN01auxvIG/cJc2amODCuYR8G69+OFplGs+VFkQABpuj
 EGWKN0J9t4SidC6VEmfjyfixspabTHwKWv5YpMz/PtrlS3eMZZ/Stei48 g==;
X-CSE-ConnectionGUID: NfE7KisyScSvxOGbXoBn4Q==
X-CSE-MsgGUID: by/HEU8cRmy9ABhtLClxcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35320456"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="35320456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:04:11 -0800
X-CSE-ConnectionGUID: ND+gSUTUSt+sCeJ1OH6gwg==
X-CSE-MsgGUID: wZdShYsNTvmiLNfRjBQWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88597772"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:04:10 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v3 0/2] Support BMG PMT features for Xe
Date: Thu, 14 Nov 2024 08:03:56 -0500
Message-ID: <20241114130358.2467787-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Updates for PMT to support user offsets from the sysfs API.

v2:
  Addressed review comments for the Xe driver udpates.
v3:
  Consolidate offest addition to addr
  Add r-b.

Michael J. Ruhl (2):
  platform/x86/intel/pmt: allow user offset for PMT callbacks
  drm/xe/vsec: Support BMG devices

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  19 ++
 drivers/gpu/drm/xe/xe_device.c             |   7 +
 drivers/gpu/drm/xe/xe_device_types.h       |   6 +
 drivers/gpu/drm/xe/xe_vsec.c               | 232 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h               |  11 +
 drivers/platform/x86/intel/pmt/class.c     |   8 +-
 drivers/platform/x86/intel/pmt/class.h     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |   2 +-
 include/linux/intel_vsec.h                 |   3 +-
 10 files changed, 285 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

-- 
2.44.0

