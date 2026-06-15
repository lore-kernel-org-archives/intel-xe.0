Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5D2CD98E5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 22:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062910E68A;
	Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bH69m3KU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F4410E539
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 22:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781563353; x=1813099353;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZyibhVa/ThGkJW9OQDdVWoi0le4+RnYBZEBRJgUNVLg=;
 b=bH69m3KUD+PnYqpDRXt4IRaRLffL/7MqTXRM7bU7n0JajUizpDqLaEaT
 OgeC26iHGNpvvamXJtGhgy0cuRQK2yyndJceJOYeJcnFYYgg3rYrhH/6Q
 MtWKODFqtHswCyw4CvJPDDSh2H4Oo21m4x8Tpp3pvTQuKxGSOJ8n4OBkT
 4wnRSRcScPSWlsCUI2Z9dnYil8OS/3ApcMucWciaAJvpW1j/BBok1Jjry
 hFbAehrhHol/i9ZZsvXsKHkVJAuGxWFRnO5SCJW5yPAepgFTiqKrg9Aln
 ferDRw/usmSIkZXxVvohcUQuuGwNr52rTeVbfQEoPdE/Er7EDfWqbtPWc Q==;
X-CSE-ConnectionGUID: wBWSN9Y1SsGGubJMXsFozg==
X-CSE-MsgGUID: u4HHyGGxRmenaSn3doAXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82513151"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82513151"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:32 -0700
X-CSE-ConnectionGUID: 1S3/F81LSUGpnBtt7YQWnA==
X-CSE-MsgGUID: thBtUMBPT1yHbDDBO/GCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247676797"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:31 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/9] Don't whitelist OA registers unconditionally
Date: Mon, 15 Jun 2026 15:42:18 -0700
Message-ID: <20260615224227.34880-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Whitelisting OA registers unconditionally is a security violation. In this
series we resolve this issue as follows:

* Set the 'deny' bit (bit 30) for all OA registers, ensuring OA registers
  are not whitelisted by default after probe/reset/restart
* Reset the 'deny' bit when an OA stream is opened and certain conditions
  are met, whitelisting OA registers only for the duration when OA streams
  are open for a gt
* Set the 'deny' bit again, when OA streams are closed
* To manage this scheme, separate out OA whitelists from non-OA whitelists
  (into separate save-restore lists)

v2: Address code review from Umesh. Patches changed in v2 have changelog
    appended to commit message
v3: Minor change to Patch 3

Ashutosh Dixit (9):
  drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
  drm/xe/rtp: Maintain OA whitelists separately
  drm/xe/rtp: Keep track of non-OA nonpriv slots
  drm/xe/rtp: Generalize whitelist_apply_to_hwe
  drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
  drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
  drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
  drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
  drm/xe/rtp: Ensure locking/ref counting for OA whitelists

 drivers/gpu/drm/xe/xe_gt_debugfs.c      |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  8 +++
 drivers/gpu/drm/xe/xe_oa.c              |  7 ++
 drivers/gpu/drm/xe/xe_oa_types.h        |  3 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c   | 93 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_reg_whitelist.h   |  4 ++
 7 files changed, 112 insertions(+), 9 deletions(-)

-- 
2.54.0

