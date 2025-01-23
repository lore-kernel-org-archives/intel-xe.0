Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B3DC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0510E147;
	Thu, 23 Jan 2025 04:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HK3vc792";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7632910E147
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737605989; x=1769141989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wpfQQiDwPkBcGzVllHiTFJefl9ehIU88uIp2X8dLiG8=;
 b=HK3vc792SJNvTrkR/JZKb+/kmhsDb2HXIsGFfYaiiVv3MHqBFrvdpsUs
 OEx1uUAoTkf/s+T8UW/LS2cjSri67kOxANt6eDKjX+NV2bdIGv4SZPn8z
 pcZBDkXj70M0M6NwwBJ48XROasA+1VFTCHo8mGcABMGCKP9oflSndMgRX
 YI2AzZSjVG5AxFN31cSJNYOYxxhV2z5Yy6AScxscApPNE4VqbBtx3WrU9
 hd2ifiC2q44//4j3+T4EJK4e2JB4F2MzyOkkYif8N+dsGAp4eTD0IYWef
 L7lBtCXwQmHl2+7kFy+qg8nlpDBdcFZz+IMq7SBawYL3/WPkJZO2GBlo+ A==;
X-CSE-ConnectionGUID: 9TawJv9CR4ufylkvmlEOvg==
X-CSE-MsgGUID: w1VuweZLSYSQslvkTHO4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37971639"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37971639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:48 -0800
X-CSE-ConnectionGUID: UK1W15HGSQa66UztOFj5Qg==
X-CSE-MsgGUID: r4jxoB5KQ6uR+oHhAb5xRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107202052"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v15 0/6] drm/xe/pmu: PMU interface for Xe
Date: Wed, 22 Jan 2025 20:19:17 -0800
Message-ID: <20250123041923.1892837-1-lucas.demarchi@intel.com>
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

I tested this on Lunar Lake and ADL with and without workload running
and the gt-c6 residency seems reasonable.

v13: this only has 1 event as Vinay said he will rebase the
frequency event on top.

v14
  - simplify the gt-c6 event: no more estimate based on suspend time
since we can't take the spinlock. A simpler version is to get runtime pm
when initializing the event and putting it back when it's done.  In
future we can come back with fancier things that don´t block the runtime
pm.

v15:
  - clean up no longer needed include files
  - drop no longer needed struct members
  - drop patch adding PMU_EVENT_ATTR_ID_STRING: this can be done later
    on top if desired, converting more drivers. There's no pressure need
    to be different than the other drivers. Instead, do the attributes
    similarly to drivers/iommu/intel/perfmon.c, but still keep a single
    macro to define both event, scale and event group

Lucas De Marchi (4):
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
 drivers/gpu/drm/xe/xe_pmu.c          | 361 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  18 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  39 +++
 6 files changed, 427 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.48.0

