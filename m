Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21401C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11C10E275;
	Wed, 14 May 2025 08:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlK7d7WN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142C510E23A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747210335; x=1778746335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9KgYYL9/CScWHQ7YYxiFgfCA0m9U14aWIe39Bt5inE=;
 b=SlK7d7WNJ2jRTms8xJ2FQCkZ9/lTO9QA2StHo1+6Z6QcJG5jUXK0H54B
 nqDdj+IYRe52w1QvWojz9mSB5wBuhrGZNQbarDFWxK3dQpgQak5ihdimt
 Yf8i5tNHTIwD0z/NPuCZIpYNnfnLnifJVrgrxVNXKa8bHGdlKFYFjg3DE
 CBR6IRyYYGoYB1hUb1P3Sjc4Q1vE5zcTs6Q2t7HMhCsU5nqIku5/PhKTc
 gD6XDGMDdYp34PK1KF6V+MLEDrHiXMMb/igLIq6rVkWC+0d3KU/v2Ipsl
 JUOmcvizag/DFiETnJ7hdIhynHesQTeYUOaSpBNHJz60d+nE78LpvdKqS w==;
X-CSE-ConnectionGUID: 4KSzYZ/VQ6GF2cQrkEC+9A==
X-CSE-MsgGUID: F9OvkJ4FRuS4wOSwcIZpJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48344074"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48344074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:14 -0700
X-CSE-ConnectionGUID: n59IUFEfSUqqgtFCvYSz9A==
X-CSE-MsgGUID: gH7stXslQ9q6LMNLkt+aTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137841679"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:12:12 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com
Subject: [PATCH 0/4] Add debugfs to expose G8, G10 and ModS residency
Date: Wed, 14 May 2025 13:37:17 +0530
Message-Id: <20250514080721.265515-1-soham.purkait@intel.com>
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

     The changes in the first patch is taken from
https://patchwork.freedesktop.org/series/148926/
Thay are  added only for compilation and does not require review.

    This patch exposes G8, G10 and ModS residency counter value through
debugfs.

Soham Purkait (4):
  [DO NOT REVIEW]:   Utility function and macro for telemetry reading
  drm/xe/xe_debugfs: Exposure of G8 residency counter through debugfs
  drm/xe/xe_debugfs: Exposure of G10 residency counter through debugfs.
  drm/xe/xe_debugfs: Exposure of Mods residency counter through debugfs.

 drivers/gpu/drm/xe/regs/xe_pmt.h |   5 ++
 drivers/gpu/drm/xe/xe_debugfs.c  | 103 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.h  |   4 ++
 drivers/gpu/drm/xe/xe_vsec.c     |   2 +-
 drivers/gpu/drm/xe/xe_vsec.h     |   5 ++
 5 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.34.1

