Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A522C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 17:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE42112D3C;
	Tue, 30 Apr 2024 17:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djM2jdxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCDE112D3B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714496625; x=1746032625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9B52S+w4D7YEHgpOx0kw1VYI2mam54i8XhiAEs1Qqc=;
 b=djM2jdxVpgRN+nCJR1efTrKsYOFAZIGllHw8Vl0JDQmf5fo2Jw6Gkr4J
 U1HBF7bRaDPkN5UF5E4WIPlIWvR5cPiSqjlQBhWs297bB+D1ChwGI3Pbl
 axxmkNLIFBcsYPjQE03fZ3hOn1/mjCQJGKU9JDPG9hvvX3RIpV7wli3Cl
 6LbkhtVkeCcIrvKoQbsqH2vjiFLWBhywIV8CA7rwrVXFc+5JFo1gi+uih
 al4+xvyyaF8e0pfAXFCqYs0xro1ecuySDO9PPTq+eQCVPzDBwaqeMbl8c
 04nhdGiaEYk4YrjGR7LvQEBxtP+6mxPGE/Kf2pcx7/9dokTi8wJWw/OAf w==;
X-CSE-ConnectionGUID: T5wKfaCcTYGejYR+Gh8a2Q==
X-CSE-MsgGUID: YZ6XSGPcSWyCK7VQGxR5tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10048141"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10048141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 10:03:45 -0700
X-CSE-ConnectionGUID: m1ZJpFfJRxCLIfifPNXEuA==
X-CSE-MsgGUID: gqaFj97RQl6nSNDFqXsMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57409961"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 10:03:43 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v4 0/2] drm/xe/mocs: Add debugfs node to dump mocs
Date: Tue, 30 Apr 2024 22:34:25 +0530
Message-Id: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
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

This is useful to check mocs configuration. Tests/Tools can use
this debugfs entry to get mocs info.

v2: Address review comments. Change debugfs output style similar
to pat debugfs. (Lucas De Marchi)

v3: rebase.

v4: Address review comments. Use function pointer inside ops
struct. Update Test-with links. Remove usage of flags wherever
not required. Create separate patch for moving function. (Lucas De Marchi)

Test-with: https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-janga.rahul.kumar@intel.com
           https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-3-janga.rahul.kumar@intel.com/

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>


Janga Rahul Kumar (2):
  drm/xe: Relocate regs_are_mcr function
  drm/xe/mocs: Add debugfs node to dump mocs

 drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
 drivers/gpu/drm/xe/xe_mocs.c       | 278 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mocs.h       |   8 +
 3 files changed, 287 insertions(+), 10 deletions(-)

-- 
2.25.1

