Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616CFCD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 22:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BDA10EA86;
	Wed, 27 May 2026 22:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhWXPENF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004C10EA86
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779922511; x=1811458511;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iei9zlSw0uUnR/BQ163x3RX6bETDgcqTGpJwox92tKQ=;
 b=RhWXPENFzGPePiivCcGBQJdn0SWVGBzzOBec01A4WHjANutJ4pipW7pp
 B8ye9nVjm39Bh4URbtNB60RV/2v9kAOCT8Pj5Gew6K7BOZ5SHW/H4pFwd
 7+QYewP+7wyajpUwQZ2EC+LgB74+f38qAwARFJHCbfmTIpI47u0MUsTDr
 EAvM5PZtmYqpAPl50wkSTFKc1kyLNeJEWZVz9pLPP/0EkK93rA+zbt6kB
 05Ostz77hjqvHt6WfJ5BZ/8i0LJgLGcehtHXkM652fUBdXe3ft5uGmyJO
 qJnXU6uu3rBGeEryefbARExBemKRkgXSjZJ1KV7X6Zcr6dMKS6UPy3/ix A==;
X-CSE-ConnectionGUID: vg/hYO3XQmqHtlP7gPhXpQ==
X-CSE-MsgGUID: sYdmU2sgSXSjGZx7Y5Qr7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98340383"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="98340383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
X-CSE-ConnectionGUID: nP0bTCNGS0iaQ4pJt10rRw==
X-CSE-MsgGUID: Im4ej2hQT4+xNXlwzVEsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="266260444"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] complete perf_allow_* trio and use in drm/xe
Date: Wed, 27 May 2026 15:55:05 -0700
Message-ID: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

https://patchwork.freedesktop.org/series/167137/

Submitting for CI, for merging via Xe tree.

John Hubbard (2):
  perf/core: out-of-line and export perf_allow_cpu/tracepoint()
  drm/xe: gate observation streams with perf_allow_cpu()

 drivers/gpu/drm/xe/xe_eu_stall.c    |  5 +++--
 drivers/gpu/drm/xe/xe_oa.c          | 25 +++++++++++++---------
 drivers/gpu/drm/xe/xe_observation.c | 32 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_observation.h |  3 +--
 include/linux/perf_event.h          | 31 ++++++++++++++--------------
 kernel/events/core.c                | 18 ++++++++++++++++
 6 files changed, 79 insertions(+), 35 deletions(-)

-- 
2.54.0

