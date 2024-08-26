Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B5C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 16:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711610E257;
	Mon, 26 Aug 2024 16:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0SWsW1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C36410E255;
 Mon, 26 Aug 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691249; x=1756227249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LvArmQnZXiV/9offcQASnBb0M3kGsYTydM6w4NxLWOQ=;
 b=n0SWsW1guIhiuvlz+GRIbQHTndi3L46gb35KTxH3z7uBmDzuueKOeyO4
 YdQepKjBUsP7u9iaxx/z4eEfZE++0FZDcJEKJ2kdfvv7obTRnQ4MV8FQe
 ArwyZVtJxrp/XjAiFqWM/pW/Q5cjB3SWajHUkMtJ4vCJ/nPzpoZlvTUNu
 Iti2vnffP5yhjQLiA1jmK5BsS4WxkWwsmNaLV4VYAX+QA9FvPY6RZQHSA
 lXEGg9lfJXycjRgFT77NMEr5Cq7AezCgFId4igWLTHZjrba10Dkgb7X0X
 aSa9E0I/4GvcRESGc82rIMkSVYp6hmX9K3jIB5tHVwQpeljojaBMPeJW7 g==;
X-CSE-ConnectionGUID: 55p6Y58eSTmgGHbriuRecg==
X-CSE-MsgGUID: e755o+u6T6K+DcK2EN83eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923444"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26923444"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:08 -0700
X-CSE-ConnectionGUID: 2AKpoP1eRburEKP6d1qjhA==
X-CSE-MsgGUID: SefX8QP2QWKuK3rQLvIB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62563498"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 0/2] Split out dma fence array and invalidate media_gt TLBs in
 PT code
Date: Mon, 26 Aug 2024 09:54:54 -0700
Message-Id: <20240826165456.2491477-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Respin of [1] [2] based on CI and review feedback.

Matt

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm
  drm/xe: Invalidate media_gt TLBs in PT code

 drivers/dma-buf/dma-fence-array.c |  19 +++--
 drivers/gpu/drm/xe/xe_pt.c        | 117 ++++++++++++++++++++++++------
 include/linux/dma-fence-array.h   |   9 +--
 3 files changed, 109 insertions(+), 36 deletions(-)

-- 
2.34.1

