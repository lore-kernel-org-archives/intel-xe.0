Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951EFCCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3744D10E61D;
	Tue, 21 Oct 2025 18:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6b60fBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8510E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761070288; x=1792606288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a0ueS1EsYqkNM70ZbB3eo6wkTQ3ogA+FMgSpyZqEOiY=;
 b=M6b60fBfQ/D1aTnw55B7k8nR0TM0k9kSzEztGfsD4Ptm/uxnoypBTw1x
 XTtevycg5/DnzfXh823OKg1N1wMnkGH99OkGj+E5gKcTkxlIAwHf+yBGt
 dO6hJsesqLiwp3TrgQXTbwJ1r+ZGxYDLnaYazYZYgN/k/uv3ffbdCbLYb
 AXmpun43P5O7pHw+ShjjA+GpPtehaPOlA8ToYrp49kTrMjrOqoAaKIz2i
 y+UWcEoJ8lBi9YweshTV0rObjuU8ZFDymUdmpTHeX4up62hhqIthv5YNP
 nvo88Atqo2X7GKmhWQfCHqlf1A04750mPq67PR5JvA+GoVUX/j1l+zXh8 w==;
X-CSE-ConnectionGUID: jy2Ff64pRdeCl4xT083/bw==
X-CSE-MsgGUID: kfdv4ow/S1ifGmukFkqxEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80644980"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80644980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:11:27 -0700
X-CSE-ConnectionGUID: Ylj7xfNNQiKJfIIrJAdK9g==
X-CSE-MsgGUID: A41gvGoPT22IR6b4n3x/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183519897"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 11:11:26 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 0/4] drm/xe/vf: Minor fixes to post-migration recovery
Date: Tue, 21 Oct 2025 20:12:46 +0200
Message-Id: <20251021181250.1541639-1-tomasz.lis@intel.com>
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
 move and rename CCS BB check functions, switch target of "Fixes" tag

v5: limit scope of some functions, switched 'Fixes:' tag to a different
 commit

v6: removed writing false zeroed var, squashed two patches,
 added kerneldoc, moved location of some checks

Tomasz Lis (4):
  drm/xe/vf: Revert logic of vf.migration.enabled
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c             |  6 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 39 +++++++--------------
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   | 48 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  6 ++--
 5 files changed, 69 insertions(+), 31 deletions(-)

-- 
2.25.1

