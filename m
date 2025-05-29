Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC58C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA610E0CF;
	Thu, 29 May 2025 23:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwgZ0nxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1C010E111
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748563129; x=1780099129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G/tmGTTFT4AwePEWVy30et9TIup23W2kgayaA1jTBDc=;
 b=TwgZ0nxsi8g/EIFR6H+zmey7d8VpwEnm9talj4nW7rxN/p+Cx3TU+yt1
 s5mYF7m3nPc0lpDgMJO1+km3F4duoZeUsQ31/RlyJIrAcpj1XDZT8d43N
 WHkgtt7gMa+8hl1CTC1/xTjB0bLhbzl/uqe602f2RN9xUMg4sTTt+89dM
 mr8+VN+spY+VythIV8iyJvU+uiazSllnnphgwfEaGol15/Y978WQbrAw8
 YUawILBsYVFiu9cFCupsy/glqXCDRPfbH0FbEA1tAvY9ZllnL8y3Vz2Z2
 DiNBux1a5LQ8cu7kL73s+Nd6u6B/EjY03B/nSuZ8R3eNDuboUGRf/gK82 w==;
X-CSE-ConnectionGUID: 3dGxf5y2R22zeVsCguh4Qg==
X-CSE-MsgGUID: 4dCZnlvlTSGoKIbW744Hcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49764990"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49764990"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:48 -0700
X-CSE-ConnectionGUID: mFK5nmGuSvenYykbjYrh0w==
X-CSE-MsgGUID: L66i7mChRX2/lACWsXQlJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166889403"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:58:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/4] Enable media OA
Date: Thu, 29 May 2025 16:58:32 -0700
Message-ID: <20250529235836.145097-1-ashutosh.dixit@intel.com>
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

We had previously enabled render and compute OA units. Enable media OA
units with this series.

Ashutosh Dixit (4):
  drm/xe/oa: Expose media OA units
  drm/xe/oa: Print hwe to OA unit mapping
  drm/xe/oa: Introduce stream->oa_unit
  drm/xe/oa: Assign hwe for OAM_SAG

 drivers/gpu/drm/xe/xe_oa.c       | 190 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_oa_types.h |   6 +
 2 files changed, 144 insertions(+), 52 deletions(-)

-- 
2.48.1

