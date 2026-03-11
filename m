Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A787FD0620
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 06:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83B310E327;
	Wed, 11 Mar 2026 06:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvxEIbki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F356D10E327;
 Wed, 11 Mar 2026 06:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210707; x=1804746707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGl4W5WREUxdGdPshx1TU/ihqA0l0arusUDo5BDzjGU=;
 b=PvxEIbkiq+4WZdSKnG1VZ5pKq2WkjVXSDv5bi3BBEHjFubIn3nnSzykD
 8BHWctcg/ZAxHFwKcwbvmc3rbTOu79p2qqSZ20DSf+LViwnRg1Za5lgn3
 tz5OZT1/b6B5XW3hsRO1dtGYTi+x066Gc1q5Zsvy8S1ZBi5KtjOumavcm
 nWkQKT1pTOep+zbY0+XcpsqRBs2hd6sDQi5EH05DLjQQzCfeyIDsPpomv
 tikUnmpYv5Y1Zd1kX0bMrqsqV7LPlHsW4XL8Dllt+zQ8B4NyIphWcedIz
 Xbm0M+lGGoFN2LkFDUPvajbTYCfCo4QMTUqdW7JfPFAyarB3+U9rYVShx Q==;
X-CSE-ConnectionGUID: fM0hgc4NSZyRWHoECY7I8g==
X-CSE-MsgGUID: FGITDruCSiatRQrDjsZpSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74312438"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74312438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:31:46 -0700
X-CSE-ConnectionGUID: g05FOk7WRUCkcZYjmD5cTA==
X-CSE-MsgGUID: BNr+fO0CQombEsUck8TaxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217061175"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:31:44 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH 0/2] drm/i915/dmc: Update PIPEDMC interrupt mask
Date: Wed, 11 Mar 2026 12:02:57 +0530
Message-ID: <20260311063259.2608206-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

On display version 35+ the PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.
Update the interrupt mask accordingly and enable the
PIPEDMC_ERROR interrupt.

This series is a continuation of:
https://patchwork.freedesktop.org/series/162934/
The original patch has been into two patches as suggested by
Ville Syrjala

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
  drm/i915/dmc: Enable PIPEDMC_ERROR interrupt

 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

