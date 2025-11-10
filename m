Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C644CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 22:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD610E0D6;
	Mon, 10 Nov 2025 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lzz1/Bne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FE510E0A4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762812908; x=1794348908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4VexLu/MzCzmDL4dD+GwfgH09eXO6Pztaopf3nNQf/o=;
 b=Lzz1/BneRszDB9A1TVA/EiuouVL6nh4wb1rdL4tjFCwKRfyhHEGKZaU/
 k33Fd24zfoPy22JIN+Uou5qdoIcMY7AxUZWlAkYC1H8CMdDIQ3R7RBUJT
 buScVwi+TUW5iD8dFGPiPyCL/KX5XuhzuswdjqaK3trDz6syTf9/eB29M
 Xr7jV0Tffml/aaaNaMOt5HtBKj1SlcoYaHSa8Dv5GWqW0jXcjFXKNBVLW
 VJMrodswqGIHNCIr4Wjp4IP4m3RYquhz3cS8NCVJ7eA0FOaaMrcWyI8ul
 VTLhm+BO5d7IixnpohSOYTGc4mG8TvbCgwRhePmHchKlGbnj186x34P2w Q==;
X-CSE-ConnectionGUID: Et8be/sES1OmaEq7FPhW3Q==
X-CSE-MsgGUID: KyuAJPkVQQGLtWWljM1NEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65025119"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="65025119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 14:15:07 -0800
X-CSE-ConnectionGUID: niEYbQ+WRsm4nLCLScj+Bg==
X-CSE-MsgGUID: +xkdWOIPQE+ffIHjWWs/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188961387"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa008.jf.intel.com with ESMTP; 10 Nov 2025 14:15:07 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, nitin.r.gote@intel.com,
 sanjay.kumar.yadav@intel.com, matthew.d.roper@intel.com,
 matthew.auld@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 0/1] drm/xe/pat: Add helper to query compression enable status
Date: Mon, 10 Nov 2025 22:14:57 +0000
Message-ID: <20251110221458.1864507-1-x.wang@intel.com>
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

There are currently three in-flight patch series that each implement
a similar compression query helper:

  https://patchwork.freedesktop.org/series/156658/
  https://patchwork.freedesktop.org/series/157036/
  https://patchwork.freedesktop.org/series/154714/

To avoid duplication and facilitate integration, let's extract this
helper into a separate patch that can be merged first, allowing the
other series to rebase on top of it.

Xin Wang (1):
  drm/xe/pat: Add helper to query compression enable status

 drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
 drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
 2 files changed, 16 insertions(+)

-- 
2.43.0

