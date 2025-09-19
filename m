Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BBCAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 16:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A2F10E246;
	Fri, 19 Sep 2025 16:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gu1DNFSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E696D10E246
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758297882; x=1789833882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i9aYsLw2ewTBlanIzrCUF9k6hlvD1r/DCyabmaB8Tn4=;
 b=gu1DNFScPvcms7rYdQjU3vRhrty/Jh1cKewh84P29Ti4R8w3ZR9IO+xp
 t8AWjiQYDRBXTsiLYoI83qGzwK/5u3D3gASGejWoMhkE5BkR9uZ2xkCsb
 0ni4ebSQyNGfYaM60ISSGAQojc3Y9mWj4+IDnn4On9Tn814YfCWQC3+HW
 K3oEMNC8TF+bLvU2noCVCond/hNqVDfpFG2a/xUrnYazWwQjTggghyB2h
 2X06zXpyHGN/yPAV03B0w8QnlbLquqwUH73pMjnnUGrAkAEriTJlnwkF9
 k+Qy11rYT6RmfGSCF9DbwYwVP38xnzryNnSl9NYvAScx7GLtFskK1Kkwu A==;
X-CSE-ConnectionGUID: qerBVAsmT6+v2e2vUyoJmQ==
X-CSE-MsgGUID: BgLfOrZLTW+u84IIza5Aow==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="48224694"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="48224694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:41 -0700
X-CSE-ConnectionGUID: CdlMhx0lTxyFQieE4LTnrg==
X-CSE-MsgGUID: i1LPF1gvSpCx9X7NRSo/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="179890101"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe/debugfs: Small improvements
Date: Fri, 19 Sep 2025 18:04:28 +0200
Message-ID: <20250919160430.573-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Michal Wajdeczko (2):
  drm/xe/debugfs: Make ggtt file per-tile
  drm/xe/debugfs: Improve .show() helper for GT-based attributes

 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 129 ++++++++++-----------------
 drivers/gpu/drm/xe/xe_gt_debugfs.h   |   1 +
 drivers/gpu/drm/xe/xe_tile_debugfs.c |   7 ++
 3 files changed, 53 insertions(+), 84 deletions(-)

-- 
2.47.1

