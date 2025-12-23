Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2B2E6F070
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 08:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4174E10E091;
	Tue, 23 Dec 2025 08:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8NJeve+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2B010E091
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766480047; x=1798016047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lLZvZF827sDFK7NCBocjjTMmY9qX5BtGwtMyjXMk5rE=;
 b=e8NJeve+6LLoYortY9OImcdPzs8cHGuTkKzm6AnsFfiboOrqQU0Uidv7
 o9LnYlE0HWy6icATN96yjIxdXQ3BJCAcOVhoMpO26RwHLXRDM8S/nzgF1
 JVVpQl2tP8XeKn5HIREt6ZZSM0MAG5rmVfwpcLqrcsnpzGuzLJNQIF7KU
 pls+kxmmsXRwaVeSYVhiHwdLYhsPa4pgOgsq+lwjRxVIyfphcIXdHfgwZ
 R9uAtBY3k8tIp+zlJpRm909JGNmzbW9kSQvu7VUMJ9qDpvqtj3b9LSNl6
 4GsewaeEbDsVc5HTroyNBJL4zZcvTE/4h6hv/xn1DNRrrWzoVct7H0Rnd g==;
X-CSE-ConnectionGUID: OvCZI2sASLuXPDWdqIZLbw==
X-CSE-MsgGUID: PyeI0KerSgKhKRvAzShYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68402347"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="68402347"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:54:07 -0800
X-CSE-ConnectionGUID: j+mCwu0ySBKSRNcal1hd9w==
X-CSE-MsgGUID: zd9XY3Z/ToGd3THvCrqing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="204681163"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa004.fm.intel.com with ESMTP; 23 Dec 2025 00:54:07 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v4 0/2] drm/xe: drm/xe: Separate out GuC RC code
Date: Tue, 23 Dec 2025 00:51:27 -0800
Message-Id: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This allows us to independently toggle GuC RC feature.

v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_gt.c     |   1 -
 drivers/gpu/drm/xe/xe_guc.c    |   6 ++
 drivers/gpu/drm/xe/xe_guc_pc.c | 108 +++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   3 +-
 drivers/gpu/drm/xe/xe_guc_rc.c | 165 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  18 ++++
 drivers/gpu/drm/xe/xe_oa.c     |   9 +-
 drivers/gpu/drm/xe/xe_uc.c     |  10 +-
 drivers/gpu/drm/xe/xe_uc.h     |   1 -
 10 files changed, 232 insertions(+), 90 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

