Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1D8EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C960610E23A;
	Mon, 17 Jul 2023 13:16:59 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DA510E23A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689599817; x=1721135817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzawXjBCAqQevkwI0t1daQaq16fbB25auQ+6yUmhlzQ=;
 b=PZM0PiqBdcZ8QtEAHlU9IJQHSlfVjq9nMdfA3l5NdRFACHhSPECqYFP4
 byByO12XHOlqXP6uGd6KJxSnV6dJntr/MGffmX/F/LezoeftnmAydl+wL
 6fVDNy5Z0xZ16YOEeaCnD+nHuUPQYw6mZj9GRk58Xa1LWf5ynlVsMgIXu
 CsC/6qDqnzQahG31D4RK3Q0TYoDIFRhZySMLtxkWeLnX4l4WIEujuNbOZ
 c7BV1XqKg+zLyWHwU3OPiGTWFYKjIna+rN55xNGU92k61CWNuncyaa+kX
 tvqUxtYnJhctA+a6Kkz+OS3t0xeFyva5kDZ/wM5UQiQPhZpafXlndOEN1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429687105"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="429687105"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1053905608"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="1053905608"
Received: from lcoutoda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.45.169])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:16:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 13:16:41 +0000
Message-Id: <20230717131643.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/xe: switch to using drm_exec
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
Cc: Francois Dugast <francois.dugast@intel.com>, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make Xe use drm_exec (execution context for GEM buffers v7) which was just merged to drm-misc-next.

Christian König (1):
  drm: execution context for GEM buffers v7

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 Documentation/gpu/drm-mm.rst         |  12 +
 drivers/gpu/drm/Kconfig              |   6 +
 drivers/gpu/drm/Makefile             |   2 +
 drivers/gpu/drm/drm_exec.c           | 333 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  30 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  30 +--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +----
 drivers/gpu/drm/xe/xe_vm.c           | 247 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h           |  32 +--
 include/drm/drm_exec.h               | 123 ++++++++++
 12 files changed, 646 insertions(+), 226 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

-- 
2.34.1

