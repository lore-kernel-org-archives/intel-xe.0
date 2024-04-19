Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0506BC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 12:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226E10FEAB;
	Fri, 19 Apr 2024 12:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZNE76g/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9EA10FEAC
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530159; x=1745066159;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mLuLKWP2JhuJpp7moD6tjmNg/8GT1OW/nnvbILG13v8=;
 b=IZNE76g/Bc62Eo9MivqeDo/MLIzskF7myJaOhPMVl7SbmL57hPkc9oSB
 0Ahn934y+cdmX9QnEHOY2LkKsWQruS/0mxA5Ihl/GBmdZXI2UY9to9qWI
 9vlcaSQvhF18fWTHA/aTvxLhAagcGjc0E0O5pRE4edZJ9gytwX2WgBn2N
 AKA8cFpn8rQIV2B0LitFTWPczESB3cI0s3jibdeRN9vn690SidanlQwlc
 PJg8jZbwQ9bBHsN+Syx9g82eKd7Q7fdIFxT7uBIEe+fvpoDY2c8MRCVqO
 7I7JoXUFlax+bWnQiZSouv5NIXr1Zg+iyVAgl6+J4c8gePsEvtlWmo4lo w==;
X-CSE-ConnectionGUID: kJspR8vSSBekRuYfEv+nhQ==
X-CSE-MsgGUID: M1eYjXztQ4qqrLz9Q46xoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12918889"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12918889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:35:59 -0700
X-CSE-ConnectionGUID: q1HaiqLNQaKqr8mx4OgCpA==
X-CSE-MsgGUID: Eh2jwJjFSaO6etm3jsB2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23185859"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:35:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] PF: Clamp maximum execution quantum to 100s
Date: Fri, 19 Apr 2024 14:35:41 +0200
Message-Id: <20240419123543.270-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (2):
  drm/xe/guc: Update VF configuration KLVs definitions
  drm/xe/pf: Clamp maximum execution quantum to 100s

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 18 ++++++++++++------
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.43.0

