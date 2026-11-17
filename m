Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABD606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uqo71+1l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4210F580;
	Tue, 17 Nov 2026 00:28:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A8210E2FE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794875301; x=1826411301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dIC0Q7ZhzIedqwJlO0Xpa6TdVRosq3gzh2FcvSZYfQY=;
 b=Uqo71+1l74IoMR5BxpiCkkDJ6xUU6jBcQViOuuFpOvha6BEAUiqHi0Wl
 0mUA4cYjAdrVF362kgBsR1CzeGX4/FjwgSydeSbcn9yYwavs8Wd4BrKGg
 jpNTEak0DRS6ZYwLtn7+YdCEHFKeKAmPNmwb8ZGa9CY1wvVfHTcV/nc3j
 3LqSbG4Y5HuZTebRz0lfcZb1evB67KJ5BXOqJCaz9ZsKR/djxkwcHhbeL
 ChpqHYY6NvGAUGiobCKZomkXttFhOjSdSKTrqLMr6EUDwrRL6743w2Eh7
 gzZoMByJt6dnw0a3CeVbl3eRC7Z4ULDrfEEImOqbOhsBp3SUSIf2doMNE A==;
X-CSE-ConnectionGUID: kdryKH8vTK+DSQEP3kEFRQ==
X-CSE-MsgGUID: 3br3OwRfREKmOf3YTzXQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3532374"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3532374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:28:21 -0800
X-CSE-ConnectionGUID: oQrVLdn6RjalC3dXb3coWg==
X-CSE-MsgGUID: lM//whx5QRGWne2XN09xpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="10078963"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 16:28:21 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 0/3] drm/xe/forcewake: add delayed release for engine-cycle
 queries
Date: Tue, 17 Nov 2026 00:28:16 +0000
Message-ID: <20261117002819.535438-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Engine-cycle queries are issued repeatedly by profilers such as VTune
and PTI to correlate CPU and GPU timestamps, for example through Level
Zero zeDeviceGetGlobalTimestamps(). Each query wakes the engine
forcewake domain and puts it to sleep again, and waiting for both
acknowledgments dominates the query latency.

This series adds an opt-in delayed release to forcewake. After the
final reference to a domain is dropped with xe_force_wake_put_delay(),
the domain stays awake for a short hold time, and a get within that
time reuses it without another wake request or ACK wait. The domain is
put to sleep from a delayed work in process context, so the sleep ACK
is waited for as in a regular put. The work sleeps only domains whose
hold time expired and that are still unreferenced, and requeues itself
for the rest. The hold time is 5 ms, and never less than two jiffies.

Delayed release must not outlive the device being powered off, reset
or removed. System and runtime suspend flush it: the pending work is
canceled and the held domains are put to sleep, while delayed release
stays available after resume. GT shutdown, device removal and
post-registration probe failure stop it: the work is disabled for good,
and a later delayed put puts the domain to sleep right away.

Only engine-cycle queries opt in. All other forcewake users keep
releasing immediately.

v3 (all from Sashiko review):
- xe_pm_runtime_get_if_active() only returns true/false, so the delayed
  release work could not tell "suspend in progress" from "runtime PM
  disabled" and returned early in both. Use pm_runtime_get_if_active()
  instead and do not drop the work while a runtime suspend is in
  progress. The work never resumes the device and handles three cases:
  a. runtime PM active: put the expired domains to sleep as before.
  b. runtime suspend in progress: requeue and retry later.
     b1. If the suspend completes, xe_force_wake_flush() cancels the
         work and settles the delayed domains.
     b2. If it aborts, the device returns to RPM_ACTIVE and the next
         run puts the expired domains to sleep.
  c. runtime PM disabled (e.g. CONFIG_PM=n): the device stays powered,
     so release the domains without a runtime PM reference.

- Do not count domains in delayed release as held in
  xe_force_wake_assert_held(), since they are awake with no reference
  and may be put to sleep by the delayed release work at any time.


v2 (all suggested by Rodrigo Vivi):
- Define the hold time in milliseconds and convert it with
  msecs_to_jiffies(), keeping it at least two jiffies. (Rodrigo)
- Pass the hold time to __xe_force_wake_put() instead of a bool, with
  0 meaning an immediate release. (Rodrigo)
- Replace the queue_delayed_work()/delayed_work_pending() check with a
  delayed_enabled flag protected by the forcewake lock and cleared by
  xe_force_wake_stop(). (Rodrigo)
- Use xe_pm_runtime_get_if_active() in the delayed work instead of
  asserting that the device is not runtime suspended. (Rodrigo)
- Rebase on drm-xe-next (4af7fae27dc6).

Zongyao Bai (3):
  drm/xe/forcewake: add delayed release with hysteresis
  drm/xe/forcewake: flush delayed release at power and teardown
    boundaries
  drm/xe/query: use delayed forcewake release for engine-cycle queries

 drivers/gpu/drm/xe/xe_device.c           |  11 +
 drivers/gpu/drm/xe/xe_force_wake.c       | 245 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  42 +++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  48 +++++
 drivers/gpu/drm/xe/xe_gt.c               |  15 +-
 drivers/gpu/drm/xe/xe_query.c            |   2 +-
 6 files changed, 330 insertions(+), 33 deletions(-)

-- 
2.43.0

