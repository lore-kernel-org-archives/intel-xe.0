Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1466D5E12A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A07310E920;
	Fri,  8 Nov 2024 05:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC56jASi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBB910E91E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044022; x=1762580022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P2JKwDK1s+AtI/l6AJ3Lvg6WfnLpLCYzsBh6bApUxTc=;
 b=cC56jASiXpVRh1hbiRwmKDHuRoWx3LZ5smsg9Eluzx5Hggp5c2hPJmPZ
 9XrFQszxM8b2mJnei/ldhZfjmbt+nIeMndt3APJprqgja1R848ETgBfKM
 BsZQEuOa871ACC2zWgQ22xu4bVldl/lW5WHopgLbnwVgINjiWutIonXCL
 EwpnCM+AaE5QIYvpgkKNW7T37lansP4mX44nqlaaFNaRqJM3wVq0l7UCy
 PdgoEJXgQUEVJFf3QjOOEK9UsVC5pJcAe20pvOhEKBHJ7CWYXBHffdrpv
 WIS10n9xRLbAsSfB4U6KK+SzQESBseS189/uCLtqEJk6Iqp32r2Q88Scq g==;
X-CSE-ConnectionGUID: w+TVZxJSTSaDKzM13cMt0w==
X-CSE-MsgGUID: GvfSw0tjRmyfBlZKNnSZ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30316579"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30316579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:42 -0800
X-CSE-ConnectionGUID: 3OEtMcp9R3C2W/vlIHj+QQ==
X-CSE-MsgGUID: t9Prda3sRvOC+mvEDFOMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="90037099"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Fix races on fdinfo
Date: Thu,  7 Nov 2024 21:33:15 -0800
Message-ID: <20241108053318.3483678-1-lucas.demarchi@intel.com>
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

As for the patch to cache hwe, I'm still not sure it's worth. Tracing
show_run_ticks() doesn't show noticeable performance improvement.

v4:
  - Remove patches already applied for tracepoint, doc fix and where the
    timestamp is accumulate
  - Move wait to the beginning, to avoid impacting the read of gpu
    timestamp vs pceu
  - Refactor patch to extract force wake getting: this should make it
    simpler to eventually cache hwe
  - Add patch to cache hwe

Lucas De Marchi (3):
  drm/xe: Wait on killed exec queues
  drm/xe: Sample gpu timestamp closer to exec queues
  drm/xe: Cache hwe used for timestamp

 drivers/gpu/drm/xe/xe_device.c       |  2 +
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 90 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_drm_client.h   |  2 +
 drivers/gpu/drm/xe/xe_exec_queue.c   |  6 ++
 5 files changed, 86 insertions(+), 24 deletions(-)

-- 
2.47.0

