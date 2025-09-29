Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52DBCAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B88710E4A3;
	Mon, 29 Sep 2025 20:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+VeZMRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67D310E4A3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759176463; x=1790712463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r7rklabXTDoDc6DVqF/cOaq3TLegqPRQr06oSlETqoo=;
 b=M+VeZMRkorJ+fOa/ATWJ+67KTeRtixxwbohmfI1cm9R9ilJEi8dm63kO
 lhl863rtan9SSV1srJP80saX6Ww9bzeAk79rBGzjIa8gqvuB4TdB+ybST
 GUE68DB/pzAV9/QlYUx/tvBTzskJqQMmQLOvDBUASAdlhzWhPCiOX2OmU
 //ywwesROrOeIWYqipOB+DSV5RlesYhfXON8DJX1s0g6R7GtTpgPdG4GL
 cbH7doVyO6QEA8S3HO5ipfcq1zExLtts6YYE6ebcNgTzULGg2prLu295y
 FP5UpLLvGb7+qfWXLl8yw9AU7vBkebFgJNCqhEodGbibDVMQEV23owJea A==;
X-CSE-ConnectionGUID: kpemvTw6QA6Mvyr1D0e5Qw==
X-CSE-MsgGUID: By4RjzINSmaJQ1tQIyV20A==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60638880"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="60638880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 13:07:43 -0700
X-CSE-ConnectionGUID: lrrqB+XZRMqIdRhnGXlgZA==
X-CSE-MsgGUID: /+nq8U8OT9ie1wzhwcIFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178364468"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 13:07:43 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: TileAddrRange registers are being deprecated.
Date: Mon, 29 Sep 2025 13:12:20 -0700
Message-ID: <20250929201222.337295-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The TILEx_ADDR_RANGE registers will eventually be replaced by equivalent
registers within SoC MMIO space. When that happens these registers will
be deprecated. During the transition, TileAddrRange registers might not
contain valid values, but the same registers in SG unit continues to be
maintained. Reading that instead to avoid potential breakage.

Fei Yang (1):
  drm/xe: TileAddrRange registers are being deprecated.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_vram.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0

