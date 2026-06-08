Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EACCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 12:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A00010F361;
	Mon,  8 Jun 2026 12:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNyAtDS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B655310F35B;
 Mon,  8 Jun 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780923291; x=1812459291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zu+bX2MEcLcnmi346hj9WMOklfstSEc2z49I8Ylttno=;
 b=lNyAtDS9CXxo/yc3QOKCwg3aZJgppMMpOe4cOPw/15Z7hGC0JdsIQnhe
 QLgu8NSxKYu/UVt4PryTqgZQiZEGUSQKxR5VW3ikyUSx+JjRHX4OXqWZ+
 PR1l0UTb5DfauMCEh5nTn61YlVZPsIz060yJp0AP5Wsh1StMicr7zVbmT
 zsJ6fJUt3Y0F1UxcTWUb4R/G5qTJPWi6mZ3XLre/vu8zQDQdhTi0J68Rk
 3KrahrB3pSS9S1FUP1dPFK5m1wHabUvxz5P0/Lhcbx4S0je1Qfc3jLuTe
 aoVu/D0HLc7Apvdft2+lEwjC4OvyBQO6e/Cvdwd6uzXFpEYYrOCN4H9Bd A==;
X-CSE-ConnectionGUID: Lc9emXUFTAqlxPulkuIgPA==
X-CSE-MsgGUID: QrJnghifTWGOne3jBRIvqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85282745"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85282745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:54:51 -0700
X-CSE-ConnectionGUID: zUXzTi1zRgqfu3slRrYqeA==
X-CSE-MsgGUID: dTutTRTgSFqWRNBoBOGi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242585932"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:54:49 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 0/2] Extend VRR safe window wait for VRR TG
Date: Mon,  8 Jun 2026 18:07:08 +0530
Message-ID: <20260608123711.1121908-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Currently VRR safe window wait is only used for case where VRR is
active. This can be extended for platforms that always run with VRR
timing generator.

v2: Address review comments from Ville.

Ankit Nautiyal (2):
  drm/i915/dsb: shift delayed-vblank DSL wait start by one scanline
  drm/i915/dsb: Use safe window path when VRR TG is used

 drivers/gpu/drm/i915/display/intel_dsb.c | 30 ++++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.45.2

