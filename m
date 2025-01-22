Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A76C0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC82910E27F;
	Wed, 22 Jan 2025 06:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SedkR/eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697F10E148
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737527053; x=1769063053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIzMmMXdqNF/U4P/jcOg61H5rcc17JRCY5BvaYXB8dg=;
 b=SedkR/eP6iqelDPhbLIOeldcF1pEQWc17oQ8uSpNhKsYSvKkqtNlQ/YN
 rAC9KZ6QMogAq1NB7W0Pww+/YlVCAywMzIG4gwmfim34TExbLnEPYuY8p
 2aqJsFJ9f3SgSz5f2W150JylnQMTERhwqnJ667ECU54KZ9hfONUG75xnJ
 YLES+CvlDnbeQxMK9NKl+VdE86eqAUYrhXIpHxpf2acGYbiGn9FV46Bi9
 LCVbukws2p47K+unYZJt7oJpmCsuuC09n+TbDoMh+7RxAAsmWIRWcteY/
 lUCFE7p35XsNEJNT2f+OaqZkAaXbuZ8FLR5jnB7y4D2hDZvYYXPPZR2vo Q==;
X-CSE-ConnectionGUID: 6+Jq3AJERLeUUmyHjzRjjg==
X-CSE-MsgGUID: Aj+PAg0+T8KRE3fDq9NkvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41643287"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41643287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
X-CSE-ConnectionGUID: 5yjvBXH5RGS/VyqGr8NX6w==
X-CSE-MsgGUID: PbfQ74WkSOKmcetZIe0vGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112015649"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v14 0/7] drm/xe/pmu: PMU interface for Xe
Date: Tue, 21 Jan 2025 22:23:34 -0800
Message-ID: <20250122062341.1100173-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Previous versions: https://patchwork.freedesktop.org/series/139121/

For perf/core: first patch adds a new macro in include/linux/perf_event.h.
If it's ok, I'd like to merge it through the drm branch so we can add the
pmu implementation to the xe driver. I'm also Cc'ing linux-perf-users@vger.kernel.org
on the other patches to show its usage.

For "drm/xe/pmu: Enable PMU interface", previously from several authors,
I squashed several changes I suggested in the past to clean it up and
reduce boilerplate code that resulted from copy-paste from i915. More
detailed changes can be found at
https://gitlab.freedesktop.org/demarchi/xe/-/tags/tip-xe-pmu-v13

Compared to v12 this only has 1 event as Vinay said he will rebase the
frequency event on top. I tested this on Lunar Lake and ADL with and
without workload running and the gt-c6 residency seems reasonable.

v14 simplifies the gt-c6 event: no more estimate based on suspend time
since we can't take the spinlock. A simpler version is to get runtime pm
when initializing the event and putting it back when it's done.  In
future we can come back with fancier things that don´t block the runtime
pm.

Lucas De Marchi (5):
  perf/core: Add PMU_EVENT_ATTR_ID_STRING
  drm/xe/pmu: Assert max gt
  drm/xe/pmu: Extract xe_pmu_event_update()
  drm/xe/pmu: Add attribute skeleton
  drm/xe/pmu: Get/put runtime pm on event init

Vinay Belgaumkar (2):
  drm/xe/pmu: Enable PMU interface
  drm/xe/pmu: Add GT C6 events

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_pmu.c          | 360 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  20 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  47 ++++
 include/linux/perf_event.h           |   7 +-
 7 files changed, 441 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.48.0

