Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCC7C5AD7B
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 15:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D7C10E084;
	Sat, 21 Feb 2026 15:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4Ksdmqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6A10E06D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Feb 2026 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771687380; x=1803223380;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eRn3p/bF8Urc3VFliuw8lWvQJ3f2n8SOz40r9++CJ+g=;
 b=k4KsdmqoFbIN7ynsWx2BqUSC4w0KbwbUR/Hki1RrL+GBQpwN/3e2xY1p
 WrX0kP2iuSwfjaJfDFti0yZdOo/HTRKwn4aGBUIEarWPauNoOj3rjLKss
 m47E8YFjVitptKNcQJUJTcexANudoNnI+rtrFu0caeUof/cs0LALiuUhX
 84pzhTrNBQ18ZztFZ2wZNDfUaeGlbITuNfCU9UmVdGcuebGN1ExCjm7cA
 s2wCfvQsVokClo1sgV7TQW2DpqHnL3uHHDLzvhXa7JlNHTjG7DEbzITn8
 kRT7eOVP4mBE8bWEeOz2sM8QpjkL9IC0H910Qvf1ujpfzTLnsLnz0CS+R A==;
X-CSE-ConnectionGUID: bFHesVnsSwSZqtRy3lXI7A==
X-CSE-MsgGUID: JZocVKS/R5iLFo5V9L/BUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72852225"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="72852225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:22:59 -0800
X-CSE-ConnectionGUID: l+E+p/4DStuI3up0JykVuA==
X-CSE-MsgGUID: VWQ15gJmRMmr+RsLP39i1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="215136018"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:22:59 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/xe/pf: Some VRAM flag improvements
Date: Sat, 21 Feb 2026 16:22:27 +0100
Message-ID: <20260221152230.7071-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/161908/#rev1
v2: CI only, swap patches 2-3 (Matt)

Michal Wajdeczko (3):
  drm/xe/pf: Use explicit VRAM BO flag for VRAM provisioning
  drm/xe/pf: Don't force 2MB VRAM alignment
  drm/xe/pf: Don't use LMTT page size if no LMTT

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.47.1

