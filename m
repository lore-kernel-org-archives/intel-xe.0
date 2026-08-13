Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CDC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA27910E488;
	Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUizGhaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9AD10E480
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786579619; x=1818115619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dj6W9zy49RlDFNBql2j6ufJCKXsIC1KEq904OcJC3Fg=;
 b=SUizGhaWNg6aN3J4235lme/D3i2UFnXaIbMQmHtPOMXc0PWbFKu6yA0i
 vqfbmAEDF94sekIiNaNBUFDgKGQt0Ij6FxbuZCEKkORaIBqoiVabOc8vE
 A09gFbrtBzTBc/4JuWsJZMdC3Y6cjHnPyPH7kljuXaeTdScFoJ0Mgcm81
 qFlirYR9I/HGv9jrmf7FByqESQt/oILdKT4/wf2nN/x0UlLs5v8fkAMdm
 fNHsHXafWC4xfxxxP3pBZEGq/TlrJIxrw+Y56josTDiigKhhs0MNOTbJq
 6AZSMUQ/EOE0Wm0s4KahnhVKlROFKipf3Q6TkGO4Dj/hzawjHbYrZHO12 g==;
X-CSE-ConnectionGUID: VCO2FKi5RjS2eAodO2mQMQ==
X-CSE-MsgGUID: DJWrPU9VS5WNN0epVpwdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89670928"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="89670928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 17:06:58 -0700
X-CSE-ConnectionGUID: MSwMoXj+SY+htwT/KqMlCA==
X-CSE-MsgGUID: UgXCj4kXQtW+5xFg8a9Efg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="302048058"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 17:06:58 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v5 0/4] drm/xe/forcewake: add delayed-release optimization
Date: Thu, 13 Aug 2026 00:06:50 +0000
Message-ID: <20260813000654.2712317-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
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

Engine-cycle queries used by tools such as VTune and PTI can arrive in
bursts. Releasing forcewake immediately after every query makes the next
query issue another wake request and wait for its ACK.

Add an opt-in delayed-release path that keeps an idle forcewake domain
awake for a configurable interval, allowing a subsequent engine-cycle
query to reuse it. Other forcewake users retain the existing immediate
release behavior. The default hold interval is 100 us and can be changed
through configfs before binding the device.

The series also synchronizes engine-cycle queries with unplug and flushes
pending delayed releases before suspend, shutdown, remove, and probe
unwind, ensuring timer callbacks cannot access MMIO after power-off or
teardown.

On BMG, this reduced the Level Zero timestamp median from approximately
48.5 us to 9.4 us.

v5:
 - Split the original patch into four patches: unplug synchronization,
   delayed-release infrastructure, power-boundary flushing, and opt-in
   enablement/configuration.
 - Preserve a newer hold interval when an older timer callback is running,
   and settle an outstanding sleep ACK before waking a domain again.
   (Sashiko, Matt)
 - Synchronously cancel delayed-release timers during forcewake cleanup.
   (Sashiko, Matt)
 - Flush delayed releases during shutdown, device removal, and
   post-registration probe unwind in addition to system/runtime suspend.
   (Matt)

Zongyao Bai (4):
  drm/xe/forcewake: synchronize engine-cycle access with unplug
  drm/xe/forcewake: add delayed-release state machine
  drm/xe/forcewake: flush delayed release at power boundaries
  drm/xe/forcewake: enable configurable delayed forcewake release

 drivers/gpu/drm/xe/xe_configfs.c         |  72 ++++++++
 drivers/gpu/drm/xe/xe_configfs.h         |   5 +
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |  16 +-
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 211 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_force_wake.h       |  46 ++++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  68 +++++++-
 drivers/gpu/drm/xe/xe_gt.c               |  12 +-
 drivers/gpu/drm/xe/xe_query.c            |  36 +++-
 10 files changed, 437 insertions(+), 33 deletions(-)

-- 
2.43.0

