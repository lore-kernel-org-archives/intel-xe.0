Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD6D0C604
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 17:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD67610E429;
	Sat, 26 Oct 2024 17:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwjaVtT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E8810E42C
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Oct 2024 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729962615; x=1761498615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BkUljx6fhXSxH1xACtjKjofF4dJ/DzE3YlYWLa/IL7c=;
 b=bwjaVtT6/e6iAPb7DprZOJpslvfWmhNeXVe657YBEy0jwP8d/qlGBgYX
 2B1rGomvGoW19rLXz1p7pJEmHuLSv795xrZyj834UWr56cdxaldoK4rMo
 hBSxRJubHC5iEJVfrGSrmhvIbFh5Ha/SHascNnO+VmAFRXaXQptgBD4cF
 kAGg4yQrC+LLB4zKbDqQM1DJ33+4z9UyAA84Nrx/qwochPFO7az5tYEIq
 9kQ4BZK2FUrPTowtaPcoJ6BwHV6CjWwEdu8m45d9xruNBgub6p5RsADbC
 XEy36wxS4JqBDvy4wF3xSSM5ykKp2AArmq/ZMZMOWTQEo98bDyR85JpuR g==;
X-CSE-ConnectionGUID: Z3EXpiBOQ5+Iz6ijR9GEzg==
X-CSE-MsgGUID: H1hsSJVaTe2lXqq3VEVRQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29568955"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29568955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:14 -0700
X-CSE-ConnectionGUID: 5VRpsJ1rQ9u/2eWcsk76uQ==
X-CSE-MsgGUID: pJoxbSf9RrKGRUlAafpUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85970115"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.191])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/3] drm/xe: Fix races on fdinfo
Date: Sat, 26 Oct 2024 12:08:45 -0500
Message-ID: <20241026170952.94670-2-lucas.demarchi@intel.com>
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

[ I sent this yesterday to the i915 mailing list only:
  https://patchwork.freedesktop.org/series/140538/
  Re-sending to the right one ]

The current reading of engine utilization has same races. This should
fix most of them while also drastically reducing the update rate needed
on "normal apps".

I left tests/xe_drm_fdinfo running on 2 systems and saw no failures
after 100 iterations.

Lucas De Marchi (3):
  drm/xe: Add trace to lrc timestamp update
  drm/xe: Accumulate exec queue timestamp on destroy
  drm/xe: Stop accumulating LRC timestamp on job_free

 drivers/gpu/drm/xe/Makefile        |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 ++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 --
 drivers/gpu/drm/xe/xe_lrc.c        |  3 ++
 drivers/gpu/drm/xe/xe_trace_lrc.c  |  9 ++++++
 drivers/gpu/drm/xe/xe_trace_lrc.h  | 52 ++++++++++++++++++++++++++++++
 6 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h

-- 
2.47.0

