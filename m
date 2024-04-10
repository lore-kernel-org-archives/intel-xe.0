Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5184CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755A288F94;
	Wed, 10 Apr 2024 12:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUOB20Ts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902F288F94
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752661; x=1744288661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EEryyIMXrFIvPniZgDWqEXu7RnEMHN5begEcoaXf6/w=;
 b=YUOB20TsWJiJS0OUkWBad2RsH6cX8dj6FcBBvWm//hSIWx4EeZlkh0iF
 6GiznX+G4sr4d5GK3Z+ObwGxkdcnkd1BDwcId25VZ5JhGXPHhMfPc+B4g
 76RVSTY5W0/Gr2y6kBYDOgqGsJc+Ioja/FlvduTuazAyszd5OdaHpZj8R
 uhYcC9llYr1Jb0wIh8xwDnF5qFNgGE1U4hALoHsafAWn2IiXCR7P8ODQV
 7dacmE4a+xTsWiAPo2AcLGxG5wapA4e7LmoM3s0b+Mk60dJF/cfa9JeY3
 pVuOifU7uEIkle/1ZQFPSqvtFxmgiH85vsfGxMEB6ymbfKHtUhvCZTVFm A==;
X-CSE-ConnectionGUID: YVStsE4HQvG1R+uIt3twxg==
X-CSE-MsgGUID: atN+UqKWSF2LVpUQGWFocg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18718620"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18718620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:40 -0700
X-CSE-ConnectionGUID: sVnvESP0SDKvy73KQFK5OA==
X-CSE-MsgGUID: uUL4G++DS4Gswxyoj8OkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20516605"
Received: from lcoutoda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.2])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 0/2] L3 bank mask
Date: Wed, 10 Apr 2024 12:37:21 +0000
Message-Id: <20240410123723.7-1-francois.dugast@intel.com>
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

This new series is a rework of
https://patchwork.freedesktop.org/patch/584654.

As suggested by Matt, the patch is now splitted between internal readout
and storing of L3 bank masks, and the optional addition to the topology
query if later needed by user space.

Francois Dugast (2):
  drm/xe/gt: Add L3 bank mask to GT topology
  drm/xe/uapi: Expose the L3 bank mask

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 112 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     |  13 +++-
 drivers/gpu/drm/xe/xe_query.c        |   9 ++-
 include/uapi/drm/xe_drm.h            |   2 +
 5 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.34.1

