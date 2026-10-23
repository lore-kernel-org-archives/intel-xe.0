Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A7606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 17:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFV4DzUY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3469C10E0DF;
	Fri, 23 Oct 2026 17:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D32410E0DF
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792778133; x=1824314133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JDnfMBGF13dPpyjCWPR9GngpVqNKye0PHJ4jyFxDSWY=;
 b=AFV4DzUYuMJz279zTcq17g4gxjDr44mt0P32R5klQJ/Sk0PZbEo6Razb
 C5JQ1+YkBBt81SJQ/sVf3hjD37z6OjAuwpAnWgAkVMOeDSOD29Yn5uNAA
 h4sY/xmnFUjINAaSfidYyyr3NLrBQv7mQZtyvHtOMLutX5XI9jY/8845t
 WuTRacoWVpJYs+lky2oN4Wu8/JlWOf/h2gplItA2JCNFT/lbQ7YM8Qs/g
 VsYqEmWEmjk3DCVXE3JqidOf6AHF+YElpUxp36rgr6sHwnwRD6p/HWV6E
 STs/QlbZqpb3DEHje4Na3BbE+kr4n3ffJtFJGJpgXB6VRarRpCm4OvRbe A==;
X-CSE-ConnectionGUID: 9yuEDrHURKWIlAh7tQDk2g==
X-CSE-MsgGUID: ip/O8tUZSNe4vuFnG1XG1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1442979"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1442979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:55:32 -0700
X-CSE-ConnectionGUID: nU/5NDZxTNeNeb6CqpPGtw==
X-CSE-MsgGUID: ObJ/XtWmS0W2TxGN4mmBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3807903"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2026 10:55:31 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Some d3cold related fixes
Date: Fri, 23 Oct 2026 04:18:33 -0700
Message-ID: <20261023111832.218750-5-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Toggle d3cold allow flag and wait for pcode init before accessing
MMIO.

v3: Add fixes to the GT MMIO patch (Anshuman)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Toggle the D3Cold enable flag at runtime resume
  drm/xe: Access GT MMIO after pcode init
  drm/xe: Memset g2g buffer on resume

 drivers/gpu/drm/xe/xe_gt.c     | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c    |  3 +++
 drivers/gpu/drm/xe/xe_pm.c     | 12 ++++++------
 drivers/gpu/drm/xe/xe_uc.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 8 files changed, 56 insertions(+), 7 deletions(-)

-- 
2.53.0

