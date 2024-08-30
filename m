Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42720CA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296610E1C5;
	Fri, 30 Aug 2024 05:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2KcvDrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495C210E1C5
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994339; x=1756530339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FnPByX19SnOkYc8eKjzZ2diz1bRuebPNTGniDEMA1JA=;
 b=j2KcvDrpxUYSZtAspVA1c5wyl8oBC2b0Ug+dkSY021Vuw/31kdMOYaIn
 TGygz54CxW+6nJiXwpT5/bCJ6heyBz9mxnteaBPRGe/nnR3SvzyG1axnh
 M+D0oJjnS/lRpxALCPCWxtW55rq2Ob+nWS2ug3yRpZKHT1h50sO7Bon5e
 6N2WqmRhC3ubhjhoQiNVksCEtY6tFUTvjssR+OJUuyADqyvV604KmORlT
 RiRALQ4o8Iz9PBdeUDlG4yy8abXGZC316e9dJ4P9q7ejncL+Q8vVoEbQU
 cT0O/vSFi0KNYzgObzL7htdWLGyZfUcOviTAvFz/gN5CQ3MsiHp+JvOXY Q==;
X-CSE-ConnectionGUID: VjaPD2kmRDW079UeoqdC9A==
X-CSE-MsgGUID: fFmV6IdhTc28dqlACb+s3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006466"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:39 -0700
X-CSE-ConnectionGUID: Z+tUvsmPQTaSRKUKQSrJhg==
X-CSE-MsgGUID: 5Ty298owQPSVJibDGJ6kbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101301961"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [RFC 0/9] Fix xe_force_wake_get() failure handling
Date: Fri, 30 Aug 2024 10:53:17 +0530
Message-Id: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

In case of xe_force_wake_get() call the refcount for domains
are incremented irrespective of failure or success, which can lead to
undefined behaviour: 
[1] subsequent forcewake call by callee function assumes domains are 
already awake, which might not be true. This shows perfectly balanced 
xe_force_wake_get/_put can also cause problem.

[2] The functions are using xe_force_wake_get() and return on failures.
In this scenario only the first caller returns and other functions will
always assume domains to be awake.

[1] func_a() {
	XE_WARN(xe_force_wake_get()) <---> fails but increments refcount

	func_b();

	XE_WARN(xe_force_wake_put());<---> decrements refcounts 
 }

    func_b() {
	if(xe_force_wake_get()) <---> succeeds due to refcount of caller
		return;

	does mmio_operations(); <---> Domain might not be awake

	xe_force_wake_put(); <---> decrement refcount
 }
  	
[2] func_a() {
	int err = xe_force_wake_get(); <---> returns if fails, inc refcount
	if (err)
		return;

	mmio_operations();

	xe_force_wake_put(); 
 }

    func_b() {
        if (xe_force_wake_get()) <---> succeeds due to refcnt of func_a()
              return;

        mmio_operations(); <---> Invalid accesses

        xe_force_wake_put(); <---> decrements refcount for func_b
 }

This RFC proposes not incrementing the refcount in case of
xe_force_wake_get() failure and putting all domains awakened by the caller 
to sleep and decrease the reference count for all requested domains. 
This prevents xe_force_wake_get() from leaving an unhandled reference 
count in case of failure. 

With these changes in place caller needs to ensure xe_force_wake_put() is
called only if xe_force_wake_get() succeeds.

Patches breakdown:

1. Changes in xe_force_wake_get() and documentations
   - Patches 1 to 2

2. Ensure xe_force_wake_put() is called when xe_force_wake_get() succeds
   - Patches 3 to 7

3. Modify xe_force_wake_put to return void and warn for failure
   - Patch 8

4. Debugfs handling for forcewake open
   - Patch 9

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Himal Prasad Ghimiray (9):
  drm/xe: Error handling in xe_force_wake_get()
  drm/xe: Ensure __must_check for xe_force_wake_get() return
  drm/xe/gsc: call xe_force_wake_put() only if xe_force_wake_get()
    succeeds
  drm/xe/gt: call xe_force_wake_put() only if xe_force_wake_get()
    succeeds
  drm/xe/guc: call xe_force_wake_put() only if xe_force_wake_get()
    succeeds
  drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
  drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put if
    xe_force_wake_get succeds
  drm/xe: Change return type to void for xe_force_wake_put
  drm/xe: forcewake debugfs open fails on xe_forcewake_get failure

 drivers/gpu/drm/xe/xe_debugfs.c             | 28 +++++++--
 drivers/gpu/drm/xe/xe_device.c              |  3 +-
 drivers/gpu/drm/xe/xe_drm_client.c          |  2 +-
 drivers/gpu/drm/xe/xe_force_wake.c          | 64 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h          |  9 +--
 drivers/gpu/drm/xe/xe_gsc.c                 | 14 +++--
 drivers/gpu/drm/xe/xe_gt.c                  | 25 ++++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c             | 25 +++++---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  9 ++-
 drivers/gpu/drm/xe/xe_guc.c                 |  9 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 15 +++--
 drivers/gpu/drm/xe/xe_oa.c                  | 13 +++--
 drivers/gpu/drm/xe/xe_pat.c                 | 10 ++--
 drivers/gpu/drm/xe/xe_reg_sr.c              |  6 +-
 drivers/gpu/drm/xe/xe_vram.c                |  3 +-
 16 files changed, 165 insertions(+), 72 deletions(-)

-- 
2.34.1

