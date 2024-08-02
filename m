Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3ECC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 21:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85310E0C5;
	Thu,  1 Aug 2024 21:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFFaz9Fw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B0910E0C5
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722547716; x=1754083716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mys6gaVOI35h2pltWCmNiGbjpzfI+JqBjGFYsJutt8E=;
 b=SFFaz9FwIML4imN6b3GFtriz1M6n6zpqI4703HlFNkr7OSSBthqw+sxx
 At5xwr941QEsHwpzOWLNzxLdAiFNGU1xwxLWRDASvYSVZw3yyAm7IoSir
 okqqKgo7bXRqFdBR9P94XhS97fDMrOFQ8RSmAU+A15YFtyY12uVCM5pd5
 mOb9f1090OI9GNX1kTWCfgU8SVhLICMfc6PdDmEX4jKnoOujLT319W2Y0
 DOT+Yy9X2aoLUvXZMEeNoUR4S24zzT4qqpxwKf4N3b+l/YWh1mpcTzwuN
 +cyJzrJmTPlKIAsOUn1LKIsn/CHluBQRVTUM0Irib0Ka9biTR/Xhmqe6c Q==;
X-CSE-ConnectionGUID: MAH9EEb1ROKt1BDMJugqSw==
X-CSE-MsgGUID: sR+SELmrSY+qeBTdSkPJzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20359484"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20359484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:28:35 -0700
X-CSE-ConnectionGUID: k/9KwvBFSsWTUGxKfibx8g==
X-CSE-MsgGUID: MSUXWItISQ6P7AnP2EFA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="60024519"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:28:36 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v3 0/1] drm/xe/xe2: Introduce performance changes
Date: Fri,  2 Aug 2024 02:39:28 -0700
Message-Id: <cover.1722591343.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add Compression Performance Improvement Changes in Xe2

v2: Rebase

v3: Rebase, updated as per latest changes on bspec,
    Removed unnecessary default actions (Matt)
    formatting nits (Tejas)

Akshata Jahagirdar (1):
  drm/xe/xe2: Introduce performance changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.34.1

