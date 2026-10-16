Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A981CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55CF10E0C1;
	Fri, 16 Oct 2026 13:36:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491D10E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792157758; x=1823693758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cY2bqhaUxNMe8xNCCW3YXtbkj2GNUiG44l77j1pwL8Y=;
 b=Sr8PAVM1ReDRqM3+Q5O6BGCzcPyQ5aUfF7kYYg/Iv9fQoP2nZOvwWAb0
 oryNpryjYu6EPTy1a9Pm283XvQMsHiJ6W95la57Hfhjb+VjnZF1cERkos
 18FvbCdMNHuTZ8QBhGWL51sTeXmIAuy6Gl8hb/31xijlGsWu0j2cg0+MF
 KbpirlaS04BC2bbB64eAQ5Pdot74W9LatYDYWAxQ6wcQgBhbdxvKemFGk
 VyJH/mlZWcONperna9gwStKIRZHd0gvpbIMqnL/UeUIIg62oa9DBvbywI
 VFC4R4Svj36rw0c0nRX48wg0sV1Q7ml1pkNmf3FK0t0SYYiFmAchkEu78 g==;
X-CSE-ConnectionGUID: B9TWovAERH+tY9miIjTmFA==
X-CSE-MsgGUID: yTPymXluSN2lvypXIvP0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831439"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="831439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:35:57 -0700
X-CSE-ConnectionGUID: GeQLu9hKQHOHhIx3kEjCDg==
X-CSE-MsgGUID: yHhMRNNeQhyYk62z1KOytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2273463"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:35:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 0/4] drm/xe: Adjust the bo shrinker batch size
Date: Fri, 16 Oct 2026 15:35:19 +0200
Message-ID: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
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

Sashiko AI review of the v2 posting flagged two issues:

 - [High] a pre-existing shrinker accounting double-subtraction bug on
   nested external pins (plus a related underflow for imported
   dma-bufs, found while fixing it). This has since been fixed and
   merged upstream as its own, separate fixes series, so it is no
   longer carried as a patch here.

 - [Medium] a data race on the unsynchronized read-modify-write of the
   shrinker batch size. Fixed in v3 below.

Sashiko AI review of the v3 posting flagged, among others:

 - [High] a pre-existing shrinker accounting underflow when the
   purgeable state of a pinned bo changes. This is fixed by a
   separately posted patch, "drm/xe: Don't transfer shrinker pages for
   pinned bos on purgeable state change".

 - [High] the standalone purgeable shrinker aborting its LRU walk at
   the first non-purgeable object. This turned out to be a
   pre-existing bug affecting also the non-purge walk, for example
   at imported dma-bufs. Fixed in patch 1/4, placed first so that it
   can be backported independently.

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

Thomas Hellström (4):
  drm/xe: Don't abort the shrinker walk on -EBUSY
  drm/xe: Track number of populated ttm_tts in the shrinker
  drm/xe: Split the bo shrinker into purgeable and non-purgeable
    shrinkers
  drm/xe: Update non-purgeable shrinker batch size based on average BO
    size

 drivers/gpu/drm/xe/xe_bo.c       |  12 +--
 drivers/gpu/drm/xe/xe_shrinker.c | 175 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_shrinker.h |   3 +-
 3 files changed, 132 insertions(+), 58 deletions(-)

-- 
2.56.0

