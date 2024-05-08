Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F77C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 22:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016F11324E;
	Wed,  8 May 2024 22:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhOxCrqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA4911324E
 for <Intel-Xe@lists.freedesktop.org>; Wed,  8 May 2024 22:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715208569; x=1746744569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/xAtwl8G5Rpqe2YnkrbZK/qqALt/9Wui9B2Zk79YpRM=;
 b=IhOxCrqsECe55Im07C+oEgr9RwMh1lg6knVGfEVucY45d0hizP5mSl/O
 cdLeyrmHn+4hRiPepm8oQk7cwTVNuayz7aE+AOTOiwsR+8Zd3mx/zdx5l
 l8eHGtkXwJwaV5YGV2fugLUrnsf3mMwNHjTj/n348eQDr0dflaY/fd6Gf
 +Re+cHImnaEVNl3HlMeRlsvCm+2IaCyevo7QWXOJn+il3e+2ruJVUlCaD
 +9Ps7t+CmzLkeW56GsESNqg2htXBSqs1Yak1NSzELu9pq5h/VUET89AEh
 iNxsbHcMpSF0JBZMPuE2nTxzCkh+Zv/lJnLzNtesT/woVLKLe17CIm5Sv Q==;
X-CSE-ConnectionGUID: ArVNbtLhTbiAwdUhTXVi3Q==
X-CSE-MsgGUID: 1HRFki22SqC2HGS2+YAirA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10938732"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="10938732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 15:49:28 -0700
X-CSE-ConnectionGUID: FSQIdAhpTbyrwkbmWdb0sQ==
X-CSE-MsgGUID: zKPw6MM9Qw20gzT7cuu3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33565753"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 15:49:27 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/2] Imrpove GuC debug log/status output
Date: Wed,  8 May 2024 15:49:25 -0700
Message-ID: <20240508224927.11341-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Improve the robustness and decodeability of GuC log output, especially
when dumped via dmesg. Also remove a spurious line feed that messes up
the GuC status dump when sent to dmesg.

v2: Remote pm calls (Matthew Brost)
v3: Add more info and fix spurious line feed.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/guc: Improve robustness of GuC log dumping to dmesg

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c       | 85 ++++++++++++++++++++++-----
 3 files changed, 72 insertions(+), 16 deletions(-)

-- 
2.43.2

