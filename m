Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27FED767D8
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1BB10E8CF;
	Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3Tw7kf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1923710E8CE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387869; x=1761923869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/tMPFoLEp28aSt6o0j/jHW9nhe5Lk00JUhvbkbbhEIk=;
 b=j3Tw7kf2J1c+SC3EVonMmmR0dMkmgf2YeC64j23JLV11/s2sk1M18HSy
 rqY9yxjwxP96Gfy8FtMmaV3iDNopHQDUBc+N8k9uy552x2LZhQsQ6z91U
 Hjf1hTUqT4YN0Snpgm/QjA87tF+1yy19SgQAll5AicwmKycDtnwLh9Jn4
 9k0VUwCdbEqitEKVK2uI/SAXN33LXgzNl5ffBr+pCpKF7AwkDYcn0KR8L
 3fwRd/RchL1LXZRwO6hW9PjhYet8+luXwY+BWuP1BMabkdUT+NOx2jP9S
 PKTeGqpCnS/0625+lslROwLxvFKbXOJTTuprVhPix5wKbF1yr1QaJMLqh w==;
X-CSE-ConnectionGUID: ulWsAvGiRna1G8d9qpaG2g==
X-CSE-MsgGUID: UhOfkaQRSTWMu8uReh3FTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29568919"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29568919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:34 -0700
X-CSE-ConnectionGUID: lnq8Rkf9QkGIzJFq1PfQPg==
X-CSE-MsgGUID: hocrzNh6S5mK6WsLVPsRRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87798843"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:33 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 0/4] PF: Add functions to save and restore VF LMEM and CCS
 data
Date: Thu, 31 Oct 2024 16:17:21 +0100
Message-Id: <20241031151725.28315-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

State of VF LMEM and corresponding CCS metadata needs to be saved and
restored during migration of VM with attached dGPU VF. Add helpers that
allow it. We will start using them in upcoming patches. For feature
enabling and testing purposes, allow to save VF LMEM and CCS state and
to replace it using debugfs blob file, but only under strict debug
config.

v2:
 - allow to set offsets for SMEM and CCS buffer objects (M. Winiarski),
 - extend the commit description with the explanation why existing APIs
   are not enough (N. Das),
 - allow to save VF LMEM and CCS state and replace it using debugfs blob
   file (M. Wajdeczko),
 - use asserts in internal functions (M. Wajdeczko),
 - hold PF master mutex when accessing VF LMEM BO (M. Wajdeczko),
 - instead of waiting for fence internally, return fence to the caller
   (M. Wajdeczko).

Lukasz Laguna (4):
  drm/xe/migrate: Add function for raw copy of VRAM and CCS
  drm/xe/bo: Add trylock helper for buffer objects
  drm/xe/pf: Add functions to save and restore VF LMEM and CCS data
  drm/xe/pf: Allow to view and replace VF LMEM and CCS state over
    debugfs

 drivers/gpu/drm/xe/xe_bo.c                    |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 317 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  18 +
 drivers/gpu/drm/xe/xe_migrate.c               | 208 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h               |   5 +
 7 files changed, 642 insertions(+), 2 deletions(-)

-- 
2.40.0

