Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5653D277D0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 05:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601E310E17E;
	Sat, 10 Jan 2026 05:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnVqxAtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0210E07D
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 05:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768023216; x=1799559216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RYUMQxxRv4wiiqJHE5Tv7kVxgffWNqoQYQCtzxXfcsQ=;
 b=dnVqxAtXZ7nxN5u4Y5shqJ+GKCcPRyzVydqpW8Ed/wgumRKwXFHxM6ws
 MaPo60CURpXvsf7oUEHzW/oL/rDnYBbmj/oMc256bxIl2BxK2GoXMivm1
 yAcNkENCHo2V3Mz39gSe1fveqqy3XXPnLso9zSKKpDp1HkPmhaZ7zKjFg
 Qsds13frCKUCFXyofhNcbgbhKhYTEuBxY0iFYY4IxCUuTso38LlarhEt9
 uZ77qsYBGAandwZNmzSGpm0OWioIEFFtdOPeAGN93ixCshi2cWwPBCrlw
 YjPDc67+PdZIIxggqvx+5PJ5e09HUphgKxVWt9O07ZowYyA0K4WoZMZkH Q==;
X-CSE-ConnectionGUID: phgtrW1WQ6WUq2wqhyzmrQ==
X-CSE-MsgGUID: 5mqXpHDES/Kcd9q13wyqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69308307"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69308307"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 21:33:36 -0800
X-CSE-ConnectionGUID: Ej8lbUrLQaWZifChEtvpFQ==
X-CSE-MsgGUID: OXMIECBuS+qwnprUT15vQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203650848"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 21:33:36 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Date: Fri,  9 Jan 2026 21:36:49 -0800
Message-ID: <20260110053650.2241351-1-fei.yang@intel.com>
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

There was a BSpec update to incorporate larger vram size.

Fei Yang (1):
  drm/xe/cri: vram addr range is expanded to bit[17:8]

 drivers/gpu/drm/xe/xe_vram.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0

