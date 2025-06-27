Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B749CC83000
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 20:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760AE10EA6F;
	Fri, 27 Jun 2025 20:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mx+k4ckk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB5210EA2A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751056245; x=1782592245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P9/t5rsH8GtxSHDy24uKuTHhqud3wKZE+R2ARBh3OP0=;
 b=mx+k4ckk4Ivz7EBZFoEZtdfGT7JROptz9hP9cy13VJQF8Ga1sAAtZwSu
 bMQpBALh7JBZAFs3tQd37XopcEMG739xk3d/vxlo1zt78FimG0DvkXE1p
 we+3IXLtVJqOq0fDe5hwOoEXSStKL0rOGs+mmlWfM+0g1WHqixk94CDkb
 7wSpSz/xRYng/2ztfzMOXLEGiLk+6g/2SSxQJ9AQhLMoDHV17VRwZQdfX
 Rvd3gWrL1RRbUuIX8vGaPHe226GOjFgkzGmxqvb4SluIGvJA1q3pbCUrI
 c47bCdBaGKfotlpABqtT7tdXqiBe77rRjxUKPw0kKG4NLA/MBZJnrtT28 w==;
X-CSE-ConnectionGUID: JFbcdeu8QfauyYyrimm/aA==
X-CSE-MsgGUID: 6WuEnaPBSBCvRL37IS8J8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64068005"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="64068005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:30:45 -0700
X-CSE-ConnectionGUID: 2QS/IT7rQa+vDIV3nC9sdg==
X-CSE-MsgGUID: 8abQ2Hj/TZKBSIidjk2HpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="157175937"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 Harry Austen <hpausten@protonmail.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 0/2] drm/xe: xe with/without kunit
Date: Fri, 27 Jun 2025 13:30:33 -0700
Message-ID: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250626-xe-kunit-20c0199723b2
X-Mailer: b4 0.15-dev-a7f9c
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

For the second patch, original version is from
https://lore.kernel.org/intel-xe/20250516104210.17969-1-hpausten@protonmail.com/

I took that and kept only the kunit part as mentioned there.

First patch fixes the bug reported when building with

	CONFIG_DRM_XE=y
	CONFIG_DRM_I915=y

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- First patch should be good enough fix, so reword it accordingly
- Link to v1: https://lore.kernel.org/r/20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com
---
Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

Lucas De Marchi (1):
      drm/xe: Fix conflicting intel_pcode_* symbols

 drivers/gpu/drm/xe/Kconfig    | 3 ++-
 drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

base-commit: 98f015a92833e2d04fda89e1657a13d7290403e8
change-id: 20250626-xe-kunit-20c0199723b2

Lucas De Marchi

