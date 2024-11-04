Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC227D132D7
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9210E0AC;
	Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjIIsO3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899AB10E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731113; x=1762267113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/ifVJ9am/EP5pjvfxEi4RHttI8JeIY4ESFl1tLgeWk=;
 b=cjIIsO3GCO5yM2HqpFAN60YCyps9B+3qSuGqAtz9vweToWAMfVQqtwwE
 M7I72Zf9WfVZUHLhAoxHoolFmp60DFpilx1mRhY5Tv1S611A4eSCZtfCi
 aXBO4FzoTlYOkhQKlVOh8Qq7cA5O45Cii+FhFQmJUb9iseOOvSMTC7Tga
 cfMDZ9fWoIrSZ7RqklGxAR0+4QotLumb7WQbQh1LKBFEP4S2R5EBZmuaS
 yHvOR2CWWUY6TFzv1ma+GcSdsKfhTzoXtdfLavcE7o0T3BuZpd1OG3lVS
 rACmqrQGz78TCULcQ9yXkec3nXkWU+C9Qudp2MgDTxDTWPGjxFy15R2zN w==;
X-CSE-ConnectionGUID: ca4aIRXqSE6GqNAdKWdfLQ==
X-CSE-MsgGUID: 8eMlwgGLQ+yMhgvPVj1Erg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55831408"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55831408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
X-CSE-ConnectionGUID: 5v+waOEpSVOtl/hxE+pl8A==
X-CSE-MsgGUID: 3EQBq9eMT/WHBAsM2eY/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88244297"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 0/5] drm/xe: Fix races on fdinfo
Date: Mon,  4 Nov 2024 06:38:10 -0800
Message-ID: <20241104143815.2112272-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

The current reading of engine utilization has same races. This should
fix most of them while also drastically reducing the update rate needed
on "normal apps".

I left tests/xe_drm_fdinfo --r utilization-single-full-load-destroy-queue
running on 2 systems and saw no failures after 100 iterations about
execution cycles being 0.

v3:
  - Fix the wait for exec queues to validate user args
  - Include new patch to extract force wake get.

Lucas De Marchi (5):
  drm/xe: Add trace to lrc timestamp update
  drm/xe: Stop accumulating LRC timestamp on job_free
  drm/xe: Reword exec_queue.lock doc
  drm/xe: Wait on killed exec queues
  drm/xe: Sample gpu timestamp closer to exec queues

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h | 11 +++--
 drivers/gpu/drm/xe/xe_drm_client.c   | 68 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_exec_queue.c   | 12 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 -
 drivers/gpu/drm/xe/xe_lrc.c          |  3 ++
 drivers/gpu/drm/xe/xe_trace_lrc.c    |  9 ++++
 drivers/gpu/drm/xe/xe_trace_lrc.h    | 52 +++++++++++++++++++++
 8 files changed, 130 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h

-- 
2.47.0

