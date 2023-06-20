Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586EEB64D8
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 19:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7FA10E380;
	Tue, 20 Jun 2023 19:35:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201310E37F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jun 2023 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687289703; x=1718825703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LMkfn7PfCohd/Fl8cihbQY1Nd6BdJkrg6mWxyHZEJic=;
 b=cHIyzsZ14bnw3SKewa2vtnxq4z5amBrikfoS8oFP7/nADXzI4FI3bsDc
 D0DMY6iZPivBJ7naFCRUvjHUNWaGaXGMyt9Zc1HmG4NlM7YmA7Y5ws3tr
 Tix7+UdeDinaDjlbwGRtWQvjLrGJmaiuQgWGB+vUBq8CJ2NtAlJQAUe43
 5U572u0wn4BuEtJbmQkY5Kyx9JHrcn/hx3/6AnZRgQjUIjVFvdvMNIRle
 rPLJTqVDBdsWP40nZlHEmTrgDxhe1JaFk69vb4yYSpOcVvsVQsqBrWmUh
 UyP+C28cr+w35I1bEqKXh77u+8bMUFyuVPzGKsRWaQzD+QepjIertZABA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339579526"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="339579526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858706266"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="858706266"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 12:35:01 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 20 Jun 2023 12:32:27 -0700
Message-Id: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Add mmio register rw tracing
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

This patchset adds xe_reg_rw mmio tracing event for the xe driver. This
tracing event should be helpful for developers especially to debug Display
code.

v2: Remove inline in the function signature(MattR) 

Radhakrishna Sripada (2):
  drm/xe: Move mmio read/write functions to xe_mmio.c
  drm/xe: Add reg read/write trace

 .../drm/xe/compat-i915-headers/intel_uncore.h |   8 +-
 drivers/gpu/drm/xe/xe_mmio.c                  | 180 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h                  | 129 ++-----------
 drivers/gpu/drm/xe/xe_trace.h                 |  26 +++
 4 files changed, 225 insertions(+), 118 deletions(-)

-- 
2.34.1

