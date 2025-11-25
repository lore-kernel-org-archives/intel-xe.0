Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4DFCFD372
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 01:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E5410E284;
	Tue, 25 Nov 2025 01:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTA90ocp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C210E284
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764034920; x=1795570920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7UZMVmhUPAV2K7BZRCa6ldG3V5A6CjfuOxFkWt3bbv8=;
 b=JTA90ocp8iSD4WUzgN51GkelRjlm8nOHkFL65LeAGpDfuUlzr4uTxf7s
 hnAeKgx9/RB4Gpu+ZRRadZYB/cFiZKHpYHJmL3W4RVKXq6A1ux6xb1dsO
 rrxfvtiLrft4bVZiNqercNd3SAgzLEnm4/tZh9/SJtOdh2qG5lAkCMjk/
 VXOBeGbst3lk0lLP52X5vI/bdN7IhTFD1VTkH4blyWuGU3l4xn6vBKy5w
 BIN06Rlngt9VOTtKC0Hqjp28MyaM4/UUMO9a92Lk9nbrc4cHIRZcnSXiv
 pbVra/M95nCgAmlfhO0IjCgFeMn97sigNK8ARnvknSonBze73+aaVczOs A==;
X-CSE-ConnectionGUID: z27kfAcURaq+EqwKCP/uvQ==
X-CSE-MsgGUID: YR9iO8RzQGin+se0JGL4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83437191"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="83437191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:41:59 -0800
X-CSE-ConnectionGUID: XHRBsp0EQAWDmMmAxQwd7g==
X-CSE-MsgGUID: D3NLJqh8TOqMc1jwzt7M9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="196960917"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:41:59 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/8] drm/xe/guc: Recommend newer GuC firmware
Date: Mon, 24 Nov 2025 17:41:35 -0800
Message-ID: <20251125014134.2075988-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Recommend firmware v70.53.0 for MTL, DG2, BMG, LNL, PTL.
UAPI compatibility version 1.26.0

Recommend firmware v70.54.0 for BMG, PTL.
UAPI compatibility version 1.27.0

For clean merge patch includes reverts, cherry-picks of patches added onto
drm-tip.


Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Daniele INTEL (1):
  drm/xe/pvc: Add GuC firmware definition

Julia INTEL (5):
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, LNL
  drm/xe/guc: Recommend GuC v70.54.0 for BMG, PTL

Matt Roper (1):
  drm/xe/nvls: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.51.0

