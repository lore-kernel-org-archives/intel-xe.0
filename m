Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69846C02188
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20210EA22;
	Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EP925q1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE6510EA24
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u7TvqDRwRMY6AHEBtwgMJ/J4HU6CT2rk5v9qE/XEagw=;
 b=EP925q1U2fRp3pUDpcfYfz2kh6YXLuZW7j4VGjJvIC8E/Tn5QkemX63M
 4kCZcvLOKc/4NiHR4DpwfYo0hXFMIaTa9Ta/Ks7PsQAidpYvwNhCuHUWu
 PusEZdW3GFe9ZzRZHexIdcCvdqJqVrD1/roCuBpMLHp/y37C7RE92flfM
 /n5sMKV5ztlpDQ0rkXtuEAxFQuzVLyYuZkLhGZTTmYJTKcYjbzjkDWESn
 1UoJWexEsXUSr5HOo48Q+aD7/UlWzwqjRL+3mLkABjpJvdJQwzSwRkLwQ
 1UMUZ8TY/LMP84TjTi3q3VvbZs5CSbDbF7gEodkZ0+DVCvT30xhhzRE/i g==;
X-CSE-ConnectionGUID: DiXctPHNTbWwQwFWphJAxQ==
X-CSE-MsgGUID: nS1pfS/JRuWYQL08uSC8bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364114"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
X-CSE-ConnectionGUID: 4mJVAkaHRpS6ab4OvDjaGg==
X-CSE-MsgGUID: VniDnga6Rw6+RYykEG2rTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474342"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 0/7] drm/xe/pmu: PMU interface for Xe
Date: Thu, 16 Jan 2025 15:07:11 -0800
Message-ID: <20250116230718.82460-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Previous versions: https://patchwork.freedesktop.org/series/139121/

For perf/core: first patch adds a new macro in include/linux/perf_event.h.
If it's ok, I'd like to merge it through the drm branch so we can add the
pmu implementation to the xe driver. I'm also Cc'ing you on the other
patches to show its usage.

For "drm/xe/pmu: Enable PMU interface", previously from several authors,
I squashed several changes I suggested in the past to clean it up and
reduce boilerplate code that resulted from copy-paste from i915. More
detailed changes can be found at
https://gitlab.freedesktop.org/demarchi/xe/-/tags/tip-xe-pmu-v13

Compared to v12 this only has 1 event as Vinay said he will rebase the
frequency event on top. I tested this on Lunar Lake with and without
workload running and the c6 residency seems reasonable.

Lucas De Marchi (4):
  perf/core: Add PMU_EVENT_ATTR_ID_STRING
  drm/xe/pmu: Assert max gt
  drm/xe/pmu: Extract xe_pmu_event_update()
  drm/xe/pmu: Add attribute skeleton

Vinay Belgaumkar (3):
  drm/xe/pmu: Enable PMU interface
  drm/xe/pmu: Hook up gt suspend notification
  drm/xe/pmu: Add GT C6 events

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   3 +
 drivers/gpu/drm/xe/xe_pmu.c          | 408 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  22 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  51 ++++
 include/linux/perf_event.h           |   7 +-
 8 files changed, 498 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.48.0

