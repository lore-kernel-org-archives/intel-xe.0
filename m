Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F16E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 00:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A28C10E807;
	Tue, 17 Dec 2024 00:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWcJZgXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86810E80A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 00:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734397103; x=1765933103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ET/FpI7HL5A2rGsofmIv6cZyaaVdzHcOGcH047jFKI=;
 b=CWcJZgXjQPTliDRIuMsVVpilSmPcGpS8sfVOCGO2WXqffvh+MDLMKtGe
 VZ2i4jPxOz89hxWytrX0QRa4jvo+YxpfFWEDYh8nqANseFkGDAIC5NrW5
 3lKHu00J4DSGJ/2CKYMmtxTCiS34QHwM7gWAHIcNmJPaXKq1zpQsGDBfo
 NxhMdTZ1KcijBuJwYeuNAFT5U3GqJMhVDz6VrhdCRFyFggtguQ+/BZvxd
 uskIMrq/UUBl3yPDTpp8teZZMsnW2yQaSDb4OFbjQRL9my9gJdvyivuxA
 rzXwC55x/pDqq+xyLrxdP4JtAq4/WwNv6HDhRU9Bwo+dJGpoIpUxQ+9S2 g==;
X-CSE-ConnectionGUID: eTMMEaEVTG+Ip4SLfjdl6g==
X-CSE-MsgGUID: kRTlcpP0QIisBAFCaPS/Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46202039"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46202039"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
X-CSE-ConnectionGUID: 5xPQHjtzSTGXM1r+Of+XTA==
X-CSE-MsgGUID: 5Oj2NrtMRtKc8/A1QNmmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97220167"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Date: Mon, 16 Dec 2024 16:58:16 -0800
Message-Id: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  xe: Allow a GGTT mapped batch to be submitted to user exec queue
  xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC

 drivers/gpu/drm/xe/xe_oa.c              | 71 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops.c        |  5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
 3 files changed, 57 insertions(+), 21 deletions(-)

-- 
2.34.1

