Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C973C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 09:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6EF10E1E3;
	Thu,  8 Aug 2024 09:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKtyhTyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0400310E1E3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723109185; x=1754645185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BDL4NKXYjjeA59mvzqjlKN+TiZ9fw+lt2YSdpwdXfLk=;
 b=AKtyhTyKXx5X4g/1zpTxOSXsnyrYe0fVR99NwN3sQfBr4UGIXkpiUFOZ
 wmc334WJp7A8pTJsRsUQ7Ny5boJQhDElvAdIPkHgVrqSkhOvl8yg4tODZ
 dMuoRWtk5EBOwSKsvB5txLXxHeLhCAhWQ/sSmAK2DXoRZhATp3gB2S3Va
 iEhbvI4rp2+RRxUb5OF1c1cLZIfIMN2lYgfWBRZ9g0tPCwS3zGoYxsRUM
 0ebSHtdSqbQ2ksHhPzEW15FhEXo/a5tHWYeUh4f6hUVAa6angeGqIXoFW
 7xGIh7SdpjibXcxlc4mtLtBFZsR6Yr5jWih71v216Yyll9jLUcFSSYPqz g==;
X-CSE-ConnectionGUID: KJ7AneysRq2RX2HJob4niw==
X-CSE-MsgGUID: Q8GENfa3TUeETq58OPWeOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25094236"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25094236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:26:22 -0700
X-CSE-ConnectionGUID: 16DrEntxS6+FlDDOF4VWFQ==
X-CSE-MsgGUID: z6OjsgV8SYePjSZ2q+rEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="62000388"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 02:26:21 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/2] Shuffle enable_host_l2_vram order and use MCR reg
Date: Thu,  8 Aug 2024 14:58:24 +0530
Message-Id: <20240808092826.585276-1-tejas.upadhyay@intel.com>
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

This series introduces,
1. Move enable_host_l2_vram after mcr_init
2. Use MCR regsiter as mcr reg and write to all slices

Tejas Upadhyay (2):
  drm/xe: Init MCR before any mcr register read
  drm/xe: Write all slices if its mcr register

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

