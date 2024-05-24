Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA7C25B79
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5610E169;
	Fri, 24 May 2024 21:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBt49uG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B57E10E1E5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716585305; x=1748121305;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TtO7c4D9n0liBk+iIV/Abty3V0A8NDLTR29ljEoodOA=;
 b=GBt49uG+0I3yNXev6NHkEzarAMM6qWWuLgwOkfy4oyyQLPA42HpiR7oM
 +co9dzZsY7R8pBuueu1ZxxHfpyDn9hMlKx9Bof0FdFbFpVGQY2LjxuD89
 4r0Dc87ZeV8aXPccII6vvwn2bGp+ynlAftnxNpXxCgDeSqnVeo/3Y+SdW
 0CTH6oHJOFNhxcy4jP9XtuPTuDvpk2QWyHmB/wfSf7hSBFxvenUBUwW5i
 JY1YstnHfBYWzlIBYyhq1XsHk/BdzwXUnvE1DtURixkiaDXmvGlL7YzT7
 +uWdMjuvnrgnwQrCpMcyShs5KkphaeS2mWxbQfcjy4Vbqm2lC3AZS44dJ Q==;
X-CSE-ConnectionGUID: qO8qXoHfTqm8N20Rnf21rg==
X-CSE-MsgGUID: 7Wkqm6NXSlC+Zq693Z7TYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24106832"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="24106832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:15:01 -0700
X-CSE-ConnectionGUID: 7FxjgE/mTWuHWb5CUBkLbQ==
X-CSE-MsgGUID: FvzWB1tRS2u6xLbaeIWtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38932140"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:15:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Fix CI BAT regressions
Date: Fri, 24 May 2024 14:14:58 -0700
Message-Id: <20240524211500.1345917-1-umesh.nerlige.ramappa@intel.com>
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

Use after free issue is introduced by the below patch.

drm/xe: Add helper to accumulate exec queue runtime

Adding a fix for that in this series.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/xe: Use run_ticks instead of runtime for client stats
  drm/xe: Do not access xe file when updating exec queue run_ticks

 drivers/gpu/drm/xe/xe_device_types.h     |  4 ++--
 drivers/gpu/drm/xe/xe_drm_client.c       |  9 ++++++---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 15 ++++++---------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 +-
 7 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.34.1

