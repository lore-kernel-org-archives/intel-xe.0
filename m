Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4028EF99DE
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 21:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2910E31C;
	Fri, 13 Feb 2026 21:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkkGRB2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4910E319
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771017391; x=1802553391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dGU3ll6HUlRwe7Q+Zyl2ELC5WZ4rBmxW+qfGG3Uk/B4=;
 b=AkkGRB2ErxbtXm+pQ3HAjgdPLCuWBEPccfdeAchhUEThCxZNXHXRwC9y
 eZie8nCsbher6p3O6BrzXW8C7vwfRroOqc6xFyXPCxe3NtXNk6emPZm/P
 /taPETnoUx9mJnbpEaEHBDWm78xJKcopcJsNE5Ou6pO7sxj7tmy9+ulo6
 E1oHxDNidbj4SchAheEfseR59mDPPaZ8UqjhlnASh2EyLJuHcnqo8ezji
 Y9XCvg/0nquqYMld4YDZ81ZgkqNSM0us9meBG5Tquzty3wx02foPKqK4+
 ZUb3geOeVGpCkddmikt8aNEsuDHqat8sSGSm1I0vUOsmZmo6Zbyvarx/Y Q==;
X-CSE-ConnectionGUID: xUB8aol4TBKcGLEox8tIrA==
X-CSE-MsgGUID: bDeli8yUSeazrxXkO2a4aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82533866"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="82533866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:16:30 -0800
X-CSE-ConnectionGUID: ah73hamURa2dGIljqwbDpQ==
X-CSE-MsgGUID: EMiQrzgPQza5EmdvmSQCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="217172457"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:16:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, daniele.ceraolospurio@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v2 0/2] GuC CT memory optimizations 
Date: Fri, 13 Feb 2026 13:16:23 -0800
Message-Id: <20260213211625.3117729-1-matthew.brost@intel.com>
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

v2:
 - Fix devcoredump explosion (Testing)

Matt

Matthew Brost (2):
  drm/xe: Split H2G and G2H into separate buffer objects
  drm/xe: Remove H2G reads in CT send path in non-debug builds

 drivers/gpu/drm/xe/xe_guc_ct.c       | 80 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
 2 files changed, 55 insertions(+), 31 deletions(-)

-- 
2.34.1

