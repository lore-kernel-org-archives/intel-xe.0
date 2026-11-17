Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F22606A8AB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g7eZaylq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51A310E522;
	Tue, 17 Nov 2026 07:21:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65C10E522
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794900088; x=1826436088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K4LBwKKa8gnZu/RwqcSiGP/ZAKGNwy7DpJvX5oaR/jI=;
 b=g7eZaylqJuTHcYOoRwcgLazwUtp0Te6F7TBdDLNIVrTHlm6UU/Uh0YUt
 VGy6QzPLJ6JLjE1ElvmOPrIjMtvgYrBH7iK8PTHVfdIx1jmL+3Z+RA/IR
 UsTY3BmJoAk5RrHODU0Gr89l4rbzARZNLgW6ufjIHzH8YY6cDtepHLizm
 6c91kp1tc/t5y2c/ulpLJ8ifRjDZSSSbTAjTRh4Ifkudmz9VzespOshsV
 hboNasGTxbV5v3LdzSR0bGH25FGEPVpdqN6Ot5bMRx8n3odyerXVSZ4XH
 F1IVylLDEnSDIF9OHdkCdm5eo5fi2gYNsTf4sja617dJPuXVYPI5TsdHs A==;
X-CSE-ConnectionGUID: 2oF4PrFAT8OWv531AhDzGw==
X-CSE-MsgGUID: hn8vyemQRkSARxE13dyUxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3688703"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3688703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:21:25 -0800
X-CSE-ConnectionGUID: qqLHGNggQSyRuMdqCLdYuQ==
X-CSE-MsgGUID: f1PPT0NBRZOAez0+5+yafg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10284167"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:21:21 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v7 0/3] Extend CPER records with RAS info queue data
Date: Tue, 17 Nov 2026 12:51:19 +0530
Message-ID: <20261117072118.4051706-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the RAS info queue support from
https://patchwork.freedesktop.org/series/169692/#rev5

Badal Nilawar (3):
  drm/xe/cper: Drop redundant counter argument
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 269 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.h                  |   3 -
 drivers/gpu/drm/xe/xe_cper_types.h            |  59 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 187 +++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 117 +++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 7 files changed, 623 insertions(+), 20 deletions(-)

-- 
2.56.0

