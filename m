Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86128C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494BE10E8B7;
	Thu, 10 Jul 2025 10:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azd/2Bvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC1910E8AC
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752144076; x=1783680076;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VjTMZWx5MxJfisW00p3wHioTZshwWQQurGyvrpfQ7ak=;
 b=azd/2Bvtys10iFXx0XJZ0u4seoXZwQnBLN5sMzjelJVAGpR0+AgnLByM
 3lyoc+1S7Xk/xMDzxaWY146PXrrZtdxLhl3o/LmcbX98BDiVko9yr/MjP
 ahA3gMHndVU9Q59Mr+e+ExxCsAI3pK4iAiUGMulqv6ctiHOpuElKcOjB+
 4N91hiiVyvM0ipE2YQk2xR9L3sY6QSifSV03HGlzOrbMVs4mOE+tehCRS
 +HI2wzEp+A6odjHC2vx3bahOV4LPmqiGoDv/DsasLdS9V9tZOoqBvYWwg
 ZyXBu0oxHwd37LT3vTyM/D8gv71kxxI714vLdk0c2DIK7REeGd14ipX8c Q==;
X-CSE-ConnectionGUID: Uh4W8TnrRbKAYPYVGPwuKA==
X-CSE-MsgGUID: lwDKNke3Tw+Bp3UjxAE/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54351976"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54351976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:16 -0700
X-CSE-ConnectionGUID: ESFmqzKZT1iLJ7j2iLNGyw==
X-CSE-MsgGUID: rHzCbi29Rb6y/lAtqMA4TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160055139"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:41:15 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH v2 0/2] Add SR-IOV support for BMG
Date: Thu, 10 Jul 2025 10:30:38 +0000
Message-Id: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

Add SR-IOV support for BMG platforms. Exclude VF from using WA
16023588340 and 22019338487 and add has_sriov flag for BMG.

V1 -> V2:
- updated commit message (Satyanarayana K V P)

Michal Wajdeczko (2):
  drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
  drm/xe/sriov: Mark BMG as SR-IOV capable

 drivers/gpu/drm/xe/xe_pci.c        | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1

