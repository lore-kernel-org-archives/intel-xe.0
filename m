Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE749C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 05:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4AE10E087;
	Thu,  8 Feb 2024 05:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWd0YCj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93E010E087
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 05:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707370531; x=1738906531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LwPIhLWODJ5CONCf9hKWS1FHokvC31mJTDQZFVhOlcg=;
 b=VWd0YCj8zaBgiggr5Futj5UPS06hd7w1Q+GGOGx+MQjpkj6l/K0O12uf
 2q6cEHEqAHqcYy6vMkpsrGzAJ0F+2uOEzjybJcFCBBmTj89L3E+4bpnNf
 aVGQsxhbzdf5DbYoeQL8EkleoOX+gL9JKSzBo+8h6xpUpxpFTMLqT5P2x
 7br0YOLQUokdTIfCEfR6qnr9X6mbovJIaZegcoh77hgo86Sl9syjceMKJ
 UUpLVyTLhMpIYZ2wL1D+earDxasB71Q18PIej8xlpqcZVZwjERriKXO8P
 MDPzhmquVS6ayGZDYahbrx8srrXmTaK+cunZUKCZ/X8Iuq1UQJIK/zs+9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12511546"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="12511546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1556335"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:35:27 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Wed,  7 Feb 2024 21:35:17 -0800
Message-ID: <20240208053518.3783805-1-ashutosh.dixit@intel.com>
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v8 and v9

 drivers/gpu/drm/xe/xe_oa.c    | 87 +++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_query.c |  8 ++--
 include/uapi/drm/xe_drm.h     | 73 ++++++++++++++++++++++-------
 3 files changed, 106 insertions(+), 62 deletions(-)

-- 
2.41.0

