Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B0CF8856
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23D210E280;
	Thu, 20 Nov 2025 13:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBIgVdUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73E10E280
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763646122; x=1795182122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LI27MFIAz2Q3xsCwxXQifKVcw9mi/CxxY8AFTqrcx3g=;
 b=SBIgVdUM/+TYrYpvyUYbemRyppbLxo9Sol3yXbWE/Nu/f/aSf9kn65C6
 /4gY6LwnCJZIQa+hY8FiMf0HNMXdXAO7TGhGFJPPoBiplQDrj08irhMGR
 M2FOuaMEB0T8vQFZPbuamzd7x6JtYQl0bUrAo+OSMy1N+9Egm4EVD4vcd
 sUNZPJ/CLhlm1ZS6poixVeRUU9N+5xbe0Hh78+jLtUvPgLWVC7EiB0+9l
 DVHLAlb5YaKGg6/WdmSmcYwGPgRIVBihMch5a7/6QQCv7Ggqdg5+0YkiS
 RBWC9WDUU4D1JyngeMhU54GVJ7wa+gry7QcN5reV6bx8vDr0depPV9J0O A==;
X-CSE-ConnectionGUID: 6/lGTiw2Syi04sdXFn0rYg==
X-CSE-MsgGUID: v/NwuobjQS67w4peZ/GKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65742279"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65742279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:42:01 -0800
X-CSE-ConnectionGUID: BWum72Q6TlyaIY/jA04rww==
X-CSE-MsgGUID: iBceTK9TROyBrshOR/+dvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196509684"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.4])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:42:00 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 0/2] Add tracepoints to profile SVM page faults and migration
Date: Thu, 20 Nov 2025 14:41:28 +0100
Message-ID: <20251120134148.1450441-1-francois.dugast@intel.com>
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

v3: Rebase

Francois Dugast (2):
  drm/xe/migrate: Add tracepoint during VRAM copy
  drm/xe/pagefault: Add tracepoints for page faults

 drivers/gpu/drm/xe/xe_migrate.c   |  3 ++
 drivers/gpu/drm/xe/xe_pagefault.c |  7 ++-
 drivers/gpu/drm/xe/xe_trace.h     | 85 +++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)

-- 
2.43.0

