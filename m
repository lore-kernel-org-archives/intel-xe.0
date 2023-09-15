Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A65CD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76010E6A0;
	Fri, 15 Sep 2023 22:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335D10E6A0
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694817309; x=1726353309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fqgff887rEoRt14yZXZNXeV73UFNV8FK1WzqA2H5ZyI=;
 b=i4F/ZmXCbhtqORPdTkJOHjE4MqJWj9GLlXpVkkJoFWQ9B5kbXB1VxN+m
 10GSafSAW4jWaKcA3Eg4KonZxxwFVTyPKvHlJvGjjNnX0BaXB5IVi4Y0O
 2tU8Dx9pJnpaiveAKV8ggPFItt7oR1Y1dq+fGe5Pg6UPjhcqfNTfD36Ce
 u3yTdRwghu6EfpXOV3Qhft9xt5OIJZoMJERHRDpnRsd6+cY3tfLMWLB8B
 fJrhEjbaDGiEl0Xbjr22TMAJ4uKWxxrYTHXMZ/9kMhSxYQ2b4rdIwR6PZ
 LIZYHgoiOboKyPxgvQncJ7qLO/QvWqJTtV2AR1JBOxbvqq1EFzFWiK9Ei Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359603192"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="359603192"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745156186"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="745156186"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 15:34:54 -0700
Message-ID: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: Clear-media HuC support for MTL
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

MTL supports HuC on the media GT with a 2-step authentication flow:

1 - authentication via the GuC for clear-media
2 - authentication via the GSC for protected content

This series introduces support for the first step. The actual flow to
authenticate via the GuC is the same as in older platforms, but the
HuC binary now has a new manifest which we need to parse. From the
manifest we can extract the offset within the binary that we need to
provide to the GuC for loading.

The second step of the authentication will come as part of GSC support.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/huc: Extract version and binary offset from new HuC headers
  drm/xe/huc: HuC is not supported on GTs that don't have video engines
  drm/xe/huc: Don't re-auth HuC if it's already authenticated
  drm/xe/huc: Define HuC for MTL

 drivers/gpu/drm/xe/abi/gsc_binary_headers.h |  74 +++++++++
 drivers/gpu/drm/xe/xe_huc.c                 | 148 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_huc.h                 |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c               | 161 +++++++++++++-------
 drivers/gpu/drm/xe/xe_uc_fw.h               |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   5 +
 6 files changed, 331 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_binary_headers.h

-- 
2.41.0

