Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF231607458C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jawPSTdT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7806410E5BA;
	Wed,  4 Nov 2026 21:54:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B328310E071
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829236; x=1825365236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dBDKqmABlpCsy5lPXc4EXPbuzB+gzZso+eolIRhf7lA=;
 b=jawPSTdT3XbMZRzC+oapf8WD20zHr2hXZmtHl8SZ/GtOa7wXRd4PMukz
 eKGxzAaN1W9+9h4xb3RRC6ZjvltGpbGbwp1wCITlo1limTYOLL60FNSHE
 Ywb9cNq83J10f24P6fvVIZQq7Mwj9TAe5jjeiUK1gDeRA+yPytePTuRM6
 4BmEBsDLHLhJrQsNRhuFseG2HssFNth6f6DuyqfUxvgELob6PgMVhsAXv
 WIXUSR5tMz7ia59qnWB9CU+vxGzjA70KnSVC8BWeKISRl9RLfHuQN1XjQ
 Lg5WaVFrAAkb2w7WYAbNvRR0yWfhd/g/l3FHJSNA/pQSKzvKiUmOKLd30 g==;
X-CSE-ConnectionGUID: QZxsBXTwRUefOrFUGO3Kug==
X-CSE-MsgGUID: Bd7voZ95TK6ZqRXvwk7S+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2502148"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2502148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:56 -0800
X-CSE-ConnectionGUID: PzgWdfWXTTqJWErZfPM6lQ==
X-CSE-MsgGUID: 8zscYrt3Say35DYGqJRIHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6831381"
Received: from dut4425arlh.fm.intel.com ([10.1.80.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:55 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, anoop.c.vijay@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/3] Add a few sysctrl refactors in preparation for
Date: Wed,  4 Nov 2026 21:53:53 +0000
Message-ID: <20261104215353.234314-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I'm doing some debug right now that touches address translation
(ATS) configuration around the suspend/resume time. Right now,
we're re-enabling ATS through the resume path regardless of whether
we get the d3cold hint, but we only re-enable the system controller
when the d3cold.allowed is set. This means if I'm trying to touch
this through the firmware, I might not be able to do that easily
on the resume path.

In this series I'm adding a few refactors that allow this kind of
debug. The first patch moves from a dynamic allocation of some of the
sysctrl buffers to static allocation to avoid re-allocation in the
resume path. The second patch moves the workaround initialization
a little earlier in the driver for an easier hook here. And the third
patch moves the sysctrl initialization outside of that d3cold.allowed
hint in the resume path.

All of this was developed in collaboration with Claude Opus.

Stuart Summers (3):
  drm/xe/sysctrl: Use preallocated mailbox staging buffers
  drm/xe: Process device OOB workarounds during early info init
  drm/xe/sysctrl: Restore the SoC remapper on every runtime resume

 drivers/gpu/drm/xe/xe_device.c          |  3 --
 drivers/gpu/drm/xe/xe_pci.c             | 14 +++++++
 drivers/gpu/drm/xe/xe_pm.c              |  9 +++-
 drivers/gpu/drm/xe/xe_sysctrl.c         |  6 ++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 +++++++++----------------
 drivers/gpu/drm/xe/xe_sysctrl_types.h   | 11 +++++
 6 files changed, 56 insertions(+), 43 deletions(-)

-- 
2.43.0

