Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2424EF99D3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 20:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115CD10E318;
	Fri, 13 Feb 2026 20:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U86ZdOsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7587310E2C2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771015849; x=1802551849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oJroJAfUCzANXKRjF+wS9nbNdxeXx8dNj1BOK4YDmfw=;
 b=U86ZdOsn8Vds3mW6odRbVFL42dON5on7YGeFkwckOMA9pzwY4kXIyIRE
 SXDn5LnTc9YauBq0aJtFnGvmS63+VXrT5ts2/WFB5qNcA1ulsAOM14TA7
 UVfNo/LBDio/zSv7t1nz9T8+3z7V6YxeHQ6zBIjP/D5IpWlDxFhPK5U3O
 B9VugCgvMtj9AYuWJp1GvMxPRe540kgxJuXvMPZdoF3m7VWGQUYEa7Lti
 ducrwHoldRX+5UvipxndHhZUIo//5BSZvR4Rh4xjO4JFqo9pM2BLFWJev
 iCr18upN7QLcJpCxXLMQRYZJbO1Ol2vyoC/Myjl+aRoiNYz9ntYbF5OXg Q==;
X-CSE-ConnectionGUID: adoZIqW8TbOSMr4RhWkLuQ==
X-CSE-MsgGUID: 4e+UgHAyQRybC/7SzeqHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72109735"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="72109735"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:50:48 -0800
X-CSE-ConnectionGUID: PUOVIsjPRf2PFloFl7wIjA==
X-CSE-MsgGUID: qeXbabCUQdmoOc2Z8toyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="212131361"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:50:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, daniele.ceraolospurio@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 0/2] GuC CT memory optimizations 
Date: Fri, 13 Feb 2026 12:50:41 -0800
Message-Id: <20260213205043.3111176-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Profiling has shown that reading from VRAM on BMG is very slow and
introduces significant latency in GuC CT operations. To address this,
CPU-side read buffers (G2H) are moved to system memory, and unnecessary
CPU reads of VRAM in hot paths are removed. This is marked as a fixes
change due to the dramatic improvement in G2H performance, which affects
hot paths such as TLB invalidation fences and fault-storm handling.

We likely have similar issues in hardware fence signaling paths that
currently read from VRAM. A follow-up will move the LRC fence seqno (and
possibly other CPU-side LRC reads) to system memory as well.

Matt

Matthew Brost (2):
  drm/xe: Split H2G and G2H into separate buffer objects
  drm/xe: Remove H2G reads in CT send path in non-debug builds

 drivers/gpu/drm/xe/xe_guc_ct.c       | 80 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
 2 files changed, 55 insertions(+), 31 deletions(-)

-- 
2.34.1

