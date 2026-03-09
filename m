Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F836EF36F6
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 07:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739EF10E492;
	Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL+l0wRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C786510E0D8;
 Mon,  9 Mar 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773041556; x=1804577556;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=VauP1ROV92pNMZ/iiYucSS+d65dDT5JM4Zbi/ebIsaY=;
 b=VL+l0wRXFHVwXDxuL54IqiSSrrtBfuiV8i9nKP7o8kycQKUbK67IRlWF
 +IFvSzY7DFoo+aX43vLGFoh96PMabieoeouZhpUe2oszgqxefA7JYYrTw
 pLJegFczLfpzJUniooXRxFWL3GvfBpASVdGxNTHDGVEVw6HsQ8uMYjsSu
 NixWB3V6hXPXkJ89KXlFefpUjwi+kSWzfyjSnQnB8ZNF0MxEpthPFURvy
 4HoYd+LfgeRUklkASzJyatsqWmgQufpjD/9J4WnZmJbSgeTAy7yQg4GY1
 LteJYsRWve/9QggNAHq/ro7IKP/17tgg3Xs7lOnr1D06h4Om6RE92y4Fo A==;
X-CSE-ConnectionGUID: oC2vMM/cQqe3c38kBXaJ2A==
X-CSE-MsgGUID: wRhjnGSySlONFbvr3+8caw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77935630"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77935630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:31:01 -0700
X-CSE-ConnectionGUID: KGrwCQIyT+OAq4NdDxzGsw==
X-CSE-MsgGUID: fGf5GSr+TVmxPWcb6SulNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217286703"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 00:30:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RFC 0/3] Some updates over DP AUX Transactions
Date: Mon, 09 Mar 2026 12:59:23 +0530
Message-Id: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANN2rmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3ZSC+MTSiviSzNzU/NISXcsU0yTDJGPTRIMUCyWgpoKi1LTMCrC
 B0UpBbs5KsbW1AJR6yNFlAAAA
X-Change-ID: 20260309-dp_aux_timeout-9d5b1b35a0d8
To: Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, ville.syrjala@linux.intel.com, 
 suraj.kandpal@intel.com, imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Based on the discussions/comments on the patch
https://lore.kernel.org/intel-xe/aaVWbdt1vOFxGAb1@ideak-desk.lan/
in order to address the real HW(DPTX) generated timeout and adress the
fix, this series is targetted.
Along with this it was noticed that the the AUX power request bit in the
port control register is being touched outside the power well framework.
The limitation due to the way aux port control register was programmed.
Replacing the aux control register write to read/mask/write thereby
writing only the required bits.

Note: This is RFC and full round of testing the pending.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (3):
      drm/display/dp: Export function to wake the sink AUX_CH
      drm/i915/dp: On AUX_CH tx timeout, wake up the sink
      drm/i915/dp: Configure PORT_AUX_CTL and then trigger the tx

 drivers/gpu/drm/display/drm_dp_helper.c            | 36 +++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  6 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 94 +++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_psr.c           | 29 ++++---
 include/drm/display/drm_dp_helper.h                |  1 +
 5 files changed, 123 insertions(+), 43 deletions(-)
---
base-commit: 6884fe03ff2bc5a2f501ba4710f950dd4933ac84
change-id: 20260309-dp_aux_timeout-9d5b1b35a0d8

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

