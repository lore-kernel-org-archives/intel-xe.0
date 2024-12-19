Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0368BE7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 00:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C379710E277;
	Thu, 19 Dec 2024 00:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebVsnb7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACE210E277
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 00:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734567827; x=1766103827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CUUAAXyP6BOdPD9v7xoc2tjppuJXq5VlZnHWp2X0xrg=;
 b=ebVsnb7cEFTSc6cTwPqHb7WjfQVS5MnG2MRaDUaUea5oqCfN1/uVLRR4
 e3Nz0Yvk6480PjhveEFzXdUdcRa0seee/H014CDTAPr2QsaAt84E6KHda
 JKBSq9ELLPcR98wkD7dOah5dgRH/IV499x/7ycgliJRUGljKfvGJvcHRQ
 AY/XzrC/hHI1nxvgTIDYE4I0X868cZS6c2B1obYnJA2JhNQSkWcC8fP5e
 4OWcOs8SzjoZi466RqZgCac/qxde2IDjiUMb8hvQYsYj8q0D084wbeIO1
 O7aMz4UMbR8+CPzLjRscBnrJqHzAcjMIP855gcFpR/XiNPA7z7pHyfDwf Q==;
X-CSE-ConnectionGUID: c0f7zUFYRnmlBjQJ5FbSpw==
X-CSE-MsgGUID: E0U3zM5ATZyR0EnrXD5P+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46482635"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="46482635"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:23:47 -0800
X-CSE-ConnectionGUID: rPChH2LFTQeKRyxXdbB7+A==
X-CSE-MsgGUID: mYfYhnLIQTSF5g1J+CreFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97845784"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:23:47 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: jose.souza@intel.com
Subject: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Date: Wed, 18 Dec 2024 16:23:38 -0800
Message-Id: <20241219002340.13230-1-umesh.nerlige.ramappa@intel.com>
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

opens:
- Should the cleanup patch be squashed as well and sent to stable? I have kept
  it separate hoping the build does not complain about dead code!!
- Applying these patches to stable is not clean since there is a dependency on
  another patch - "drm/xe: Force write completion of MI_STORE_DATA_IMM". Not
  sure if dependent patches need to be sent to stable as well.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  xe/oa: Fix query mode of operation for OAR/OAC
  xe/oa: Drop the unused logic to parse context image

 drivers/gpu/drm/xe/xe_oa.c              | 223 +++++-------------------
 drivers/gpu/drm/xe/xe_oa_types.h        |   3 -
 drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
 4 files changed, 53 insertions(+), 180 deletions(-)

-- 
2.34.1

