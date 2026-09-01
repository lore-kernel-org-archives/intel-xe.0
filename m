Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9D3C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3804C10E4EA;
	Tue,  1 Sep 2026 07:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX9nFX69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6EC10E4EA;
 Tue,  1 Sep 2026 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788247858; x=1819783858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ibmzkw9JGEpYJNMS7cFZIWZ0Y7moPCCyshVYhp5Zaw=;
 b=UX9nFX6929As6CBMtktQfsTMLuVXHB67DQ3lRIiVurWiPljMOVN56Vgh
 2VLAux5v6YLonYuVW2hlI+QqI2W+dHrNVyj3sUZXNPG3Rp81OotjHP+C5
 E7My+ldpvz3/R1Eo1yf375ayzhlMBP4Q0v+4MO2xv9NN5jq9BeKThLRhE
 sKa0I8v+h7/2WxLI/s9WCDQQCOO5OmOyjdCNvUPvSABUu74NOSuATfHQy
 bj9MZzdvU8lmll6Bc62uiCBlZ0LtDmJ4pBCO8bRgtMf6021QOJ5bLloaH
 C4hjiVrMrwjV77svGu7zxutdn+mLOPBqXzw3BK/mt7sWDLhoMxGU+vhGB A==;
X-CSE-ConnectionGUID: jLrz9zyCTWubr7hQRuLyCw==
X-CSE-MsgGUID: wfJLnvhcSdqDgYOoRLyEFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88691946"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88691946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:30:57 -0700
X-CSE-ConnectionGUID: NtvI6Gl9T0qDwJRShEKFRQ==
X-CSE-MsgGUID: KGdJwcDgQ+6lRqYgaZZZdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272803082"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 01 Sep 2026 00:30:56 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/5]  Enable joiner cursor fast updates
Date: Tue,  1 Sep 2026 12:58:08 +0530
Message-Id: <20260901072813.2596383-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

     This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (5):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 292 +++++++++++++++-----
 1 file changed, 222 insertions(+), 70 deletions(-)

-- 
2.25.1

