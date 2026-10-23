Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294E606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3hOvrfa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A5F112A8D;
	Fri, 23 Oct 2026 10:01:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9310E607;
 Fri, 23 Oct 2026 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749657; x=1824285657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YcGbe0l6IpaY/i5IthXHmDHF8Md+WRso32aFsqRYmfM=;
 b=X3hOvrfa3mv5moTl9LIeBFfowxmbdrDtbniR7i3+9W0G6Z7LloWOa1Qb
 4c9UHxSwz9e0jIeW5ozFKWJ2BsW8U6/tcnExQgOlOTxAXSjEHwARNyxRU
 lxZSrHH4RAmI5yPtsX1pZWXIl1/SPMpo3ju1D6tet2EnCEKbaZh3SDD1x
 TQ5SDgiNakK7sIZjngH8bOwavz0Pm1DHbE42xMwsIA99FxCrQ0aJu5N52
 A2OVIJ4aZazT8rBuXZj7f5MtkW4N0mq8VPCUvc4sPzD4aqto6fvrxVbFC
 xhYjUV7bPr8VYh8RKBgpjEFJ6tYT9kL6u/i5ErZqur4YL2bnpMheADzQN A==;
X-CSE-ConnectionGUID: g4thy+9fR5mfieNrP9gy8A==
X-CSE-MsgGUID: ohxcssfOQnu3vzIVO+zdkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384251"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384251"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:00:56 -0700
X-CSE-ConnectionGUID: R2IztIpvTrSa32bqeOV3Sg==
X-CSE-MsgGUID: JgTN6T5yQsOWMQiK/FSH8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932681"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:00:55 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 0/9] drm/i915/psr: PSR2 and Panel Replay with the joiner
Date: Fri, 23 Oct 2026 10:00:43 +0000
Message-ID: <20261023100052.683192-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is v3 of [1], with the following changes

- All pipe planes are in the state before the selective fetch check runs,
  so the local drm_atomic_add_affected_planes() and the plane support
  recheck are gone. The plane loop now runs on full update as well,
  plane states come out of the duplicate with a zero sized area.
- New patch resolving the PSR encoders through the joiner primary. The
  secondary has a zero uapi.encoder_mask, so intel_psr_lock(),
  intel_psr_wait_for_idle_locked() and the PSR2_MAN_TRK_CTL
  programming were all silently doing nothing for it (Jouni)
- Apply the SU area WAs on the merged area instead of per pipe.
  Wa 14019834836 was skipped altogether when only a secondary pipe had
  damage, as it looks at uapi.encoder_mask (Jouni)
- Back to pipe_src for the selective fetch area (Jouni)
- Split the merge patch up, the helper extraction and the alignment
  loop condition are now separate patches, leaving the merge patch
  with only the joiner handling

[1] https://lore.kernel.org/intel-xe/20261012124145.1960050-1-mika.kahola@intel.com/

Mika Kahola (9):
  drm/i915/psr: Track all joined pipes for frontbuffer tracking
  drm/i915/psr: Exclude the joiner secondary from active_non_psr_pipes
  drm/i915/psr: Take the selective fetch area from pipe_src
  drm/i915/psr: Split the selective fetch calculation into helpers
  drm/i915/psr: Derive the alignment loop condition from the SU area
  drm/i915/psr: Merge the selective fetch area across joined pipes
  drm/i915/psr: Resolve the PSR encoders through the joiner primary
  drm/i915/psr: Allow Panel Replay and PSR2 with joiner
  drm/i915/display: Allow forcing the joiner on eDP

 .../drm/i915/display/intel_display_debugfs.c  |   5 +-
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  12 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 364 +++++++++++++-----
 4 files changed, 274 insertions(+), 108 deletions(-)

-- 
2.43.0

