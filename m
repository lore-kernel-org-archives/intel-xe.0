Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CAD25030
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 06:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA9110E041;
	Mon, 12 Jan 2026 06:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpFreyh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B50310E041
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768198696; x=1799734696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3rqP8q32iC99lxUlPCMqvENWKq9vah42N9Q9gd0MEPE=;
 b=EpFreyh2GknolmzEpL7+7htm5NbZnOWAE3oozd2mBzqwq8Yw7HmPNXiW
 IVoXwUYsHCXt8N7IR7kIddi7CY5tsNMfJMmw/2c49b85vvwzD+41slIzL
 9+NjiPlP6ZH2ul+6y265qOw1OqRDWvRYGTBZvy3sQzs9znkEK78GGfnvY
 gA64jOjPuuC0I2hOgcqh9SmIB4tz7Kz4H1f1T2FJaboEiDjPFaM/voztl
 enBhAUsb+Le1uShuAqD3JTB/geaquT0zWEWaXptfunb1OynL/SP0BHFhd
 EWl+EcqLxeK02Y3JQMN+94I6x9eH4//qODl2bNn/SKGLrsV2vUNttIDlf A==;
X-CSE-ConnectionGUID: fF+7Wv+mRNWSUboGIvPRNA==
X-CSE-MsgGUID: Vi70XhhKRVa/+vDi+J4fAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80574683"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80574683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:18:16 -0800
X-CSE-ConnectionGUID: l9UEDDZfQYGTo9JVTqKBvA==
X-CSE-MsgGUID: rWsYV3ehSgGcSnkC4hDTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="241539275"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:18:15 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 0/2] drm/xe: Add prefetch pagefault support for Xe3p
Date: Mon, 12 Jan 2026 11:47:56 +0530
Message-ID: <20260112061755.1569635-4-varun.gupta@intel.com>
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

Xe3p hardware prefetches memory ranges and notifies software via an
additional bit (bit 11) in the page fault descriptor that the fault
was caused by prefetch.

Patch 1 refactors the error handling to print the fault only when handling
fails, consolidating the logging with the response status.

Patch 2 implements the prefetch support by extracting the prefetch bit from
the fault descriptor and echoing it in the response on unsuccessful handling.
This prevents CAT errors for prefetch faults. Stats are incremented for
prefetch errors without verbose logging to avoid spamming the log.

Based on original patches by Brian Welty and Priyanka Dandamudi, and
originally implemented by Lucas De Marchi.

v2: Changed comment wording from "repairs" to "handling" per Matt Roper's
feedback.

Tested with xe_prefetch_fault IGT test.

Varun Gupta (2):
  drm/xe: Coalesce pagefault error handling
  drm/xe: Add prefetch fault support for Xe3p

 drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 16 ++++++++++++++--
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
 6 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.43.0

