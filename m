Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82817E7718A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 00:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCA910ED20;
	Fri, 20 Dec 2024 00:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mClqUIht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939B910E0B6
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734654157; x=1766190157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6simx68kt7XMoFRc/B7y9ZCNDM8IfGcM431blczkgg=;
 b=mClqUIht19cicYIfL6edEXzmS0uI3QrafkoaW+tBTkG5xq8hpy/qwpZ4
 dbv1sKUUuug/8KADl4EFrHQ3FjeDtrtLUIhG1QIoJcFY0mjeM2gMhHy3u
 t6R0SjqR7pF1e+tZS1QfiNYKhouzE9l/2HmuvcRRqxwmSZmpkey/3HFMr
 +JMDi9nFEk78jsQgP8goyDifY+LcBhex5LiWWKcgGxHfjojGWXsZQOJtm
 NqZmNblyIf8ZQR+FN0XREgUteApXZ4zAuhBxo2yPUulYt2+MCEwHk4vGj
 obs1Ws9TFks+ZFgCeB8JFdbkfz4g+0CxvyQkwV4qATFTdkmte+WGYkHuS g==;
X-CSE-ConnectionGUID: rN3ImkCmTWKOgg0GNgMPvg==
X-CSE-MsgGUID: ukN1gb96TXys+I4BQ8/Z/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46617591"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="46617591"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:22:37 -0800
X-CSE-ConnectionGUID: UgCSjxzsS+yquV0C7RL1Xg==
X-CSE-MsgGUID: EP0DzdpMQG+28AV2By71OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98155443"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:22:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: jose.souza@intel.com
Subject: [PATCH v4 0/2] Fixes for MI_REPORT_PERF_COUNT
Date: Thu, 19 Dec 2024 16:22:32 -0800
Message-Id: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
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

OA programming sequence for query mode or MI_REPORT_PERF_COUNT requires
modifying some HW registers in the same hw context as the user exec
queue. User passes the exec_queue to the OA interface and OA
implementation submits an MI_LOAD_REGISTER_IMM to this queue to modify
the registers.

The OA implementation submits a batch mapped in GGTT to the user exec
queue and hence, some plumbing is added into relevant code to enable
that (as per suggestions from Matthew Brost).

v2: review rework
v3:
- review rework
- original patches squashed for porting to stable
- code cleanup

v4:
- review rework/fixes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  xe/oa: Fix query mode of operation for OAR/OAC
  xe/oa: Drop the unused logic to parse context image

 drivers/gpu/drm/xe/xe_oa.c              | 222 +++++-------------------
 drivers/gpu/drm/xe/xe_oa_types.h        |   3 -
 drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
 4 files changed, 52 insertions(+), 180 deletions(-)

-- 
2.34.1

