Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DBC3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 17:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C0510E2D7;
	Thu,  3 Apr 2025 17:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGaN49o+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D062810E2D7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702500; x=1775238500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AzWHOPx+Lwx7vWHYSnaNRVROd1YXzQyLKLT3iRB4Jeg=;
 b=FGaN49o+THXLu5Ra10varxFzEwhw6nf+njwJvnhnjfv/oqXlZsAINAaP
 ACM5chbN3ih5mfUvgbmFv3u8mFBPsqX3/tuce4J7vLJKwg2R3ONa9TFVs
 qrkHYTE8StBMpfWNcBwdfkmE1OwZ6QPxq28D8EGZoQlQ1BqUinX60NfVe
 93jMlnFcNDgql1wT6uZd32Ld/8QWgRFDRqv0waZwmwKBXIGgHOzqdIidi
 okB0kc61EkVm3YlMhBKNdK6jed2EgkrjAtp+9y75hyx4cIqttMJMr0IzG
 /USXCkBnEdQLkgfoEcebTzbeZeW5cHtpBXv0f1mPw6DKas9ADzZLV7lfB g==;
X-CSE-ConnectionGUID: /rE8b8rqT1yk3MR76W+0Yw==
X-CSE-MsgGUID: J6CjXsM7Q+KH7xTHzQdftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758430"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758430"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:19 -0700
X-CSE-ConnectionGUID: 3aJUBaudTLyu0+hQ9p+J7g==
X-CSE-MsgGUID: gWdDSQIISIKkzll+hi9NYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132201574"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 10:48:18 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/3] BMG PCIe Gen4 downspeed attributes and usage
Date: Thu,  3 Apr 2025 23:17:39 +0530
Message-Id: <20250403174742.1294227-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series exposes sysfs attributes for BMG PCIe Gen4 downspeed
and documents their usage.

v1: https://patchwork.freedesktop.org/series/147023/

v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
    Rework macros and their naming (Rodrigo)

Raag Jadav (3):
  drm/xe: Move xe_device_sysfs_init() to xe_pci_probe()
  drm/xe: Expose PCIe Gen4 downspeed attributes
  drm/xe/doc: Wire up PCIe Gen5 update limitations

 Documentation/gpu/xe/xe_firmware.rst |  6 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 97 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c          |  6 ++
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
 drivers/gpu/drm/xe/xe_pm.c           |  5 --
 5 files changed, 110 insertions(+), 9 deletions(-)

-- 
2.34.1

