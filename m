Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB0606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dov9HZGT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DA9112AC9;
	Fri, 27 Nov 2026 13:10:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30581112AC9
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795785043; x=1827321043;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6YhQjdV0Y0228w5lQ82u5yD+eGNvYbOgCcTwsVH4HoM=;
 b=Dov9HZGTgroM6XjPzZRpgen2JyI5cApgixapNJc7WrZAPcyiIiW/goiu
 gG+UfzxpIW9Mo9rEzxrYpuqhHSK5BoaIDjhoB6Pgd+H+GEC0UeXqV+4PU
 53SmbMnfYcjIGCXy0YqjZ0VNXTGxmxuQtnBW/5Sb90yiV/mRAUrj0g/+L
 lZhrKTH2rJsRiYYw6HNmXyE3ROEGVAXqY9q34O/OYyuOTiPESAXCr+t0N
 +xin6GM/JFkdePvESUAoctIinT23U7TxZCfSs1Hlj1cOWftX2pLafvzu5
 i1fFM7hK43hbenwspgJBL0FouSCNsdW5043cZMgk6AV1ZB5HzKvmTvZAS w==;
X-CSE-ConnectionGUID: iJQXtDolQd2UprmImDlnTQ==
X-CSE-MsgGUID: fHiAlmnoTzi5V71lZ5i28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4763430"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4763430"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:10:43 -0800
X-CSE-ConnectionGUID: h5P1yP+gRC6cttPt90ikxA==
X-CSE-MsgGUID: 3lrVGLDaQXGn7CI4Mu5DAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12396047"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa007.jf.intel.com with ESMTP; 27 Nov 2026 05:10:42 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/multi_queue: Expose CGP address via PPHWSP
Date: Fri, 27 Nov 2026 18:38:16 +0530
Message-ID: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

The Context Group Page (CGP) of a multi queue group has the queues of the
group and their LRCAs. This series stores the CGP GGTT address in the
PPHWSP of the group's primary queue, so debug tools can find it.

Patch 1 is a small cleanup that sets the CGP info in the context
registration only for the primary queue, which is the only user of it.

Patch 2 writes the CGP address into the PPHWSP of the primary queue when it
is registered, and rewrites it after a VF migration GGTT rebase.

v2:
- Split out the primary queue check into a separate patch (Niranjana)
- Use decimal PPHWSP offset, u32 address with xe_map_write32() and assert
  a single LRC in the rebase path (Niranjana)
- Move the DOC note after the CGP GuC interface description (Niranjana)


Tangudu Tilak Tirumalesh (2):
  drm/xe/guc: Set CGP info only for multi queue primary
  drm/xe/multi_queue: Expose CGP address to debug tools via PPHWSP

 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  5 ++++-
 drivers/gpu/drm/xe/xe_lrc.c        | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.46.0

