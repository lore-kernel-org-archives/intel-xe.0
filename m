Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56218E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 17:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5ED10E3BA;
	Fri, 20 Dec 2024 17:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2r9aiMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523B10E3BA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734715168; x=1766251168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+VrB1gBjAYxB/rv+Nx6r9jURIG9PShlDpMrk+Cs9Qo=;
 b=U2r9aiMzS+qr9U3s+oAuoIQyIfKCbvm6J3uGFMIc64UfwwYRPYqGfMZZ
 hA22Ld07U+knc5/glZeb8THVl1yrHRnUWc0Y3QOLRvyplKwSyfW2jW6Oh
 2ifRb/Dnic/Q+VMLZ62ul4vlOYyeyY7hfd4u0sLvAnb1CGxSvSotLMhlX
 NnSgtLS9+wiZ1ZkhE/cy6mZv1arA+eZYOe84cspXuq7Zz2UhPDB39kyFI
 i8Mt94dC30CCNZM5fnVL0iyDPt81iK3fCBjF8/E3aJLleoBahwG9zPWL8
 Zj2ApCw0UWsMeQzey5L6NBO1iwD2cd+vsGj9+0c/MtarcdWWysCURZtWa g==;
X-CSE-ConnectionGUID: ZttROKCWTwmvxft3eRuVMQ==
X-CSE-MsgGUID: qkJAGvE/Tb6nmqZJvOpUWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45960088"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45960088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:19:28 -0800
X-CSE-ConnectionGUID: E07MpI6lQ2uDznazuH2F1Q==
X-CSE-MsgGUID: T/ftOLy1T4WcvmU/g45Hug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135917062"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:19:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: jose.souza@intel.com
Subject: [PATCH v5 0/2] Fixes for MI_REPORT_PERF_COUNT
Date: Fri, 20 Dec 2024 09:19:17 -0800
Message-Id: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
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

v5:
- minor review rework/fixes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  xe/oa: Fix query mode of operation for OAR/OAC
  xe/oa: Drop the unused logic to parse context image

 drivers/gpu/drm/xe/xe_oa.c              | 224 +++++-------------------
 drivers/gpu/drm/xe/xe_oa_types.h        |   3 -
 drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
 4 files changed, 51 insertions(+), 183 deletions(-)

-- 
2.34.1

