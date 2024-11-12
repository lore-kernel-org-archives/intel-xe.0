Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5EDD42BAB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 16:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035D10E13D;
	Tue, 12 Nov 2024 16:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGRAtV04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FC610E13D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731429053; x=1762965053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yYBgaqHrJ1nCXTp+W09rPDJjxKsccKPKr9zCpUEa4hc=;
 b=FGRAtV04Ro8PxkC7bQ1pmy+gnt8i+eqZ+6pnvpraWzO9r0kGq/6Ks63w
 BLf6bHTljpxgg33gunGuiySKROfMVNrB8/2sXxMKI12NT/nUSkndv7UbK
 BT1gHyqMDx3RDCKc0gu17QH2JCvKMfMSw897AAhnqpV0i7Tig671ho/qN
 9zG8iHN9nfQe78ukOTh7a+07MyXkhQoGsB+U8OGwZKtn3+DapQqz8Ac6e
 VjHmXbjeNSVZqR64hEudycw+F+EY+fOm6uk8/jhfoVkyP88kZes1eTie+
 BqIWeQSSbB3jDuCd33zhufhuFekYmSyWhXyJDFO9kcilwnjru4/0cNdAD w==;
X-CSE-ConnectionGUID: zOdzTSeYTLCH1VWSV2dyJw==
X-CSE-MsgGUID: nTACCSdOSbG10q/R5u7R4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31446439"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31446439"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:30:51 -0800
X-CSE-ConnectionGUID: XrkiueLGSwCKbCTQVvWMFA==
X-CSE-MsgGUID: 4F+XVfZBS/6ubuWAftuxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92495814"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:30:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 0/2] Support BMG PMT features for Xe
Date: Tue, 12 Nov 2024 11:30:33 -0500
Message-ID: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
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

Addressed review comments for the Xe driver udpates.

Michael J. Ruhl (2):
  platform/x86/intel/pmt: allow user offset for PMT callbacks
  drm/xe/vsec: Support BMG devices

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  19 ++
 drivers/gpu/drm/xe/xe_device.c             |   7 +
 drivers/gpu/drm/xe/xe_device_types.h       |   6 +
 drivers/gpu/drm/xe/xe_vsec.c               | 232 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h               |  11 +
 drivers/platform/x86/intel/pmt/class.c     |  10 +-
 drivers/platform/x86/intel/pmt/class.h     |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |   2 +-
 include/linux/intel_vsec.h                 |   3 +-
 10 files changed, 285 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

-- 
2.44.0

