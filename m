Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC425C7EE2C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBBD10E3B9;
	Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE82D10E3AD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OzN3rrZYVLW/sHvLJgNiAYjZoCsPq80KNxq6XfMcdOY=;
 b=d14K1qhXtLXGD9YbUw5Vpo9WXnA33LPTYBUNbBSZxjRcWwQ7IAq6mXZV
 Z9yTbZ98E9TIQ4yrByn13n3khxRpNaquB5qU/LZ12vaiHsKijHk4xSKR2
 aAkK316Q6K+58bqc2hEA7vTEJUcPIvcTlZKwzpjUYJEnEOwLVDnViSTAz
 2nQh6uqMVWNkawncrj/5euPgoYWcBasq6Xpb1Fi+glDVDT0nSIb8DOx/p
 DKnwe0El3tejp7Ge/5hVSYm14tFzMYCQlj0PlUqSVMLcnxE2LxQRUxWbE
 o+XbpACuQMMDd8I0CUbYeq86HPSVlkhY0Pt0WLNv6p7fIWYI8Vnb8k4f4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323826"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439419"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439419"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:43 -0700
Message-Id: <20230504073250.1436293-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] OOB workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continuation of the RFC https://patchwork.freedesktop.org/series/116365/

First 5 patches are drive-by trivial fixes that could be applied
regardless of the rest.

6th patch implements the logic for OOB workarounds and the last one
makes use of that in xe_guc.c

Changes from the RFC:

	- This concentrates on reporting just the active workarounds,
	  not all the workarounds implemented in the driver. That will
	  make more sense for a debugfs interface rather than the
	  previous dump

	- Instead of allowing a condition statement to be passed as
	  argument to the macro, migrate the macro to use he rtp rules.
	  Advantage here is that the rules can be executed not only on
	  the code path they are in, but also during initialization or
	  upon a debugfs call. This allows to report the "active"
	  workarounds without requiring that code path to be traversed.
	  Eventually the OOB workarounds may be changed to execute the
	  rules only on probe, saving an "active" bit in the device.

	  Limitation here is that the XE_WA() currently only supports
	  rules checking the device info.

Lucas De Marchi (7):
  drm/xe: Do not mark 1809175790 as a WA
  drm/xe: Fix comment on Wa_22013088509
  drm/xe/guc: Remove special handling for PVC A*
  drm/xe: Fix Wa_22011802037 annotation
  drm/xe/rtp: Let rule_matches() receive xe_device
  drm/xe: Add support for OOB workarounds
  drm/xe/guc: Port workarounds to OOB infra

 drivers/gpu/drm/xe/Makefile       |  2 ++
 drivers/gpu/drm/xe/xe.lds         |  8 +++++
 drivers/gpu/drm/xe/xe_device.c    |  4 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c    | 13 ++++++--
 drivers/gpu/drm/xe/xe_guc.c       | 54 +++++++++++--------------------
 drivers/gpu/drm/xe/xe_ring_ops.c  |  7 ++--
 drivers/gpu/drm/xe/xe_rtp.c       | 42 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_rtp.h       | 22 +++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h | 12 +++++++
 drivers/gpu/drm/xe/xe_wa.c        | 25 ++++++++++++--
 drivers/gpu/drm/xe/xe_wa.h        | 19 +++++++++++
 11 files changed, 155 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe.lds

-- 
2.40.1

