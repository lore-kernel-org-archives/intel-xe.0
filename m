Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C371EF9D0CE
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 02:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175510E141;
	Wed, 15 Apr 2026 02:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEFfM9EC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369E110E141
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 02:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776218630; x=1807754630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lBc2D44VY0JVtMLMMJDpvGyfZMy409i+G3k9/QI6Z5k=;
 b=EEFfM9ECjI7qmhGGhH5sRPrFLxad/PH9dEpTSoixkU9Sx86JHRInp1oO
 lIz/X8uW+8HsJiShJ6w9Y2cCKcUosoeQOKo+cCbHLBLb4r8dKI/rq15kd
 /W7EoJVEDSgRAeG/kpDyYOm6sSvnHmn1mxIlvEDFSLEWxnolFXZPtIN0i
 MUVQgMswmObHdygN0AyLHPIJcyNSivg7Tkh8I8+bkk5Ze/00rNCKvcLgd
 J8ZDJtR2ykqCK6FbkGwARZRTa/FG4NCPyIS8oPHMDBlyChNFTmCPmG5Gu
 +M/zQ81c7GPxnX32pISEa6Mzkj+Loaf5nEm6pUMNGYPQpTgl82LlvJs22 w==;
X-CSE-ConnectionGUID: LXZ/NpEZSNKiK5MPJvKccQ==
X-CSE-MsgGUID: uX4usnWBTK+WhV0RrkeJhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79773441"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="79773441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:03:50 -0700
X-CSE-ConnectionGUID: GZRimXezSG2oJ1DBk2vgjw==
X-CSE-MsgGUID: d7XghXXQR7uL1oBl7ZTSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235200873"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:03:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v4 0/3] drm/xe/oa: Wa_14026633728
Date: Tue, 14 Apr 2026 19:03:39 -0700
Message-ID: <20260415020342.782987-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

v4: Change to Patch 1 again (see changelog in Patch 1)
v3: Change to Patch 1 again (see changelog in Patch 1)
v2: Change to Patch 1

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 123 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   4 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 70 insertions(+), 58 deletions(-)

-- 
2.48.1

