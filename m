Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261CC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7686910E07D;
	Wed,  4 Jun 2025 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKdj3zCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEED10E07D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749048761; x=1780584761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OICXmv4+9rGVl/4wvXG5kHe/xuhT7e/UurCGoKh/Wjg=;
 b=FKdj3zCJc0QdSBunwckR6i6cmF1JfV09sY8qGI7OtPJnsaiiMypneyHx
 OZkf5qVSI7wRgczfGmwhsmfj848u41n5hooxipTbWU01UkpmZhoZsAMAo
 r9ym0xU6Rqp8b5P5ZzezAj5KtUbZFyEbzbAwbZiqLwY1yOT6ttsFukluN
 j4cWFctSfDmSDDU5ew3OlFabspeiLUs0mTLCCgddr2w+k6qrqpiuTLnWh
 7+3ojfNHTOG9AhEgSIvNIH4D5TNQ9F4nGXOrFV5sKLtrMge76RAGzr2IB
 /XBnGv5YzdRwPwbbxhgHpq4z3DhMDMrYBtHiIDbszoQ3bDNNagz2Vvczi A==;
X-CSE-ConnectionGUID: r5qVKNxLT0Cc/+kCRomeJQ==
X-CSE-MsgGUID: ooPBp96JTpyQMMpN2RYTfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51228673"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51228673"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:52:39 -0700
X-CSE-ConnectionGUID: /DTObqZLQuKYXjcQ7NsM4Q==
X-CSE-MsgGUID: Ga3s6BdLRaStnPAM6RFfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150004753"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 07:52:38 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 0/3] drm/xe/bmg: Update PCI Id's and Workarounds
Date: Wed,  4 Jun 2025 20:22:33 +0530
Message-Id: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

Added new PCI ID's and workaround for xe2hpd/xe2hpg.

Shekhar Chauhan (3):
  drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
  drm/xe/xe2_hpg: Add set of workarounds
  drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID

 drivers/gpu/drm/xe/xe_pci.c        |  1 +
 drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
 include/drm/intel/pciids.h         |  7 ++--
 4 files changed, 46 insertions(+), 21 deletions(-)

-- 
2.34.1

