Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7956C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5A910EFAE;
	Fri,  3 May 2024 19:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmyzyVlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FB310EFAE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714765097; x=1746301097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p+J23TFq/1FxK++nDkzGpNsvI3pktjNNdMU6UBQETEU=;
 b=JmyzyVlhwmHLjCegYTjlKukhdDjxWemlSUhPfcB0vGwcRL0kNFRL1yyr
 /Rpp+E+F0DNko5/OjizAe8kOn7AzyU9ggyN98M1S/qm6QI6HYaqEAnaIU
 btREaJ3w1uf3I4x3I61OWS/Y2GEqmT4GP8nrWTsNgkLRwS21y/Cxiq/ej
 gwNqAToQJ9Is1JiE5G1NDs8clhat82cy4W3pprWqqr8M7LTYwBgY/SL1t
 U8Duawn8qyUdsVOJygZELfNZgWpM77hihX4Imim8sq00XCVUWxIL8AcUz
 ODMaHwcSOtcWwoVRLXbWN7bZp+iNK2ZwE3jFZC/QM83WXgw3/WDWsQ8TG w==;
X-CSE-ConnectionGUID: wiRdsPEpT5+v+D/gvlZJKg==
X-CSE-MsgGUID: VLY2M0/mR0e4ob+84QpKsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14393795"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14393795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:38:16 -0700
X-CSE-ConnectionGUID: rcGmujOhRY+4OR96JizE8A==
X-CSE-MsgGUID: sot2SYgnQ/yOERkGSwNpNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64977588"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa001.jf.intel.com with ESMTP; 03 May 2024 12:38:14 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v5 0/2] drm/xe/mocs: Add debugfs node to dump mocs
Date: Sat,  4 May 2024 01:09:00 +0530
Message-Id: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
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

This is useful to check mocs configuration. Tests/Tools can use
this debugfs entry to get mocs info.

v2: Address review comments. Change debugfs output style similar
to pat debugfs. (Lucas De Marchi)

v3: rebase.

v4: Address review comments. Use function pointer inside ops
struct. Update Test-with links. Remove usage of flags wherever
not required. Create separate patch for moving function. (Lucas De Marchi)

v5: Address review comments. Move register defines. Modify mocs
info struct to avoid holes. (Lucas De Marchi)

Test-with: https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-janga.rahul.kumar@intel.com
           https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-3-janga.rahul.kumar@intel.com/

Tested-on: ADL, DG1, DG2, MTL, PVC, LNL

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Janga Rahul Kumar (2):
  drm/xe: Relocate regs_are_mcr function
  drm/xe/mocs: Add debugfs node to dump mocs

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  38 +++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |  11 +
 drivers/gpu/drm/xe/xe_mocs.c         | 299 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_mocs.h         |   8 +
 4 files changed, 314 insertions(+), 42 deletions(-)

-- 
2.25.1

