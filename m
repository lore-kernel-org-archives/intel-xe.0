Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FE5CF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3785110E05C;
	Mon, 30 Sep 2024 05:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bD5R6uPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3846810E05C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673205; x=1759209205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ua5OQTXd4M84lqOxIlUkvTUa0UQPwzuAtfE9IKt9LLM=;
 b=bD5R6uPopuYjxpyhXAehldCEb+fRqR2AOuu3ua5PE7Mfvy2M01YRtg2A
 l36E9Bhz8P1qzhV5EKvQCyq3/Ril853lHx7AJ8aV2vPIDETg0yfa3AW+H
 l3H4EDzJUk5wxTj1ICQKkAqsbLLS/FxkoYcFaANENpZDwlinq2TNedf4M
 YJQ+dQuYPYL8Y4zOPjMT/EMCnOaRocE8fT7DWEKRtHT79x/R8byMgRSlc
 RTruMjFNgJ/Vcoy10alGxA8m2FCwj8GJdCUUas3+j+0RGk9NNE+h0+I83
 gkIfdu2oyn+HcgVTMwm49/O9qfOny4md5BQRd3I3uIekT6Jrsdk/ePwLI A==;
X-CSE-ConnectionGUID: Jvk+1efAQXmpxcEx5B8fXQ==
X-CSE-MsgGUID: otSqAs2ySyqV2gE5zB4aSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367949"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:25 -0700
X-CSE-ConnectionGUID: 6fFm95wPSaW7sfXKtt+dLg==
X-CSE-MsgGUID: JOh02N1MTDqQUhgAeJXKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752085"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v6 00/25] Fix xe_force_wake_get() failure handling
Date: Mon, 30 Sep 2024 11:01:24 +0530
Message-Id: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

This series ensures refcount is not incremented in case of
xe_force_wake_get() failure and return mask of successfully refcount 
incremented domains.

For single domains (except XE_FORCEWAKE_ALL), the return value will be
0 on failure and doesn't need call to xe_force_wake_put()(if called,
call will return with check since input mask will be 0).
For XE_FORCEWAKE_ALL caller need to compare the returned mask with
XE_FORCEWAKE_ALL to confirm the success of call and need to explicitly
call xe_force_wake_put() with returned mask to put awaken domains to
sleep.
 

-v2 (Rodrigo, Badal)
- Dont put successfully awaken domains to sleep. Instead rely on _put to
  do that.
- Modified xe_force_wake_get() to return the refcount-incremented domain
  mask and xe_force_wake_put() uses this returned mask.

-v3 (Michal, Badal)
- Use explicit type for domain masks.
- Dont use xe_assert in _get/_put error reporting.
- Restructure patches, so Patch 23 has only kernel-doc and return
  change.
- use xe_gt_WARN_ON instead of XE_WARN in _put error. 
- Improve kernel-doc for _get.

-v4
- Rebase fixes

-v5 (MattB, Rodrigo, Badal)
- Avoid explicit type unsigned int
- Use unsigned int as return for xe_force_wake_get()
- Add xe_gt_WARN_ON inside xe_force_wake_get() for ack failures

-v6 (Michal, Badal)
- Return actually refcounted domains by xe_force_wake_get(), to
  accommodate change XE_FORCEWAKE_ALL to single bit.
- Define a helper to check domain is in fw_ref or not.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Himal Prasad Ghimiray (25):
  drm/xe: Add member initialized_domains to xe_force_wake()
  drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
  drm/xe: Error handling in xe_force_wake_get()
  drm/xe: Modify xe_force_wake_put to handle _get returned mask
  drm/xe/device: Update handling of xe_force_wake_get return
  drm/xe/hdcp: Update handling of xe_force_wake_get return
  drm/xe/gsc: Update handling of xe_force_wake_get return
  drm/xe/gt: Update handling of xe_force_wake_get return
  drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
  drm/xe/devcoredump: Update handling of xe_force_wake_get return
  drm/xe/tests/mocs: Update xe_force_wake_get() return handling
  drm/xe/mocs: Update handling of xe_force_wake_get return
  drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
  drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
  drm/xe/guc: Update handling of xe_force_wake_get return
  drm/xe/huc: Update handling of xe_force_wake_get return
  drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
  drm/xe/pat: Update handling of xe_force_wake_get return
  drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get
    return
  drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
  drm/xe/query: Update handling of xe_force_wake_get return
  drm/xe/vram: Update handling of xe_force_wake_get return
  drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
  drm/xe: Ensure __must_check for xe_force_wake_get() return
  drm/xe: Change return type to void for xe_force_wake_put

 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   6 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c          |  18 ++--
 drivers/gpu/drm/xe/xe_debugfs.c             |  27 ++++-
 drivers/gpu/drm/xe/xe_devcoredump.c         |  14 +--
 drivers/gpu/drm/xe/xe_device.c              |  25 +++--
 drivers/gpu/drm/xe/xe_drm_client.c          |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c          | 109 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_force_wake.h          |  26 ++++-
 drivers/gpu/drm/xe/xe_force_wake_types.h    |   6 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |  23 ++---
 drivers/gpu/drm/xe/xe_gsc_proxy.c           |   9 +-
 drivers/gpu/drm/xe/xe_gt.c                  | 105 ++++++++++---------
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  13 ++-
 drivers/gpu/drm/xe/xe_gt_idle.c             |  26 +++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   5 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  13 +--
 drivers/gpu/drm/xe/xe_guc_pc.c              |  50 +++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   8 +-
 drivers/gpu/drm/xe/xe_mocs.c                |  14 +--
 drivers/gpu/drm/xe/xe_oa.c                  |  11 +-
 drivers/gpu/drm/xe/xe_pat.c                 |  66 ++++++------
 drivers/gpu/drm/xe/xe_query.c               |   8 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |  24 ++---
 drivers/gpu/drm/xe/xe_vram.c                |  12 ++-
 24 files changed, 381 insertions(+), 245 deletions(-)

-- 
2.34.1

