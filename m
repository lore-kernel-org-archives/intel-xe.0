Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1E3FB44B2
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E566810E3F1;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2h7//Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973CC10E11F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=8c4VY+N9mvr+rPWDycTMlX5o1eACOoumd4WAj5eH/oE=;
 b=I2h7//AfNC2i2XfHiezsFnjxPsarO8A9CM0xU7qL6U7kyvGz5893jv8I
 MHSOvLtzYsDg0d5qgGFRJcmeZi+DYeBwZstu6tPHmkYkauP7BFnZ929Iv
 YLiRFYAdYvEgnBGzqrvlTr5lRvTP1x6j8ZWnGkJ62X+8nXc94bTTwt/KV
 MX6ucujIMQ+MNWT6YcHDYD/sU5/uTrbOXh08SpHeYiMTUopc3O+1Yd5Sn
 77VVQ2ekAp+mH8VVXrhPnTzavsSMwhwsZ4i4lhYCT+ioMNY8s6a8psTDQ
 xWH5B0xDGzF9qaGxTb6eBO6RBG3ue4MqNfusWGPMtv0KuM0ZaXrNQRjfD w==;
X-CSE-ConnectionGUID: yBdlnOJQRF2+usyqqSH0tw==
X-CSE-MsgGUID: yScKIdO8RZaefH99oDHu0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633994"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: 2HDlGQEkShupQvqrqtfAxA==
X-CSE-MsgGUID: kUpEEi3XSTOWtpS+nEcTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560122"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 00/10] Engine initialization cleanup
Date: Fri, 24 Apr 2026 13:48:10 -0700
Message-Id: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMyw6CMBSE4VchZ21NWy4BV7yHYYE4wkm0JW1tN
 KTvbiVuXP6TzLeRh2N4OhUbOUT2bE0OfShoWkYzQ/A1N2mpG1lJLWBmNhAe4bkKNE1bK93VUC3
 ly+pw49fOnYfcC/tg3XvXo/quP0iX/1BUQorLOHaVVBVK1D2bgPtxsg8aUkofp618TKgAAAA=
X-Change-ID: 20260402-engine-setup-e66851295e18
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=8c4VY+N9mvr+rPWDycTMlX5o1eACOoumd4WAj5eH/oE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eTg6sMC6qoje9biQx8zVMnv/xLe/kqUD/i3
 5Y2MEya1QOJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXkwAKCRBNeSQFyHKQ
 BNJ/D/99c2uTOe2dr+akQt5LpW7AuVgFRqLY6dnQahCm3v5c015v6pI+MK/HQWGzWT25Gq0BbiE
 W7a0Sf3diqOUqTRqwbIAKvjnktJtmeqElo/mz4UGxqxvHT6G8LRBuvGOUlPVq7oeOCavZ1loWXZ
 8ywqW/i2V01LHqFa/0bEYTpIq3pROIg4q6poSFmAH6ytiJM3DisqOEuh3drxEgKrO76BUcEutj6
 KLgIRn+gEW+zNQ4nv0aRBmYas+Cl1uF3hm73XyC0NQqbGFvnvtdNZmAjwM7Ae78GVdW8dlGk9Hn
 EZdJH19arK9M8Hzk/EeGUUACZxjedH/j9/pnl/PpgdWmDo2QJHEtG1/FT+WCaeRa4nEt9MAmT03
 6K7wma6eBF4RJJE6j7UEHeUqBekSjJUL9XBXFLQ2v3JTexiYKH7guSYYDirZEKtS42uOCyiX7uY
 3g0BVPixb5lrbwcD3EKZnW1SfmVw4Gqe6k4NdMe8GucNmhW5nfWs3saV25ud6990qm5DW8J6pBG
 PHQ6a2ykaOSdudXHlFRS7QFTvbHpABiEqIDivM4LN84NUmaNwbZ85DmWf/Qtm+u8KC2ewiG3Iis
 JO0kw7pJylXk/HHSrjDRH2/I+FY+Il4WVnvtGXxQVvrF6HLr7m4ciKsQXO2KjSfC4MOo5Or8rCH
 DUBlLuH3W53z9nA==
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
Changes in v2:
- Restrict CCS enablement to Xe_HP and later.  The CCS engine has never
  been enabled on Xe_LP.
- Fix rules on MSI-X enablement to actually use the
  xe_rtp_match_has_msix function added.  (Shuicheng)
- Drop xe_hw_engine_mmio_write32() prototype from header.  (Shuicheng)
- Link to v1: https://lore.kernel.org/r/20260423-engine-setup-v1-0-baa94014e3e5@intel.com

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
 drivers/gpu/drm/xe/xe_hw_engine.c        | 83 +++++++++++++-------------------
 drivers/gpu/drm/xe/xe_hw_engine.h        |  1 -
 drivers/gpu/drm/xe/xe_lrc.c              | 20 --------
 drivers/gpu/drm/xe/xe_rtp.c              | 15 ++++++
 drivers/gpu/drm/xe/xe_rtp.h              | 24 +++++++++
 10 files changed, 82 insertions(+), 93 deletions(-)
---
base-commit: 6784fa94a98ae6fceef9c2c171c3e9fb8be6585f
change-id: 20260402-engine-setup-e66851295e18

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

