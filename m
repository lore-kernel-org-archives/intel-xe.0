Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E9C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 19:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00210E155;
	Thu,  6 Feb 2025 19:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPfeVZj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562710E155;
 Thu,  6 Feb 2025 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738869717; x=1770405717;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M+EU3nRQQwirKSiRb1jT9zBIQHZ7VpGTwoEx20TgYJA=;
 b=iPfeVZj5lIr3c/DBWz5J/V2LFLcRMT9tLacRHTVHgVi9pWazhXiXIEor
 VyD5BTL2waPD2ZQmYF3mE96wIaxKweNXj9jRL5SiZycWOdXQgh1g+OOyO
 b1Xub9zzBYYS1dyCGeVfQQpWEJaD7wB/9vhlpHdECp4mhZU86KOUVxDcI
 Yv1Rll3UkIUotsYpO6SBJrXcfBqNaRd5nmyzeLix3cJ8A3+GZmKDfumoD
 QwsYN8QbWrm4MPTbGLZ2weKuasBTnn65rgBnBEauo1iKD+kr3i6gsZrX/
 oCRVD6u93Y5cK+TIFlrZjF8gj3ncCL3Zvhraa3OsLsdXguYYj/yIuDBCi A==;
X-CSE-ConnectionGUID: r2SyK4Y6Qzq04e59dNza7A==
X-CSE-MsgGUID: BScVcuteTrGRN+wV3F6J0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39398810"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39398810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:21:57 -0800
X-CSE-ConnectionGUID: XMqxEqnFTOGIOQTDrG1TqA==
X-CSE-MsgGUID: do14L89ZQg+i7l9mCTg50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111502490"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.111.1])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:21:56 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/xe3lpd: Update bandwidth parameters
Date: Thu,  6 Feb 2025 16:21:27 -0300
Message-ID: <20250206192148.53610-1-gustavo.sousa@intel.com>
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

Bandwidth parameters for Xe3_LPD have been updated with respect to
previous display releases. Encode them into xe3lpd_sa_info and use that
new struct.

Since we are touching intel_bw.c, also take the opportunity to make it
use display-specific platform checkers, which is what patches #1 and #2
are about.

Gustavo Sousa (3):
  drm/i915/display: Use display variable in intel_bw.c
  drm/i915/display: Use display-specific platform checks in intel_bw.c
  drm/i915/xe3lpd: Update bandwidth parameters

 drivers/gpu/drm/i915/display/intel_bw.c | 192 ++++++++++++++----------
 1 file changed, 112 insertions(+), 80 deletions(-)

-- 
2.48.1

