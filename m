Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C269CA9EC3
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 05:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392E210E9DA;
	Sat, 10 Oct 2026 05:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NArBEo4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAB810E9CF
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 05:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791610851; x=1823146851;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+9ev8AUXRynCwTc9yH2YEyeZGjByJiCUEqkgEANWyz4=;
 b=NArBEo4y6Uj+i8TuxUljHP3u7U1K9xgDgApIvJNCUjXowyxwzSXsb6A/
 yoIirj1UOAgItuy2SHpdMaf+n8V38ne4Fu6wtyQs/yGz17cCeaZDTKyLw
 Zk0vfxx7J4SwzbUkBgw/rllZe6+lLXHJPva032tkH/zb57i2MDoFkEhrw
 Pa9TveBYJIHIF1iaf8WfdAOVmrZriDIQFrca0RiUnPXQArHLs+exw3pSv
 fFGdjMmoLMR0mEkZbzKAiZrprJVr+gp7wz7ueYE7EsUAsFPZ8fO+ZAmRZ
 yPf+LsXwml0b3QBeh0ThUDLj/yPqxw8DQIFrVYBZn0dnO7XMLCQ1hPfTr A==;
X-CSE-ConnectionGUID: yNc9Ac88RWqvZq3qyqNBMA==
X-CSE-MsgGUID: OT7ddV8pSGiNs0wHLkdIzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="412369"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="412369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 22:40:51 -0700
X-CSE-ConnectionGUID: gFmvgBcRRY+0mIRJxbv23w==
X-CSE-MsgGUID: 85k/sXDAREOCIeJVywAWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="794255"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 22:40:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: don't dereference a NULL resource in
 xe_evict_flags()
Date: Fri,  9 Oct 2026 22:40:31 -0700
Message-ID: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_evict_flags() picks an eviction placement by switching on
tbo->resource->mem_type, but an xe BO can reach eviction with no
ttm.resource -- e.g. an imported dma-buf BO whose resource was freed
during teardown while its attachment is still live. The exporter's
invalidate then drives xe_dma_buf_move_notify() -> xe_bo_evict() ->
xe_evict_flags() into dereferencing the NULL resource. Hit by the UAL
export-reject-imported-bo IGT.

Patch 1 returns an empty placement (num_placement = 0) for a NULL
resource -- nothing is placed, so there is nothing to evict -- matching
the existing non-xe scatter-gather handling.

Patch 2 adds a KUnit regression (xe_dma_buf) that guts an imported BO
and drives the real move_notify path; reverting patch 1 makes it OOPS.

Niranjana Vishwanathapura (2):
  drm/xe: skip eviction of a BO with no resource
  drm/xe/tests: add regression for eviction of a BO with no resource

 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 89 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c            |  6 ++
 2 files changed, 95 insertions(+)

-- 
2.43.0

