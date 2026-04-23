Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B908FDEE28
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FFB10E12F;
	Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6sGSo/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A768F10E107
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984548; x=1808520548;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=S9LNcJqQGbS6+5mx3uNc8Lykv/OCulyPy+UKH+zSiRg=;
 b=L6sGSo/O4aDHDKd8HFDaCyL83W3EqWegmOPhCbao8zUK7IQ9L07zaQzm
 o/zlHDtaiG9R3Yi/6reIiid4ohjJ+pveVjs65YlUinWvFJDXL/F7gydEq
 GSz2B14YBL5xFoBC6C9tnNlc6RO1glUdiI7ib7Wu3n/wawV2DvkNi6fVS
 lPgZfWFDxVty9qdp+ecAFP0W1Ph5vinRhapXUiTwP91oQ7kdJ34Zmou93
 3ttSou7n2DTNj1XA8ihu6UoZUAXrRMfKffHdFX5/75oMXq1e0LYF4qDSD
 2RbMWS4sRfrjbx86Z4hzZ4MkHybA+lJHd6bZIZlxCWV+GfyJHgNWWxM3A Q==;
X-CSE-ConnectionGUID: vfI4X90ZR0WgLmUta92UNg==
X-CSE-MsgGUID: BfmAQPwHRqSEfL7rIooT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497061"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:07 -0700
X-CSE-ConnectionGUID: WWdHSUU+RUCqtvhJ0rcPtg==
X-CSE-MsgGUID: D8K+S1hCQma+Drg3QD+adw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696178"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 00/10] Engine initialization cleanup
Date: Thu, 23 Apr 2026 15:48:47 -0700
Message-Id: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBG4avIrBtQSamuEi2i/mo2FloRSHdPW
 n6L9zIlREGiTmWKuCXJHgpMpWjaxrCCZS4mq63XtbaMsEoAJ5zXwfC+cca2DqahkhwRizz/rh/
 e9wMX6WvDXgAAAA==
X-Change-ID: 20260402-engine-setup-e66851295e18
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=S9LNcJqQGbS6+5mx3uNc8Lykv/OCulyPy+UKH+zSiRg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHd41lxGMrWLAfyhlYVl6cQd3ufxSMpWH93P
 TOy7dt2HXyJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3QAKCRBNeSQFyHKQ
 BGrSD/9dszqnHfGfgcwHLve7ERZxef6OBVWPPiU0WdPES7j1JvQs+8OiKP1h5V+cEX3CP3v/4Xk
 wziQXeopHa7OmGo97Yy7KN7w9KAQPP30QGHkvVF8TdhbMdFJHjkgfAwlIneHUv1hIDCD+veQMgW
 PxUa4/rw3aw/pvkyUAJ7ztmyyx0K00ZFpOdqwnoRKNmqqXtzaph9o7yrQgO1yieeiHBDhNl6d5D
 Pkndh6zL9hVRG5Zp2APRqkJFBdefW7i460s0lSsC8ykOGLqKbSFEiHPfcoIwTn2QQWhlkL2XEkK
 3tE7dYmSoK9ae0sEmi3vF3eYe0ukzj9N3FiKJg9w+47BuW4ZzBMy8XSEMLtSH1unnByNtVQn6IP
 CzUvkxtd0DL3KNEDTWkI9HAqJ9AGHeCaaPiAyzxwybZo+y8I5vt3j7cKDfAyYqS1xTRkvWtwN0j
 2KB6+haqRk01lrkp7WK8jxgY9fn4UK+N/iRfYVT93PtzCpKelTLLeg20LSR30cvhXB68XHSL5hr
 AqpTskPjOMWuAePFuHr6fbXa81rvlZtWV/J6f3FVrTQPk9sjrIN219R8uQ2phFwcsekBT97jVa7
 1aOs2q03MNjMyW7BMKGUE6cilwKl1Fv/gGauBP6rMzyhnlTvpFn+E10DP7lu1ClXJyF9nf4Fwto
 6QYjynDzZ4yVTHQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

A lot of our engine initialization code was inherited from i915 and
hasn't received too much cleanup since that time.  There's also some
inconsistencies between the main initialization path used on all
platforms, and the vestigial execlist code which isn't actually used but
still remains in the driver as dead code for now.  Let's clean things up
a bit and, where possible, move the required engine programming into the
RTP infrastructure so that it will be applied on both initialization
paths, and be dumpable/checkable via debugfs.

There's some more restructuring that should happen to more clearly
distinguish software state initialization from hardware initialization
(and re-initialization on various resets & suspend/resume), but I'll
leave that to a follow-up series to prevent this one from getting too
complicated.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Matt Roper (10):
      drm/xe: Move CCS enablement to engine setup RTP
      drm/xe/rtp: Add "always true" match function
      drm/xe: Stop programming BLIT_CCTL on Xe2 and later platforms
      drm/xe: Move HWSTAM programming to RTP
      drm/xe: Fix name and definition of GFX_MODE register
      drm/xe: Const-ify parameters to xe_device_has_* functions
      drm/xe: Move GFX_MODE programming to RTP
      drm/xe: Drop unnecessary STOP_RING clearing
      drm/xe: Drop xe_hw_engine_mmio_write32()
      drm/xe: Mark BCS engines as belonging to the GT forcewake domain

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  5 +-
 drivers/gpu/drm/xe/xe_device.h           | 14 +++---
 drivers/gpu/drm/xe/xe_execlist.c         |  9 ----
 drivers/gpu/drm/xe/xe_guc_ads.c          |  2 -
 drivers/gpu/drm/xe/xe_guc_capture.c      |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        | 82 +++++++++++++-------------------
 drivers/gpu/drm/xe/xe_lrc.c              | 20 --------
 drivers/gpu/drm/xe/xe_rtp.c              | 15 ++++++
 drivers/gpu/drm/xe/xe_rtp.h              | 24 ++++++++++
 9 files changed, 81 insertions(+), 92 deletions(-)
---
base-commit: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4
change-id: 20260402-engine-setup-e66851295e18

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

