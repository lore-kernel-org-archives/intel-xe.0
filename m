Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1DEC982C1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 00:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F310E363;
	Thu, 17 Sep 2026 00:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrWJdKgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3002610E363
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789603624; x=1821139624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G+G7NevN8Q5sujbG7adMvdaKMOD3QN6OgTx+/8FhDYI=;
 b=WrWJdKgphPhqcos04Mq6KN7sKLLuII2q6HBxr+RELnhX+yrqKAqWON6s
 dYIlRzvGN1yqAvR/eKz9I4wK50yfJrz2dW2GH8eLNt25+vW7mtAIzJdls
 qsk2+TxNVLK3d6KDa3zsYW8O4FL5xmWiWTFvu5pKspWrMtVQ023KqI9tT
 GVmaZ722noOVPzV75gRPXtBnG+gAzHAYOvzgTuv9y/FwjkTx0RXOFm5us
 jvaDJ9eFbAfxL2LdjAQ6mlrk6AK73MM3Ylxn1h2ofkMRlKROHtw8e2Bky
 35nj/cUNrjhofDa7TI01Ig6Qk77i3dA3dXnnZ7+ovsKNrcsBihz6cFHom g==;
X-CSE-ConnectionGUID: WU10Gcd0QrK7GdDQ+Nrxpw==
X-CSE-MsgGUID: Cfx9WT1ySo+N/Sx4/VwQEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101143919"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101143919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 17:07:04 -0700
X-CSE-ConnectionGUID: fDtzjgAgTcSE9rGbt0NZqQ==
X-CSE-MsgGUID: Nv1yviEjTLOh91ejwu9Vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267280394"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 17:07:03 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v6 0/4] drm/xe/forcewake: add delayed release and lifecycle
 handling
Date: Thu, 17 Sep 2026 00:06:57 +0000
Message-ID: <20260917000701.1751733-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720221306.1173028-1-zongyao.bai@intel.com>
References: <20260720221306.1173028-1-zongyao.bai@intel.com>
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

-- 
2.43.0
