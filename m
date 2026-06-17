Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D6CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 10:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2410EFA6;
	Wed, 17 Jun 2026 10:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFpBkGWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365610EFA6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693440; x=1813229440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XaqImtsvlR+Jjd7VD1qzYAJR6OM5V5nyhkEwvBvu+fk=;
 b=WFpBkGWv/6vblwPKswdcPCFZQOq+cqZF7wHduF8z2ivmP/Rhl0eSVyXx
 Kcha7vnhfUjr7zcF5M81TPpNgD6aC83kw2wvfyrbMdW2zrt/LMkPp/h1n
 bTZDU9Rj8uFFWYpBJ1Eyh2ohFvYXKbLAJXspV9z464QFiRDVbjMm0M9YW
 pswQY9GrdVITIcvskpMctJl6ROgyVknJUEwPuwr+TTZV6YaZMe6DzIERp
 8GODcOrhlmpelJQwojBALPl9LV2laxHGyI8CwjRrO7uCQcLaK8aCmc5z5
 WBRvKx4bwQJVgh0hQ9zIfCDHe/5BmKr6GMjDg8PHNzXFxUlmI0lU2Sxat g==;
X-CSE-ConnectionGUID: KYZInJNpTtCCHohRkEStbg==
X-CSE-MsgGUID: SS3fMf5CQoy/BdltXKG3mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82677378"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82677378"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:50:39 -0700
X-CSE-ConnectionGUID: DEMKguOpSnepQPeEofKAxg==
X-CSE-MsgGUID: CfgmpL4VR7yuGJpa3T3HJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248099603"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 03:50:35 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v3 0/3] drm/xe: Structured RAS error logging infrastructure
Date: Wed, 17 Jun 2026 16:17:12 +0530
Message-ID: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
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

v3:
- Add HW SIG IDS details. (Riana)
- Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
- Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
- Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
- Make macro function properly.
- Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
- Add sig id documents. (Riana)
- Change macro function same prefix as the file.
- Handle __xe_ras_log() function with variable format.
- Update message in xe_ras_log_wedged().

Mallesh Koujalagi (3):
  drm/xe: Add error Signature IDs for RAS logging
  drm/xe: Add RAS logging helpers
  drm/xe: use XE_RAS_WEDGED macro in xe_device_declare_wedged

 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_device.c  |  13 ++--
 drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sig_ids.h |  29 +++++++++
 5 files changed, 208 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

-- 
2.34.1

