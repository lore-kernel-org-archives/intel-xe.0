Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BDCD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 11:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C43110EE94;
	Thu, 11 Jun 2026 11:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kODH8JF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1AB10EE94
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781176739; x=1812712739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g2XFlcPWBgDBICmoygRspKo05ayq6hV1Bw8m81y0mv4=;
 b=kODH8JF9C/GG0eE6xtxLvZ190eyoDEzKQOsuV2Y88T/OAqEF+6ZY6e3i
 myaUG41/g/CrAcxiCWVueowFHS9K/tDCLKsGBhXRHFVp91VuhbtdYGVLy
 QdnyR3RV7XQySuW1hc26YVsyxNubQzSXebUgJaWZ09OTydUCssENt8HN7
 QYtomOltNTMZPHVq4cflHqziceT/03nJEANoZFIFcjxpxLq8ePmTpHRf5
 pVP4OzHW82QhrbwBrsvCB0q9RwAfOjiTKf2WJL8rh/GOCOvBdcnNjCmuh
 W3j53x076zMX+WR8vHoiYxHoGJJezt1BbuHWcfIO4SHfQ7YlRPjWbe8EL Q==;
X-CSE-ConnectionGUID: Flv8WG3qTY2CNCCXBDe6Vg==
X-CSE-MsgGUID: ee0dulpoR4eBcW3PT+UwOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85885131"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85885131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 04:18:58 -0700
X-CSE-ConnectionGUID: mYBd9c+GQJqWwJkhpSUtkA==
X-CSE-MsgGUID: GP+IZgz2SG68qZiXqpg+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250741626"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 04:18:55 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v2 0/2] drm/xe: Structured RAS error logging infrastructure
Date: Thu, 11 Jun 2026 16:45:43 +0530
Message-ID: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
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

Today XE logs GPU errors with ad-hoc drm_err()/drm_warn() calls that
have no standard format, making it hard to identify what failed, where
on the GPU it happened, and how to correlate events.

This series adds a lightweight structured logging layer:

- Introduces xe_sig_ids.h (Signature IDs that name each error
  class) and xe_ras_log.c (__xe_ras_log()), which emits every error in
  a fixed format:

    [xe-err] SIG_ID=<id> Severity=<sev> Location=<loc> Errno=<n> 
    Message="<msg>"

- Converts the first call site: the open-coded drm_err() in
  xe_device_declare_wedged() is replaced with XE_RAS_WEDGED(), routing
  wedge events through the new common path.

v2:
- Rebase.

Mallesh Koujalagi (2):
  drm/xe: add structured RAS error logging infrastructure
  drm/xe: use XE_RAS_WEDGED macro in xe_device_declare_wedged

 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_device.c  |  11 ++--
 drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

-- 
2.34.1

