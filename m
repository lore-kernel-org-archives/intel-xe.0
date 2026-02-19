Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0697C531E3
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3BB10E08F;
	Thu, 19 Feb 2026 23:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDPcabAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD310E08F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544366; x=1803080366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lG00E9cyDN1k/u3P7xn96zbtIieMD80SO+XQDkd31zE=;
 b=VDPcabAM/pfKPAJMHy3IZXwUQYwcPgGDstfSei5TSE/PSNFaAn4b/cX9
 1hglN4o6opNxbZOaDzNvB1W6V2y7dkVLv8/Pl7fjkvvki98Mh2P8F2sPr
 s/Q8xh/hk0FanmBROdF765XzqvsX5T4nCyNgCagvc9VlfjnmZdiPn6LTA
 TodtcDsiYbJDyaI1wK4lxNe990aEyvBZQNL8ASJNslc4kOVchegQ3z/jP
 olsOPPHgYEWFxe0UWgnhQh7We9em4aRTJSlCTl2dW0TI/q0r25+/LPoyt
 LZBHDOW63A83YQQgGcqy5wtoPD1jtO1EvBQMRHC6zArvjd7EGWHErolfD w==;
X-CSE-ConnectionGUID: cQXFNOeQR3mQlrP98ML3iw==
X-CSE-MsgGUID: LYigp2qlQMyBJLnl7vrUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60218600"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="60218600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:39:25 -0800
X-CSE-ConnectionGUID: zRt7v5WHTc+42ieAvYfVVw==
X-CSE-MsgGUID: nJdTweOOQq6CqFWvoxdqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="243239583"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 15:39:25 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] Cleanup partially initialized sync on parse failure
Date: Thu, 19 Feb 2026 23:35:17 +0000
Message-ID: <20260219233516.2938172-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

It is split to 2 patches due to different fix tag.

Shuicheng Lin (2):
  drm/xe/sync: Cleanup partially initialized sync on parse failure
  drm/xe/sync: Fix user fence leak on alloc failure

 drivers/gpu/drm/xe/xe_sync.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

-- 
2.50.1

