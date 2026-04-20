Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C939CF5A8B9
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 20:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819D310E740;
	Mon, 20 Apr 2026 20:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8FSEZs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6110E740;
 Mon, 20 Apr 2026 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776716587; x=1808252587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UmYp2/22K/kP9CD9CA1NBmnv1quDYUq0YhB4wzRezec=;
 b=B8FSEZs8YH1EHG3WRi+gFydEc4mv36s+iBEhHInExi1oOAS3QMc2OViD
 1yia7VOXwdYxe1UO63hsnsEDi0z0H9XNyu5FGvRA26TfV/wwUksXhN0wc
 50BvctMWuEzYEBEwo4hLzBEQufx13LUKAyUHyEGXJpz4DPG7uiNPI70la
 yQK62Rc9AxVFVaZr/BI/jPt4HstMSDQkFwpfehLkeo9zFVxG5RIVRhKvg
 CltpKDqford2Qr35NU0Jr9YOSulSNvW0uuH8pK9z6MaWDOvGa2N7PO2Ef
 J3JrewTTXEeJYoamOJSRZW0Fr4SVfnxb2UPW+yp2MpYfYatWtJDePS0qf Q==;
X-CSE-ConnectionGUID: sbTy0winQM2nf2Y9Q5bQmA==
X-CSE-MsgGUID: 5HHBFcVKSB2zPvypGfi0Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77765247"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="77765247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 13:23:07 -0700
X-CSE-ConnectionGUID: 2kLOULWPRU+VdmLC6YHIhA==
X-CSE-MsgGUID: IehZK0qAS5qrfC1vPwaveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="231736555"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 13:23:04 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v4 0/8] drm/i915: move more display dependencies from i915
Date: Mon, 20 Apr 2026 23:22:08 +0300
Message-ID: <20260420202252.3846880-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series continues my work of refactoring the clock gating
initialization, so that i915 doesn't do display-specific stuff.

With this, all register dependencies should be gone.

Changes in v4:
	* Explain why HAS_LLC() is not needed anymore (Jani);
	* Replace intel_display_core.h include with intel_pch.h (Jani);

Please review.

Cheers,
Luca.


Luca Coelho (8):
  drm/i915: move SKL clock gating init to display
  drm/i915: move KBL clock gating init to display
  drm/i915/display: move CFL clock gating init to display
  drm/i915/display: move BXT clock gating init to display
  drm/i915/display: move GLK clock gating init to display
  drm/i915/display: move HSW and BDW clock gating init to display
  drm/i915/display: move pre-HSW clock gating init to display
  drm/i915: remove HAS_PCH_NOP() dependency from clock gating

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../i915/display/intel_display_clock_gating.c | 255 ++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h |  27 ++
 .../gpu/drm/i915/display/intel_display_regs.h |  31 +++
 drivers/gpu/drm/i915/i915_reg.h               |  31 ---
 drivers/gpu/drm/i915/intel_clock_gating.c     | 226 ++--------------
 6 files changed, 331 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.h

-- 
2.53.0

