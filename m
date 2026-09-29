Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24D3CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 14:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9C210EF0F;
	Tue, 29 Sep 2026 14:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doy5wfKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707C10EF0F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790692180; x=1822228180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyGF0VRbgkzfQ9a/+V/iwf5Xrnz2IurlN8UNd/VKYv4=;
 b=doy5wfKtoOYmdPjfR6IE1NylrZsXw03AeWcSKplr2dT32yastrJAMLTh
 q+NKMTMrsiFWsilgGinWJKJ8dA1Br4Z5PPEv5hNKN+BEuY0HR6fJuxpQX
 LNxpk7FWCdQVLTm/UsrrqFiWQhvOPBNwPWfvoLOehjzub+TQwibxnU6Wx
 47kCsW/1+qXP60zdWM7D9qp2VhuodqZGRRQw/1ZFvN0m1NF0NCz8J8raP
 FL5M0V8Ot7BqtdN9eYVpRkuqaKxbdoI4A2Lfmy1oMqYm2E+P1RfNrGear
 QeEMO1DS6Gz4yyD5TA6qQpudmxUgxfe9+1a2XATJH0pmbGBNIh+6jgZiC A==;
X-CSE-ConnectionGUID: LASpaGDYT9GqiZGTsmbxcw==
X-CSE-MsgGUID: qX+15CCFQa6bzEBUSwwZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90541131"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90541131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:39 -0700
X-CSE-ConnectionGUID: K6AwE9YnSQqMgMtxuhhvTA==
X-CSE-MsgGUID: ZRwztpf1SxShEKeWIRG7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278732043"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.222])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Protect against premature module unloads
Date: Tue, 29 Sep 2026 16:29:07 +0200
Message-ID: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Driver code is increasingly relying on bare drm_device references
(drm_dev_get()/drm_dev_put()) to keep a device's software state
around, without also pairing that with a reference on the owning
kernel module. Xe itself does this in several places, and so does
drm_gpuvm (used by xe) for the lifetime of a GPU VM. None of these
references currently prevent the xe module from being unloaded while
they, or the teardown work they can still trigger, are outstanding,
meaning driver code can end up executing after the module's own text
has already been freed.

This series closes that gap for xe:

- Patch 1 makes xe hold up module unload until every xe_device
  instance has actually been released, rather than only until the
  module's own refcount happens to reach zero, with a diagnostic if
  this ends up taking an unexpectedly long time.

- Patch 2 fixes a related, previously unprotected case where the
  teardown of a GPU VM or its address space mappings can be deferred
  to run at an arbitrary later time, including after module unload has
  already completed.

- Patch 3 fixes the same class of problem for execlist exec queue
  teardown, which could likewise be deferred past module unload.

Together, these changes ensure `rmmod xe` cannot free the module's
memory while any of its devices, or asynchronous work stemming from
them, might still be executing.

v2:
- Updated the commit message of patch 1 (then patch 2) to describe
  the actual implementation (a single 20s wait_var_event_timeout()
  followed by one pr_warn() and an unbounded wait_var_event(), rather
  than a loop retrying with a diagnostic every 10s) and its
  uninterruptible-sleep tradeoff (sashiko)

v3:
- drm_dev_release_barrier() now uses a single, global SRCU domain
  shared by all drivers instead of requiring each driver to register
  its own via a new &drm_driver.release_srcu field, accepting that a
  driver's call may then occasionally block on unrelated drivers'
  release callbacks (patch 1, patch 2, Christian König). This entire
  patch was later dropped in v4.

v4:
- Added a patch fixing a similar unprotected teardown gap in execlist
  exec queue destruction
- Dropped the core DRM patch that provided a global SRCU-based
  drm_dev_release_barrier() and the corresponding call to it in xe's
  module-exit path, in favor of relying solely on the xe_device
  instance count already tracked by this series
- Add code comments (patch 2)
- Use the xe->destroy_wq for vm->destroy_work (patch 2, Matt Brost)

Thomas Hellström (3):
  drm/xe: Don't unload the driver until all drm devices are freed
  drm/xe: Route deferred xe_vma/xe_vm teardown off system_dfl_wq
  drm/xe: Route execlist exec queue teardown off system_dfl_wq

 drivers/gpu/drm/xe/xe_device.c   | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h   |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c |  6 +++++-
 drivers/gpu/drm/xe/xe_module.c   | 24 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c       | 18 +++++++++++++++---
 5 files changed, 72 insertions(+), 7 deletions(-)

-- 
2.55.0

