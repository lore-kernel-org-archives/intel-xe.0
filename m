Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8267BD6409A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B49B10E2A2;
	Fri,  8 Nov 2024 23:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrKTg0jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C6010E2A2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731107167; x=1762643167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LAykoT1s9OrczyW+XFZdnpTzJ2cWLGWMbYRmLHbX0TQ=;
 b=TrKTg0jWVwdoPRJsKuvZCPsCvhiE0AgQUxhL08GMbV/vgQultOrImWr7
 uE8OOyxjo9xBia+qp3Y0vMrsySWZWqu7e97RIgClI4tLNUZnii6mHVPgL
 L1Eu3ljajznfL0VOZshBv7Oqri/mZI9gJz92FmjjI1S94dbg+RX5gNuZ+
 frZ3P2KiZHRUvkKs7ImJ3iwj1yB4DAn3nYO/f8I+dXyukbs2EVw3hLWGO
 xXxPLNt+E7kNZp3y0sYVCTOEBgmx9jZmuypSu42dOcOr9XfG9FkKsTr33
 qzUMjTXL+FEfjcAQtWtTqkH06bZvsr2j8P5dQp/MEzfFx6V2G/FLXG4vk w==;
X-CSE-ConnectionGUID: YwDCOHndSuWhqr5G16Dvrg==
X-CSE-MsgGUID: /yHkT1Q6Qc+j+9p8FRv9PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42407021"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42407021"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
X-CSE-ConnectionGUID: oq8kbxvoRt+06ekcambR6w==
X-CSE-MsgGUID: lvgVc1sGSHuDK925NjMTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="86561699"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/2] Disallow OA from being enabled on active exec_queue's
Date: Fri,  8 Nov 2024 15:05:59 -0800
Message-ID: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (2):
  drm/xe/oa: Disallow OA from being enabled on active exec_queue's
  drm/xe/oa: Allow subsequent OA streams to be opened on an exec_queue

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
 drivers/gpu/drm/xe/xe_oa.c               | 15 +++++++++++++++
 4 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.41.0

