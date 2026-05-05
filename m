Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5496DCD3430
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F113410E0F1;
	Tue,  5 May 2026 09:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct0rprXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F8F10E0F1;
 Tue,  5 May 2026 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777972616; x=1809508616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O/+F1FuTyMlqTiyDMdls+PKaIOICmHcg65+7XwlYPg8=;
 b=Ct0rprXELeUYjoDmfcRAfuqe9dK/uj3RH5orQC0AdQgdAP+XZf7oldsH
 3s1JnjSZ3vZWs9s8pOXk9swpBLL85o6fBCersnaxvXz2q4X6eqGFzFbgB
 Y9RIEqSmw2cav3Y3kGSUczwL60EnClHAVia7TUcMP7jpka/9+GUiIdKCB
 rUGBv1zfi3t4Pfawpk3bzqQ4Rh4R55AivLkytEcCAqImMEMz1c4s9dkZV
 ICnSLRCKzoZ2IrGR5QIAzK9LfGTAGHs6ov2yGJcsOpZCsLHiTxwguG+/e
 I/0G5ZbE08M5PNZG8gTwqT3WXFrdXmufmRlBMhWpsQrFDxdmR0E7LNpMV A==;
X-CSE-ConnectionGUID: M8DrBZJ5QP+LywYQKKtnsQ==
X-CSE-MsgGUID: XG9oJZHJSke5kiCJMyfTMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78887960"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78887960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:16:55 -0700
X-CSE-ConnectionGUID: Y1O+9djhR4WGSJB4bIr9tQ==
X-CSE-MsgGUID: xfAyxY/dSxGVofW8pghd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="234752496"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.55])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:16:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
Subject: [RESEND 0/4] drm/i915/display: start switching to display specific
 reg types
Date: Tue,  5 May 2026 12:16:44 +0300
Message-ID: <cover.1777972548.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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


Jani Nikula (4):
  drm/i915/display: add typedef for intel_reg_t and use it
  drm/i915/display: add struct intel_irq_regs and use it
  drm/i915/display: add struct intel_error_regs and use it
  drm/i915/display: define and use intel_reg_{offset,equal,valid}()
    helpers

 drivers/gpu/drm/i915/display/g4x_dp.c         |  4 +-
 drivers/gpu/drm/i915/display/g4x_dp.h         | 10 ++--
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h       |  6 +--
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_color.c    |  4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  6 +--
 drivers/gpu/drm/i915/display/intel_crt.h      |  6 +--
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 26 +++++-----
 drivers/gpu/drm/i915/display/intel_ddi.h      |  6 +--
 drivers/gpu/drm/i915/display/intel_de.c       | 30 +++++------
 drivers/gpu/drm/i915/display/intel_de.h       | 48 +++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +--
 drivers/gpu/drm/i915/display/intel_display.h  | 10 ++--
 .../drm/i915/display/intel_display_device.c   |  2 +-
 .../gpu/drm/i915/display/intel_display_irq.c  | 20 ++++----
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../i915/display/intel_display_power_well.c   |  8 +--
 .../drm/i915/display/intel_display_reg_defs.h | 35 +++++++++++++
 .../gpu/drm/i915/display/intel_display_regs.h | 50 +++++++++----------
 .../drm/i915/display/intel_display_types.h    | 12 ++---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 50 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 14 +++---
 drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  6 +--
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 28 +++++------
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  8 +--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 32 ++++++------
 drivers/gpu/drm/i915/display/intel_dsb.c      | 22 ++++----
 drivers/gpu/drm/i915/display/intel_dsb.h      | 10 ++--
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      | 12 ++---
 .../drm/i915/display/intel_fifo_underrun.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 +++++------
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.h     |  6 +--
 drivers/gpu/drm/i915/display/intel_mchbar.c   | 14 +++---
 drivers/gpu/drm/i915/display/intel_mchbar.h   |  8 +--
 .../gpu/drm/i915/display/intel_pch_display.c  | 14 +++---
 drivers/gpu/drm/i915/display/intel_pps.c      | 38 +++++++-------
 drivers/gpu/drm/i915/display/intel_psr.c      | 36 ++++++-------
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_sdvo.h     | 10 ++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  4 +-
 drivers/gpu/drm/i915/display/intel_tc.c       | 10 ++--
 drivers/gpu/drm/i915/display/intel_vblank.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 10 ++--
 drivers/gpu/drm/i915/display/intel_vga.c      |  4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        | 16 +++---
 55 files changed, 377 insertions(+), 342 deletions(-)

-- 
2.47.3

