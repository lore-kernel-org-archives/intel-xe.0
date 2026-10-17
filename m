Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D83CC6B2A
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C865410E31C;
	Sat, 17 Oct 2026 03:19:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1CE10E2BD
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792207140; x=1823743140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UwgXZ/fcpXg0IDFtBVO7W0JMXvgRBTGiLfY+XSCErFA=;
 b=iF8YisLYV+DYrYoKE61gaYj0F0tKrJKR1pMrdu7Q0ayuqTpxKAIt5+IU
 RpN4Lz8AClGhmQx+g2dkZqla7RZ+Wdov0TFfedREr72Pt3NzOm/NSPwQJ
 C6DMhX5Wxb824WN7u6LCCbZIAa+zeu4HleY+wXuJeuy2GGH0iaPCzpd5m
 qreuQiFrpaz7S2tHHqtanee7zTE3yFrWtHPgIuiWoGmEldrkbJ8LCCu2+
 /qyn3yI71lOzlSbjK8mJWO9cH8blgbyFTZ2GUmww2hrlIjS+lakMnP0R8
 ZjDeeXxujJg9LofRW8YdC46EiU3Hj1082P7EPpyaF/RoHjhx2v4dpJSFO g==;
X-CSE-ConnectionGUID: Vvf1AkGiTL6gSmDMzh5vhw==
X-CSE-MsgGUID: 93kyx1onQM2jD3f8icnQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982108"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="982108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:18:59 -0700
X-CSE-ConnectionGUID: 791no+VDTEK4Tlzi4NGWdQ==
X-CSE-MsgGUID: gla0kDhhSkG/35jWQlgIEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2556668"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2026 20:18:59 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/3] drm/xe/forcewake: add delayed release for engine-cycle
 queries
Date: Sat, 17 Oct 2026 03:18:53 +0000
Message-ID: <20261017031856.2723986-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
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
for the rest. The hold time is a couple of jiffies.

Delayed release must not outlive the device being powered off, reset
or removed. System and runtime suspend flush it: the pending work is
canceled and the held domains are put to sleep, while delayed release
stays available after resume. GT shutdown, device removal and
post-registration probe failure stop it: the work is disabled for good,
and a later delayed put puts the domain to sleep right away.

Only engine-cycle queries opt in. All other forcewake users keep
releasing immediately.

Zongyao Bai (3):
  drm/xe/forcewake: add delayed release with hysteresis
  drm/xe/forcewake: flush delayed release at power and teardown
    boundaries
  drm/xe/query: use delayed forcewake release for engine-cycle queries

 drivers/gpu/drm/xe/xe_device.c           |  11 ++
 drivers/gpu/drm/xe/xe_force_wake.c       | 228 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_force_wake.h       |  39 +++-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  42 +++++
 drivers/gpu/drm/xe/xe_gt.c               |  15 +-
 drivers/gpu/drm/xe/xe_query.c            |   2 +-
 6 files changed, 305 insertions(+), 32 deletions(-)

-- 
2.43.0

