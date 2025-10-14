Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A9CCD185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 00:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33C10E511;
	Tue, 14 Oct 2025 00:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2ot5oZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54A810E104
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 00:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760402590; x=1791938590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vWXgh423/1NndkDUdgtHhw5qBo3DsHJLgI3s56TMeDg=;
 b=B2ot5oZIIG9Cu5Ns+pbRQvU1hYEKIgIgnGgXLcJ/Tl7n3vKMHdtNYxgp
 NV5MDijGtMjR9nIDkstylqjbvlWt0Md3jdVeMdvb0A3MRUTGeAdqLmhrv
 GHO5nD8l5kN/3vqMG93ZajkI+VvT3WX8RptlQ1URTMbADyl5EOyhjfIn+
 yjFRizr4Dt4rlKYYIX0yQTPyVypkr67iR9bT94PL+YDnLtNjUoO/PcZMG
 hBJKWl5tLUlgGvewfwPlzVWxZ+1E+LqMDdkKBdy3YOr+RfzT8sygVei5p
 FnB1XXQXgxL7DarDKEYq6yPN55cPAs4GPqfnq/cDB+FmzGsEnMroGglT6 w==;
X-CSE-ConnectionGUID: B3I+3MZgR3iGmqQye3ClGQ==
X-CSE-MsgGUID: 2KPnl7aTTkW85ik2p2xyhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80191835"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80191835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 17:43:10 -0700
X-CSE-ConnectionGUID: 5K2A7JpGQnGEfpw8y9fjvQ==
X-CSE-MsgGUID: QEIiMTRoS9mHM+BY2cEEMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185994719"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 17:43:08 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1 0/3] drm/xe/vf: Minor fixes to post-migration recovery
Date: Tue, 14 Oct 2025 02:44:15 +0200
Message-Id: <20251014004418.378928-1-tomasz.lis@intel.com>
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

The series contains 3 fixes:
* Ignore migration recovery request too early during VF driver probe
* Assert that BO never tries to map into GGTT at fixed offset on VFs
* Allow migration on ATS-M in addition to newer platforms

The fixes are not strictly related, but all go under VF migration category.

Tomasz Lis (3):
  drm/xe/vf: Skip fixups on VF migration before getting GGTT info
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c          |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c    |  4 ++--
 3 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.25.1

