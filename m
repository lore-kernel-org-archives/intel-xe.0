Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32737C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB1910E91F;
	Thu, 26 Jun 2025 20:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UN9RxJ47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF8F89023
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971393; x=1782507393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cURYdv8EgWgTUsNyt+tFo9jxvll1yyl/gNSAo/eWRVA=;
 b=UN9RxJ47/OsI8+8AxpUH1Wdqcmtu6bWBPZEB6WfoNYpoqA9fIDdCW2WF
 1rBv9ChmtM+62zrx+mUGl8P+rKjl9YI7mCTfBYpXDAv9CX8YTk4untrDg
 YeweFVH/askkC/ojJoWFpONd5oW6NGp1XUzTc/NqbSIyVAmO6BWqJBkmC
 Tdnv7Fy4DluhfQAznsgRyN8hVsVoZYUOKCDcL3moUOA6d7U2nvkOovS8f
 VyuykuuUt0SlR375IwMd0TF0PhTO9zX+czoilGSVQ6oi+mgqEGePSKV4u
 9BMOOaT9/NFxzmC3KY/RYV3g1CFDQ2+O9rPTNKn3OOu3JZw0LwhMFxtIX A==;
X-CSE-ConnectionGUID: gKGnwnBtRyWVCt7yJlw19Q==
X-CSE-MsgGUID: 8vHknttcQ1OG8Z4f3ph9Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53360371"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53360371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:33 -0700
X-CSE-ConnectionGUID: PPBeNKR9RbmhvNjZ2jd3kQ==
X-CSE-MsgGUID: GepVCojDSCmwqSbacpeFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157003203"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Harry Austen <hpausten@protonmail.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/2] drm/xe: xe with/without kunit
Date: Thu, 26 Jun 2025 13:56:17 -0700
Message-ID: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
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

Previous version: https://lore.kernel.org/intel-xe/20250516104210.17969-1-hpausten@protonmail.com/

I took that and kept only the kunit part as mentioned there.
First patch is needed for testing since CONFIG_DRM_XE=y +
CONFIG_DRM_I915=y is currently broken.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

Lucas De Marchi (1):
      FOR_CI: pcode-fix

 drivers/gpu/drm/xe/Kconfig    | 3 ++-
 drivers/gpu/drm/xe/xe_pcode.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

base-commit: 2c22bc086dd8036ca159c714122e274d6350b950
change-id: 20250626-xe-kunit-20c0199723b2

Lucas De Marchi

