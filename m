Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC55C761A6
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB5210ED73;
	Fri,  7 Apr 2023 03:27:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EDA10E36C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680838077; x=1712374077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CkrZo2YLw1QrNaRnkrtCMl9k88UTgcErvx3TJx+uvLo=;
 b=VXXyVX31GumytcQwfvWN/4jljtt8Zm1fQjp7nxqinDt9qodW3aJlF5sO
 bCjc9wHUB/CdHGZNm2Ao8bxm8/u4mdIfAyXJuyO21g4iIZDC7VysT2HKB
 F/wMtLgsRZTW72iVhTibaH/VKcThqgvpGtBGyTlAysg1dwnq507ZsiMN5
 2LKODmpzpQOEftaZlsGmYXq0gDtzGt1LzsM+Np1gAk0GykHGDYt3Fnw8P
 AZT9xlGgfu/S4d3d7T4Im1bpO/oicxMNpOQSRmP3YgNBkWiXgI2Wmd/5h
 bkGoF5qopGjWV4Xk5GVs52ynxetBqCpGcCirQvj3Xkwl+mkqciqrR/xYN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323289236"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="323289236"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664752540"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="664752540"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:27:55 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 20:27:49 -0700
Message-Id: <20230407032751.31632-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Coalescing GGTT invalidations is causing a bunch of hangs during
driver load and in user space.
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Benefit is rather small too, so revert it to stabilize the stack.

Reverts below changes
drm/xe: Pad GGTT mapping with an extra page pointing to scratch
drm/xe: Coalesce GGTT invalidations

v2: Rebase and update commit message of patches

Tested-by: Matt Roper <matthew.d.roper@intel.com>  # ADL-P
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
    scratch"
  Revert "drm/xe: Coalesce GGTT invalidations"

 drivers/gpu/drm/xe/xe_bo.c         |  1 -
 drivers/gpu/drm/xe/xe_bo.h         |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
 drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
 5 files changed, 10 insertions(+), 33 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

