Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58303F531EC
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 03:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1774C10E103;
	Tue, 14 Apr 2026 03:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep/6cSp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9FB10E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 03:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776138768; x=1807674768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cQ5xjnVajuHhF8ApcYfAFjOaXE322t5rPum9lJdmkMA=;
 b=ep/6cSp+mcEbLVWDYJnT0L6evN4yXyBvEcrosFEZUm8buy/Ii0FxiWDG
 yjLnnGjdDiRy4wgy0SO7PEZPdJx1tkJMku/Ve7RjyCIwngh13cbpSEXtj
 825e73UA3vN2liHDT20Z1/iW1V9WKWRapq352lPQKyBuawWAy/1K+5M2A
 4lVZ3FsZOfMM1eiJGzyiTl/jQRmzUmHaN9totWhEBt4hd24+2oQ5NIIRG
 HZEi5x1ynchD2lYNIDp/D5pBBkab5zHlAB+DoPml0F3FQE5PSBZOmijfA
 IGjgNsy00yzlyhmh0vjEvgdW83dzw927Qq7rAW+KPW34cLm1rGxBP5Me1 A==;
X-CSE-ConnectionGUID: pzXCgrttQNKHObFR0ic4pA==
X-CSE-MsgGUID: 4oitqJT4So20k6eQtSdShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77050328"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="77050328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:52:48 -0700
X-CSE-ConnectionGUID: cYYr64A+Sr61V8r9nHE1NA==
X-CSE-MsgGUID: UAyI2BNLRJW2bq79zzhgmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="225667127"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 20:52:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/3] drm/xe/rtp: OA register whitelist fixes
Date: Mon, 13 Apr 2026 20:52:41 -0700
Message-ID: <20260414035244.741342-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (3):
  drm/xe/rtp: Don't whitelist OA status registers
  drm/xe/rtp: Don't whitelist OA head pointer registers
  drm/xe/rtp: Fix offset alignment for MERT WHITELIST_OA_MERT_MMIO_TRG

 drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.48.1

