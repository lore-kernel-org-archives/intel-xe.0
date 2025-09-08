Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3DCAC586
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 13:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B1510E27B;
	Mon,  8 Sep 2025 13:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoSzpAjb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6668210E27B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336639; x=1788872639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdNdT4h2Oc0EFRwt8g29KfZMzwaT30SW5hT7WinTgZc=;
 b=XoSzpAjbN7BI/SPX8VOmZqAa7IHdwS4M4cMtwidMjdOxThnZLLcypxe/
 p8rr2c308QF06pUHnWECv1neVwCMi8P82GHppkgh6qH/tqUg8d1kfrQ7n
 BJ0W0Twaf0f/9YrbcoJ7X1k7Y1O1R8DuiTlDM0abzaoDlH4ZAebmfC1/d
 SYuUrKOJDSSWTQl7TVO4wU1WMk4gMYqG6pNo0FrqNN/9zlZ0xqAQT3hQF
 mWOqD32LO46iWrYmbol/8pCPNX9UbDw0uL/Yzt/rphiw5P//aMyy7N7WG
 Ji6+vN8d8ql7uqit/pcKhKFHZy0uye4Eif9a6Cu3zQWYrMX5UNtvdXIwD w==;
X-CSE-ConnectionGUID: SvEJtj38QIauj2uiUehZnQ==
X-CSE-MsgGUID: YEYcnmH9T+qsPHXYqgRVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70293282"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70293282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:03:59 -0700
X-CSE-ConnectionGUID: 1AxQ+sMgQK+t5xtW2Q1fZg==
X-CSE-MsgGUID: nqYig4CzRP2PbSUODDVKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173578446"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2025 06:03:58 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v2 0/2] drm: Add GPU frequency tracepoint
Date: Mon,  8 Sep 2025 18:26:31 +0530
Message-Id: <20250908125633.2680617-1-s.sebinraj@intel.com>
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

