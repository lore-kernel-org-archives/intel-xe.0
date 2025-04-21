Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD4C369C2
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 13:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764310E39C;
	Mon, 21 Apr 2025 13:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdKmoUCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411BB10E39C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745243445; x=1776779445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1TLXvc2Jk2U2fVrXIemUWhvB1H+H1ycnkPrZvkAxLUM=;
 b=NdKmoUCyZJo48BF1Vph6rW6H3hMbWl8tVcwNB/ombx4z8IEBdUCQlTlF
 A/OEfZVxm+bwVFKKD9VtiuzEP4M8QYFKva2t6iZ6xUtG+ym9KCL6vCsdl
 yzxZRh0DnV5+LRu26yqHjSxHrz8qgKJUOJigjwPvdv3UqoLkCrnuhZHnO
 /6zZvpa8zhhRFro6IXy3Zx0HlhkNPBiB0BEP83+jEfaUv9EsvggiQxGbf
 0qUkEWVbM7j1qmMBUBQ+g6slj4maKzBfj4/K6eQ2JlOcztKL3YVeCWqdX
 ZwR86aFMHaWBF5N7A9z9IV/W6/3oJfWqHv5pSYbSbXnidBbp0m6MgIwMZ A==;
X-CSE-ConnectionGUID: iMf5G3QSTfabuu3928vabQ==
X-CSE-MsgGUID: yB5foFISQP2n2cf/YQe48A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34393134"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="34393134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:45 -0700
X-CSE-ConnectionGUID: 2uwcimWwRlaaEt2Jm+huOQ==
X-CSE-MsgGUID: HfffmAGrSAKkeaHzc5iK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="162681595"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 0/2] Wait for VRAM ready
Date: Mon, 21 Apr 2025 19:20:27 +0530
Message-Id: <20250421135029.3489950-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Wait for VRAM initialization to complete in system and runtime resume.
This is present in probe but is missing in resume.

Refactor wait_for_lmem_ready.

Karthik Poosa (2):
  drm/xe: Rename wait_for_lmem_ready and make it non-static
  drm/xe/pm: Wait for vram ready in resume

 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 drivers/gpu/drm/xe/xe_device.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.25.1

