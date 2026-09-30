Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC44CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 22:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9D710E24E;
	Wed, 30 Sep 2026 22:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Th4Fsjtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0810E1D0
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790806104; x=1822342104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gK7dDYKsr8yMk3HzqNGMH93vME/9GqZJPaVCbB9hmdg=;
 b=Th4Fsjtq/AqKPL4iRkUV8FFeTEQfXKEngt+D4Y56+b8Pj0VhRcHNi2MF
 Bhr5dp3iN5i1Q+fjhyYLWlSVe5W5nNHaVOBSpUu/9PziBMNVkXpOME4jR
 aecZRsyCpb2sSyJzphnS4OVqmFHLzAjpGIoNXpn9UVWsmSNQHICHfD6O/
 AiBDmheACMZhaio4lhsEIMiM8zD6LU8myltJcd2wp1dkHT1zF+QXT8sno
 3komfkzkvf8afB4fOw7cqt97g2hGp5K48KUS6MKgkkgOSUED3eZO7RZy2
 B3hYjbU8I/lNGy1h4OXKJZxAkgrsi6YYUcdB6VQrLgAo3glIx2v9VO16d A==;
X-CSE-ConnectionGUID: 24Ox1fYsSAOBeArfWE7wpQ==
X-CSE-MsgGUID: po7yEJ+xRnSbE83MqFAqyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117084163"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="117084163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 15:08:23 -0700
X-CSE-ConnectionGUID: HZCg9Yq8TOW9irqp2yzUKQ==
X-CSE-MsgGUID: 2T3oJ/DxQL2ZUxkE2DMcng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="279607842"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 15:08:24 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, rodrigo.vivi@intel.com,
 "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: [PATCH v10 0/4] drm/xe/forcewake: add delayed release and lifecycle
 handling
Date: Wed, 30 Sep 2026 15:08:16 -0700
Message-ID: <20260930220820.2184643-1-zongyao.bai@intel.com>
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

From: "Bai, Zongyao" <zongyao.bai@intel.com>

Engine-cycle queries used by profiling tools such as VTune and PTI can
arrive in bursts. Releasing forcewake immediately after every query makes
the next query issue another wake request and wait for its ACK.

Add an opt-in delayed-release path with a bind-time configurable hold
interval, defaulting to 100 us. When the final overlapping forcewake
reference is dropped after a delayed-release request, keep the domain awake
for that interval. A get for the same domain before expiry cancels the
pending release and reuses the awake domain without another wake request or
ACK wait.

Only engine-cycle queries request delayed release. Existing callers
continue to use the immediate-release API. Delayed-release state is per
domain, so a put that drops the final overlapping reference honors any
recorded delayed-release request.

Protect engine-cycle MMIO access with drm_dev_enter()/drm_dev_exit() so
drm_dev_unplug() waits for admitted queries to drop their forcewake
references before teardown. For system and runtime suspend, synchronously
drain delayed state while keeping delayed release available after resume.

For shutdown, removal, post-registration probe unwind, and devres teardown,
permanently disable new delayed releases and settle pending state with
xe_force_wake_stop(). Register the device-wide stop action after the
Driver-FLR action so reverse devres ordering settles delayed forcewake
state before Driver-FLR while MMIO is still valid. Keep the per-GT cleanup
as an idempotent fallback for earlier probe failures.

For PCI error recovery, use xe_force_wake_stop_nosettle() before
pci_disable_device() on reset and on paths returning
PCI_ERS_RESULT_DISCONNECT. It disables delayed release, cancels timers, and
discards delayed-release bookkeeping without accessing MMIO.

v10:
 - Please ignore v6~v9 in this series:
   https://patchwork.freedesktop.org/series/167697
   Those revisions used incorrect Root msg-id(s) by mistake.
   Created v10 to clean up the threading mess in previous revisions.
   No functional changes relative to v6.
   Rebase onto drm-xe-next at fa8b3b6c4a4b.

v6:
 - Add a permanent delayed-release disable state and clear stale recorded
   requests on the immediate-release path.
 - Keep flush for system/runtime suspend and use terminal stop for
   shutdown, remove, probe unwind, and devres teardown.
 - Order the device-wide stop before Driver-FLR while retaining per-GT
   cleanup for earlier probe failures.
 - Add a no-MMIO stop for PCI reset and disconnect handling.
 - Use the configfs group lock when reading the hold interval.
 - Document the per-domain drain and discard state transitions.

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
  drm/xe/forcewake: quiesce delayed release across PM and teardown
  drm/xe/forcewake: enable configurable delayed forcewake release

 drivers/gpu/drm/xe/xe_configfs.c         |  78 ++++++
 drivers/gpu/drm/xe/xe_configfs.h         |   5 +
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |  33 ++-
 drivers/gpu/drm/xe/xe_device.h           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 337 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_force_wake.h       |  48 +++-
 drivers/gpu/drm/xe/xe_force_wake_types.h | 123 +++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  18 +-
 drivers/gpu/drm/xe/xe_pci_error.c        |  23 +-
 drivers/gpu/drm/xe/xe_query.c            |  81 ++++--
 12 files changed, 696 insertions(+), 55 deletions(-)


base-commit: fa8b3b6c4a4b297bf95935065b63f8852cfc5481
-- 
2.43.0
