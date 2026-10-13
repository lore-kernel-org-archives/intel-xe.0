Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B03DCC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834810F99C;
	Tue, 13 Oct 2026 20:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D798E10E137
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791922762; x=1823458762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ulKfE4yxTUkDR15SnbzQl/972ll0rhc8JoZvlr0xiu0=;
 b=RDyJJQIpPNhGUwhCj67l605MwnAT70zjMnk7micfISMg+MvaN3gy5Mlx
 tOOTBA/V9JdSUZ1CrIG72zAfIo2EvaWYzNjqDbaOcQsVIlAeMjjUY8p/W
 ggZmsGbYj4l2/IreXyNwk4FHchG3KyhBZ17Htd7S18wzivP6zNNZqili9
 FfZDc0xBjpRhn0gw+xfkND9F+Xv/msheyXeA3uE0+gXCPgQllK4UNgSWP
 QIlJeLEVR1SCPYkjxAk4Yg2AQdAyMOGIGXJqDE6e1O4gueFabwfAPaG/m
 y56SbKMjwPunHlA/8Jn17EMGV0TEdYt1oVd9mjo1gx7sZEYXPjsugmrHZ Q==;
X-CSE-ConnectionGUID: 7Lfa2IFOQU6vYg5peM+pug==
X-CSE-MsgGUID: lmQpchabS/ShrYkXFzc8fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="678542"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="678542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:19:22 -0700
X-CSE-ConnectionGUID: MxQXxBDcR7Wr1Tmd4ZM9yw==
X-CSE-MsgGUID: ZCHAkGiEQYSeLrLL23HHsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1348476"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2026 13:19:23 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2 0/3] FD close cleanup for XE
Date: Tue, 13 Oct 2026 13:15:05 -0700
Message-ID: <20261013201508.514480-1-daniel.charles@intel.com>
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

This series adds the suggested logic to synchronously wait for the queue
kill to complete on FD close. This is needed to avoid a race condition
where the scheduler may still be processing messages for a queue that
has been closed, which can lead to errors.

This series includes a rebase of patch

fe73d8e1cdfac drm/xe: Disable scheduling early on FD close to avoid CAT error cascade

v2:
    - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
    - Drop the flush_work() loop (Matt B)
    - Use xe_assert() for the killed-queue check (Matt B)
    - Merge the put loop into the kill_sync loop (Matt B)

Daniel Charles (1):
  drm/xe: Synchronously wait for queue kill on FD close

Matthew Brost (2):
  drm/xe: Read scheduler message opcode under lock
  drm/xe: Disable scheduling early on FD close to avoid CAT error
    cascade

 drivers/gpu/drm/xe/xe_device.c               |  5 ++
 drivers/gpu/drm/xe/xe_exec_queue.c           | 13 ++++
 drivers/gpu/drm/xe/xe_exec_queue.h           |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 13 +++-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 79 ++++++++++++++++++--
 8 files changed, 104 insertions(+), 13 deletions(-)

-- 
2.43.0

