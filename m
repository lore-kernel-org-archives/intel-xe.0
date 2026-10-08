Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B028CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457DE10E80B;
	Thu,  8 Oct 2026 12:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HueUQOva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9D610E80B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791462648; x=1822998648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WooV3fvDMwun8JP00p9PqsVeJGghseoF+YRaFjlupOU=;
 b=HueUQOva3w2m951z3zhtjE54rhJp2x1JcNB77DApmpex8Eb2UY20wBB6
 BN3rAvHDFsRpJrS6T8b5KeNdasL2RMalgaDmqSBy/7OwzGwPbiMrJIgKF
 nFPIU9iaRnC7v0WdpFc4enkHACWw2j+7OCvWYeyhhMcLnomxFPkd0qDH2
 7OEfisaRZAPa4DScHnhd3n94rkE75Y5R96ICskRt+tGok4jQwrFI28KZf
 em0Wpmdh4U98Aoc2xYOw7FUP9alXgjNrPpKCerPBPbJrhO4InAm1qzWUC
 cxYpn01RSbpty+bHB92G85+2tZz513Fot0Yffzlt3/DhoZgfjbqDCNOeK Q==;
X-CSE-ConnectionGUID: YuVCUtqhQ/6YGvcCGPlVmA==
X-CSE-MsgGUID: P3LBjhbKSGmoBBS+0h7j6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="142158"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="142158"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:30:47 -0700
X-CSE-ConnectionGUID: P5zjy9/JSFigCJBNuforFA==
X-CSE-MsgGUID: /bX7M4EoQg+B/wrjKqlBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="43859"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.245.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:30:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/3] drm/xe: Adjust the bo shrinker batch size
Date: Thu,  8 Oct 2026 14:30:21 +0200
Message-ID: <20261008123024.38522-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Fix the average object size estimate to account for the full
  shrinkable and purgeable population.

v3:
- Drop the shrinker accounting double-subtraction fix from this
  series; it has been fixed and merged upstream separately.
- Patch 2/3: new patch, splitting the bo shrinker into purgeable and
  non-purgeable shrinkers, per a suggestion from Matthew Brost.
- Patch 3/3: reworked on top of the shrinker split, and the batch size
  update is now performed under the existing shrinker lock, fixing the
  data race caught by Sashiko AI review.

Thomas Hellström (3):
  drm/xe: Track number of populated ttm_tts in the shrinker
  drm/xe: Split the bo shrinker into purgeable and non-purgeable
    shrinkers
  drm/xe: Update non-purgeable shrinker batch size based on average BO
    size

 drivers/gpu/drm/xe/xe_bo.c       |  12 +--
 drivers/gpu/drm/xe/xe_shrinker.c | 172 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_shrinker.h |   3 +-
 3 files changed, 129 insertions(+), 58 deletions(-)

-- 
2.56.0

