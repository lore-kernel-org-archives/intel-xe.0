Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E615BC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 11:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980C810E8BE;
	Fri,  9 Aug 2024 11:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp+eTwTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5E10E8BC
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201412; x=1754737412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/y7psu0ccyspnNdMB5AC1HcsFnU2W1yo3Rvk9oZklfA=;
 b=Fp+eTwTOGf4wSM0m/PMRezcReCTnWevGviavoP5aW4pqzXkrrJB7/gkC
 Q0BwjRxHCoNlTD9jyyzccZfDpS1x/JOzi53JvIqurPT2pyGdGTcQhz/yf
 eyvG1PpUn4QVv+gFs61tp8xAyQhR2Cni/KLaEHSoOIXQQ010S9dqzY8bX
 uc+8eGpqfMVC2qQKbIGoCYQBnvFD44yFVsGJPBA+ndQ5uFPVRC429lb+d
 Y6FaJijXcI3ZjdZ9pegeUboarfdzNgXWfAN1iFQIakJ98yJ1ATJPuS3kH
 lG6RVWWzWFs1UjUBBBVexs0lynaH0XasjrMsQbkIT2J4fVLVBahiLVquc w==;
X-CSE-ConnectionGUID: mp4EhFoTR/2tQTZJu2fVhw==
X-CSE-MsgGUID: qrzpSet/QX+jgy2eLDp44Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21512404"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21512404"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:32 -0700
X-CSE-ConnectionGUID: i1+NOte5RTuLA/Ecyp8afQ==
X-CSE-MsgGUID: MVZPUgMNTy+XZSQIL2pDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57494194"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] Expose wmtp status as engine capability
Date: Fri,  9 Aug 2024 12:47:34 +0200
Message-ID: <20240809104736.10423-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Xe2 supports mid thread preemption which is currently by default 
enabled. It is possible that the some HWs/platforms/engines disabled 
that feature. To expose that status, this series adds an engine capability 
which UMD can probe to determine if WMTP is supported for an engine.


Test-with: 20240809103922.12964-1-nirmoy.das@intel.com
Testcase: igt@xe_query@query-gt-list@query-engines-capabilities
UMD use-case:  https://github.com/intel/compute-runtime/pull/746

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Nirmoy Das (2):
  drm/xe: Add has_wmtp GT info
  drm/xe/uapi: Expose wmtp as engine capability

 drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++----
 drivers/gpu/drm/xe/xe_query.c     |  4 ++++
 include/uapi/drm/xe_drm.h         | 12 ++++++++++--
 4 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.42.0

