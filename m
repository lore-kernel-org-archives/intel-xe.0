Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF12CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 09:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340510E570;
	Mon, 19 Oct 2026 09:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AB010E570
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792403846; x=1823939846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/4obMja39Z92I73guGB7A0x9J16FzTDaH3DTjREEXUs=;
 b=RduZHB7G6Kazmh/5/zQipPO+VRHdfY4WSU1PmZIGG4guLZ4djAQEh8MG
 VjYJNu1Kk7eLDRk417JwFvjuDOgqi62YH5vfRQpgXQc722qMf5Mk5abvv
 s1dUQxcz0vA+hAutJ+wVtUnMRHC7lJUNDvvTp5/irtoZPvhkDVxthlBUl
 PnVl4WLqpoWGI0z/BPPHNoPkwF6qx0Srk8n1GLK2Z9wJOsvlKdDF52PT5
 41ecykJMLgMp/zTK3v9M29WGv2prUi4OIaDkWKC32Ko8YSsu9now3GTuc
 RSiz+kY+pBTIK/hZL7e5Hk0lBB0tyH3aW3JPLu0ZvJfI6JfjKd5E+Jhrk w==;
X-CSE-ConnectionGUID: DDINb0f+REq3FTP8ZxQDCA==
X-CSE-MsgGUID: TD5VnqT/TQSqyBDZPkLa1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1094996"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1094996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:26 -0700
X-CSE-ConnectionGUID: HQp/a2/FTgeZzJGIPpSsFQ==
X-CSE-MsgGUID: WnchhkPqSJGk/D/ATnbGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2553631"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 0/4] drm/xe: Split the bo shrinker and adjust batch size
Date: Mon, 19 Oct 2026 11:56:51 +0200
Message-ID: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Shamelessly stolen from i915, To avoid gpu stalls for small
shrinker request, Set the shrinker batch size to the average
size of system buffer objects. Use the number of
populated struct ttm_tts to compute the average size.

However, it turned out that it may be desirable to have
different settings for purgeable and non-purgeable objects, since
purgeable objects are cheap to reclaim so split the
shrinker into one for purgeable objects and one which can shrink
both but is invoked with lower priority.

v2:
- Fix the average object size estimate to account for the full
  shrinkable and purgeable population.

v3:
- Drop the shrinker accounting double-subtraction fix from this
  series; it has been fixed and merged upstream separately.
- Patch 3/4: new patch, splitting the bo shrinker into purgeable and
  non-purgeable shrinkers, per a suggestion from Matthew Brost.
- Patch 4/4: reworked on top of the shrinker split, and the batch size
  update is now performed under the existing shrinker lock, fixing the
  data race caught by Sashiko AI review.

v4:
- Patch 1/4: new patch, skipping objects for which xe_bo_shrink()
  returns -EBUSY rather than aborting the shrinker walk. (Sashiko)

v5:
- Patch 3/4: make the non-purgeable shrinker seeks value tunable
  through Kconfig and sysfs. (Matthew Brost)

Thomas Hellström (4):
  drm/xe: Don't abort the shrinker walk on -EBUSY
  drm/xe: Track number of populated ttm_tts in the shrinker
  drm/xe: Split the bo shrinker into purgeable and non-purgeable
    shrinkers
  drm/xe: Update non-purgeable shrinker batch size based on average BO
    size

 drivers/gpu/drm/xe/Kconfig.profile   |  12 ++
 drivers/gpu/drm/xe/xe_bo.c           |  12 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c |  50 +++++++
 drivers/gpu/drm/xe/xe_shrinker.c     | 213 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_shrinker.h     |   7 +-
 5 files changed, 236 insertions(+), 58 deletions(-)

-- 
2.56.0

