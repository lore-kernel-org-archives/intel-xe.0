Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1025D2E038
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 08:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266610EA4A;
	Fri,  5 Dec 2025 08:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1n/nkzm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422E10E259
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764923187; x=1796459187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iZmI7Xu6IMP9iCdZjbEDpjFKlSN4VgVCWIPkqMTnYuQ=;
 b=F1n/nkzm2fmJ3By+uyurAppC+EkmUV8mgqV2pe69O60+Ts/p+oYY36nl
 iGO9JRy1VqoPRskJi7Tuu3hLAvkVYCotYraOex/jKpz2qmlAsHzizHj4f
 iHFEBb+1iBRe3axpCdRvwpH9/PwuT8W69Y/r3Lvr6BqkXH/c+Wn2pTD21
 ZgeBPxqo0Rj9Y+Yf3uWR/YWTsZe6ZWdeB8K+wFcEhZPxRKdXrcX/avGv1
 H/Pit8ywandiYkXqM1dGJRJ0kKA2VWoQaAR5E9/NCTH+SWOZabyBSP8rf
 zYUbzzxabIPeLe9K5w4t/Qvb1508r20LyryQNVqRYhq6ZdesOIXnJ9eDg g==;
X-CSE-ConnectionGUID: rkjKITpHQyap6vy3UzqJmQ==
X-CSE-MsgGUID: QtnHp2dPSK2wE30Ix87xMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66144668"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66144668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:26:27 -0800
X-CSE-ConnectionGUID: dFyzL/ISTx+ex55J69SMdA==
X-CSE-MsgGUID: DVM48gUvQq2Fq0l4qMWaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="200191032"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2025 00:26:26 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] Reset recovery_queued after issuing RESFIX_START
Date: Fri,  5 Dec 2025 08:26:16 +0000
Message-ID: <20251205082615.154649-3-satyanarayana.k.v.p@intel.com>
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

During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
clears the RESFIX_START marker. If migration or resume occurs before the
VF issues its own RESFIX_START, VF KMD may receive two back-to-back
migration interrupts. VF then sends RESFIX_START to indicate the beginning
of fixups and RESFIX_DONE to mark completion. However, the second
RESFIX_START fails because the GuC is already in the RUNNING state.

To prevent VF KMD from queuing additional recovery work items when extra
interrupts arrive, move the clearing of recovery_queued from
vf_post_migration_shutdown() to vf_post_migration_resfix_start().
This ensures the state is reset only after the fixup process begins,
avoiding redundant work item queuing.

Satyanarayana K V P (1):
  drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0

