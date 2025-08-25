Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E781CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 16:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3F510E511;
	Mon, 25 Aug 2025 16:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJnx+en8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3910E511
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756141118; x=1787677118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wMiiSXbICoMPFQRPWBEdVfAHep5P+q4fABTNB/J7pGo=;
 b=LJnx+en8CMQwmhqF+6rp5hQQudX8PcS2J4YGmc7uHQdOQY8F7sk3vPxY
 3uVJ6iwhcGj6b+sukG5e2BWBpXNlscbI5FafxBSpLxHwyCXHE1K0HYrgw
 wuRL1SG4o37PHhywdX1bPAdP4ktfkQsXRlRx/eVPM/Nby0KZkeiKDKbYN
 XjOww6M2nCndpiWRcbBoy5bmRJhcOZYtZLT7jjZKep4/qDMj1sbsGg1LW
 +KoXhRFnhuK0llehlQQ6S2EAJzR5228dCaPsNCYA1UIxBOlC9ZyEn8Yr8
 MGvJAaZldmpRG5LZiWxia+o1cp2lkBxyZNU2mEK2GOBbJerdiEkFL3ZQr A==;
X-CSE-ConnectionGUID: JJ5MXAu1RLqEkoPGpemIRw==
X-CSE-MsgGUID: LL1xxOvRQ6yb/d8GbuBNig==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58223542"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58223542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:58:38 -0700
X-CSE-ConnectionGUID: Aupi1Mn+Thi1a7vzIW+utw==
X-CSE-MsgGUID: FfvF2chKQX6DSaQoTnScEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="200296930"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa002.jf.intel.com with ESMTP; 25 Aug 2025 09:58:36 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 0/2] Ensure GT is in C0 during resumes 
Date: Mon, 25 Aug 2025 09:57:57 -0700
Message-ID: <20250825165759.1263546-1-x.wang@intel.com>
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

put more details to the comments. (Rodrigo Vivi)
streamline the code in xe_gt_idle_disable_c6() (Shuicheng Lin)

Xin Wang (2):
  drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
  drm/xe: Ensure GT is in C0 during resumes

 drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 drivers/gpu/drm/xe/xe_pm.c      |  8 +++++++-
 4 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0

