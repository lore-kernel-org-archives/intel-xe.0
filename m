Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BDFCA0FF2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 07:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFED10E11A;
	Wed,  3 Sep 2025 07:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meqFYDGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AAD10E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885930; x=1788421930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdNdT4h2Oc0EFRwt8g29KfZMzwaT30SW5hT7WinTgZc=;
 b=meqFYDGgS0vZunwseQACfZfFmullpflcCHV/brDy7m7PXCjpE2aF7rLd
 oy5BsPe/y9jPgju//OlzuXMkGm9GYupWGqwFKIHvIjmNT7N7YAZLl4bX6
 XBnYx1smk/ullkpaOBTQE68XlpRQr3i9KWfbq66+EMK3ebMLN1tLdBFXd
 0SOyZJvzI9anSHPyH3hHczR66rSebnN1QfOHWdvDdE/n7pVXr6k3cnMYn
 mouv6XcwbMnA10EL3j8c3i+rv6ilu8T85Hn4dGg16OIkvTmOUGtzfDvhe
 vCxTMPiKWpoKM+vO8TxIfurjMrlGbbusD8vaSXGqaFzWhA9J3ZlRDBhX8 w==;
X-CSE-ConnectionGUID: 49RHeBrDTgWIPH2K5hsyFg==
X-CSE-MsgGUID: DNUIi/EdTUi+Ggt0m9K++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59126069"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59126069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:52:08 -0700
X-CSE-ConnectionGUID: sqd3j1rtQEKwbxY8KrkaiQ==
X-CSE-MsgGUID: VYqBtSIuRMeeK+jAl8r9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171396605"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 00:52:07 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 0/2] Add GPU frequency tracepoint
Date: Wed,  3 Sep 2025 13:15:26 +0530
Message-Id: <20250903074528.69159-1-s.sebinraj@intel.com>
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

Add a GPU frequency tracepoint at the DRM subsystem level.
Integrates with the Xe PMU to provide frequency tracing.

The tracepoint is exposed at:
 /sys/kernel/debug/tracing/events/power/gpu_frequency

 Format: {unsigned int state, unsigned int gpu_id}
 - state: GPU frequency in KHz
 - gpu_id: GPU clock domain identifier

S Sebinraj (2):
  drm: Add GPU frequency tracepoint at DRM level
  drm/xe: Add DRM GPU frequency tracepoint to Xe

 drivers/gpu/drm/Kconfig                   | 11 ++++++
 drivers/gpu/drm/Makefile                  |  1 +
 drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
 drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h    | 14 +++++++
 drivers/gpu/drm/xe/xe_pmu.c               | 26 ++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h         |  4 ++
 7 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_freq_trace.h

-- 
2.34.1

