Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E9CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 20:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117510E510;
	Mon, 20 Oct 2025 20:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/ciU0gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6910E511
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760993809; x=1792529809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xqmhA2RJchVAPVmY7DF8DS4lVndPIAFTTQonTKVIgZM=;
 b=X/ciU0gn6ODWYsmIpAVIsHSbc3yLkhZYoRgUTD3xQ3ar/wJbDHBYZ8+S
 JfHimO8sGsN8OTwi77Ei0NQZI1vteQGBuVRZk/Jlf+vcJxyvRtFnqwzDq
 DQDPog6XVofpCZWCDxu+GWSHk8L0eFd3TCVCKfyWEPu8TXdBWJmo98Hfw
 kzp7JgxD+LJ8YqZDrOrdS87aJxWEvIZM4lWP3yTXUMZ+zFdzju83YZ25Y
 bVv5XrDUkxA1+z4nRet2uAZLQZiU61Cj1E9UBudTBNdnhjws64lII9pZA
 KEO8py54GI5D4F+c7zGmaZpwhh6GF0gfal2hwJHkRT20qLKqERkUs4lgU A==;
X-CSE-ConnectionGUID: Mi7PZPikTX+kPTqB5Is8PA==
X-CSE-MsgGUID: 5+eLFV7EQnWWlQrBgi6Z2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63036081"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63036081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 13:56:48 -0700
X-CSE-ConnectionGUID: zZ2rvWBtQ+eZhhUSiD138w==
X-CSE-MsgGUID: sCwt09BvT6CIX1AILpUlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184196579"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:56:46 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/4] drm/xe/vf: Minor fixes to post-migration recovery
Date: Mon, 20 Oct 2025 22:58:04 +0200
Message-Id: <20251020205808.1187308-1-tomasz.lis@intel.com>
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

The series contains few minor fixes, mostly related to VF driver probe.

The fixes are not strictly related, but all go under VF migration category.

v2: Add fixing the currently broken GuC ABI check

v3: Add separation of xe_sriov_vf_ccs_migration_bb_needed()

v4: Remove platform version check, discard early MIGRATED ignore patch,
 move and rename CCS BB check functions

Tomasz Lis (4):
  drm/xe/vf: Helper for telling whether CCS migration BBs are needed
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c           |  6 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 24 +++++-----------
 drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  3 ++
 5 files changed, 58 insertions(+), 18 deletions(-)

-- 
2.25.1

