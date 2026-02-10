Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE0BEA810B
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C44410E577;
	Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIMMqpcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BB310E575
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770727961; x=1802263961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=utKwmS0HAWUHU85tB5x8t9xJ8tZ16/ATnBFQS4LfPNs=;
 b=AIMMqpcnxLQdMCgHFgiHzb7WYbmwc9tbsMKzxZ1127bEuQSUXTx6xkXq
 dloMW/GQrawzbgRon3AxO1B2FLWzTpUzJC15ZhNGoZ3DanuM8ohzwoLDe
 SREB/U6NGq/4fryPt0SnaNICqZ8XkLA0EbO8PJBUYJFF5L3hQJk5H5zw+
 vql1vYti4ret9hkhRNpjbvS1HAT4lAm6jgtO0YjXMwvfW7jnPNj8z4bQW
 5ZPC5NhmEEZ5Vo7XJ6Y/DXNYSA5MP8hkogCLKkLZFJLqX+OSRIttxjoae
 A+sOCLGtWhV1JouAqSEtdTo+UhmrojdbHC8ZGsf+EhNQJ1JD3pMcrzur9 A==;
X-CSE-ConnectionGUID: 82c3SMRSQ6qp91VwY1tDzA==
X-CSE-MsgGUID: El5rrvvNTjaaeJu7Oy51vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82492517"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82492517"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:38 -0800
X-CSE-ConnectionGUID: 8pLuvxATRvC5+X9IRkkXVQ==
X-CSE-MsgGUID: Iehr3wTAT8uWsNt+Uz25bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211989278"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:36 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/3] drm/xe/xe3p_lpg: L2 flush optimization
Date: Tue, 10 Feb 2026 18:21:21 +0530
Message-ID: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The optimization involves two key changes:

Hardware-assisted Transient Display Flush: 
The new hardware can automatically manage the flushing of "transient" 
display data from the L2 cache. This eliminates the need for manual 
(software-driven) transient display (TD) flushes by the driver, 
simplifying the code and likely improving efficiency.

Transient Application (App) Cacheline Management: 
The hardware gains the ability to flush transient application cache 
lines more efficiently. The patch handles the necessary integration 
to utilize this new functionality and manages manual flushing where 
it is still required, ensuring data coherency and optimizing 
performance. 

Tejas Upadhyay (3):
  drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines manually
  drm/xe/xe3p_lpg: Enable L2 flush optimization feature
  drm/xe/xe3p: Skip TD flush

 drivers/gpu/drm/xe/xe_bo.c       |  3 ++-
 drivers/gpu/drm/xe/xe_device.c   | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h   |  1 +
 drivers/gpu/drm/xe/xe_guc.c      |  3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h |  1 +
 drivers/gpu/drm/xe/xe_userptr.c  |  3 ++-
 6 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.52.0

