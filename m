Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87345EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BF610E1DE;
	Thu, 12 Sep 2024 18:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n07MjV0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1F910E1DE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167479; x=1757703479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xuUI6SrV8MswX31kGi+NU2yusNAeMPEoTsuKaATyduM=;
 b=n07MjV0fpFyUmc48Txqf2NFZMcC+6siwxcjVIU2INkJbjJY7jXmPvYsn
 KtKlimw9F5bzLu6fsILi+cgMcgC0CfcSIyaXzzTYyH9+HWO22W+T4oor6
 cro1DhLXLsIJT+Q93iTLRcvqiJPdYenmE645FBi1vdC/HH/ydhzKh5t0T
 swC4IYbaZpNw7hs7Gb9DdpX2RNsXNqnqB5tRHl5Sv7y3tWX69SC1eu6e5
 cks4oTNB6Mt56U6REtCPG2wRA3Bl7MutjjdQwuNwqRaziSEzKdW5lR2q9
 7y+4AFVFVXDLNbzJtKwCI6vKSatk9K9LKGeM7qt7p/6Pq+oOSNh/6K4Ya w==;
X-CSE-ConnectionGUID: mqa50SF6R0Sb+Pz+EI1YOw==
X-CSE-MsgGUID: r3jKSJyORGuau1bh8r+gLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202897"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:57:59 -0700
X-CSE-ConnectionGUID: V0j34gKMQV+iN8ueHuacAA==
X-CSE-MsgGUID: jQhJcF/cTWmy7EdFA3X6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910071"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:57:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 00/23] Fix xe_force_wake_get() failure handling
Date: Fri, 13 Sep 2024 00:45:40 +0530
Message-Id: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Himal Prasad Ghimiray (23):
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
 drivers/gpu/drm/xe/tests/xe_mocs.c          |  16 +--
 drivers/gpu/drm/xe/xe_debugfs.c             |  29 ++++-
 drivers/gpu/drm/xe/xe_devcoredump.c         |  13 ++-
 drivers/gpu/drm/xe/xe_device.c              |  25 +++--
 drivers/gpu/drm/xe/xe_drm_client.c          |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c          |  69 +++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h          |   8 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |  21 ++--
 drivers/gpu/drm/xe/xe_gsc_proxy.c           |   9 +-
 drivers/gpu/drm/xe/xe_gt.c                  | 113 +++++++++++---------
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  13 ++-
 drivers/gpu/drm/xe/xe_gt_idle.c             |  29 ++---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   6 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  14 +--
 drivers/gpu/drm/xe/xe_guc_pc.c              |  54 ++++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   8 +-
 drivers/gpu/drm/xe/xe_mocs.c                |  10 +-
 drivers/gpu/drm/xe/xe_oa.c                  |  12 ++-
 drivers/gpu/drm/xe/xe_pat.c                 |  50 ++++-----
 drivers/gpu/drm/xe/xe_query.c               |   8 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |  24 ++---
 drivers/gpu/drm/xe/xe_vram.c                |  11 +-
 23 files changed, 335 insertions(+), 221 deletions(-)

-- 
2.34.1

