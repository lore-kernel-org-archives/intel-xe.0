Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F731C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77710E302;
	Tue, 25 Jun 2024 20:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2tosqml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D2410E2ED
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719345970; x=1750881970;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBm0hyNFpfW5SNS8t876AbW/C7+Q/MbUQAeHCcDryBU=;
 b=P2tosqml6S/iEXFKAAYeVFKq5rPGRkwYekZHz/nOnHffkPVt94XQQxS9
 whvPEB6zH0hCT2hZ5GgP4mRCmRcgkqSWaXjhaGYHcJ52Gt12j/52eBtFZ
 U0/uyIijUqFbcJK+SACzIw7AkN+DpxueGY3su/YBzp+cF4EHMyORZ6T8u
 8M8OtFa8GoyYwJQ8Rv9IQLIhhtXaI8Esy9Pnh9raIGf8jLNxXBt3y9ugj
 yDx1GKD+JU3gsmMb1ZLpZnsxcdkTM4F2ljdviaR3OK+HVB6lHpfNassoJ
 OMqgfXiFh6rYv8dDmyJui6MjmGNStfODzAw5Xbsyzd7siU4USNsg5ofzv A==;
X-CSE-ConnectionGUID: U+ppvCoyS86lrIvo8257Dg==
X-CSE-MsgGUID: UMyma/aOSmKQIJVK1fUb8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20165018"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20165018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
X-CSE-ConnectionGUID: MmyQlN6lTC6jhiQJ8WjUYQ==
X-CSE-MsgGUID: IjqFj7HaQwq+n1R4snsa8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48935540"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/xe/oa: Add NO_PREEMPT property
Date: Tue, 25 Jun 2024 13:05:55 -0700
Message-ID: <20240625200558.763682-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

v2: Introduce no_preempt exec queue op

Ashutosh Dixit (3):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe: Introduce no_preempt exec queue op
  drm/xe/oa: Allow preemption to be disabled on the stream exec queue

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 36 +++++++++++++
 drivers/gpu/drm/xe/xe_oa.c               | 67 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h         |  3 ++
 include/uapi/drm/xe_drm.h                |  6 +++
 6 files changed, 106 insertions(+), 15 deletions(-)

-- 
2.41.0

