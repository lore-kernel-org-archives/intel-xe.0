Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E50CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7236E10E8DE;
	Thu, 30 Oct 2025 08:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7JP4US8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F406210E8D8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761812781; x=1793348781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jE+mtXYh80UGWPNtcS4VHKUXhj5asoU2eMsOWsab89Y=;
 b=Q7JP4US8TvTMwg6ZV10UWxmj/mHNtE86zbYktPBPBcONtwfmJALJls1l
 U+0Otse3NgVOtJQTp1F5NmZ51By2HqBeLFFbttIJBmptLtrOCjKhUiwvC
 yUQkuuU58xG2qPokh4bLPPGZgcsAxXJsFeiqrN42qVnX+hAkgacZXjYxW
 Qi6T2ly0OXmOUgaRarRI6lud1VVjXg62yzsRncOoi9XWoh2bwvoBJXUuC
 QUF57m8LRKyt/vt2I3WwSbnyQgTelAKcY7p5VPItlXaN6SBE5U8PGpgbi
 FrsucOaAPXsj4I1/M/gKiVtDbVNY29hZvEcBfMCMjdDfMnEyKXHY7SXNA w==;
X-CSE-ConnectionGUID: 6wA8X5XGT2+YtafsUg0dyw==
X-CSE-MsgGUID: iwHmhyclQjK5z8eRYkcqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63832125"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63832125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:26:21 -0700
X-CSE-ConnectionGUID: isTbZv30QPGmFmzKcOFf2g==
X-CSE-MsgGUID: XaHUy8HlQ2qEUDasGPWLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185981843"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:26:20 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 0/2] Fix user-after-free during driver unbind
Date: Thu, 30 Oct 2025 13:56:39 +0530
Message-ID: <20251030082638.3019345-4-balasubramani.vivekanandan@intel.com>
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

There are a couple of worker threads in the driver which could be                                                                                                                                                                                 
running while unbinding the driver. Ensure those threads are stopped                                                                                                                                                                              
before unbinding the driver to avoid any user-after-free from those                                                                                                                                                                               
workers.

Balasubramani Vivekanandan (2):
  drm/xe/gt: Synchronize GT reset with device unbind
  drm/xe/guc: Synchronize Dead CT worker with unbind

 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.43.0

