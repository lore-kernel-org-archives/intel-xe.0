Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12058C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 00:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5579210E059;
	Wed,  6 Dec 2023 00:00:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21BD10E059
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 00:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701820836; x=1733356836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oD4UIyJTggvCMsjVgakywR4CxnfoCXchpiAIqVgK+KE=;
 b=NvWQpjcrNlrjxmYo8e69XM9mcAjto+3cXHiIGaVB22XgGlgyVxu+eEOh
 GfOK1Pa+P9XWBAwF9Y67KM918GQ1cSOZtJPgaNW1WhOuXqi1EpVKxTZZC
 XBT7fzQ/BazzqnzkigdpYnMmlzrSE4Sg9e5qNjCP7r6cZ9em04V4YjDcV
 Z5T42JzjT+b/WXd9E9osuJF9ShkcMKmaA1WaJ246Ecvo2N3wn99vY1zSJ
 YuVPFknZQAjcG3oIsUiRHMCGAdHrpfJRYX2XA19+4Mkt5TMXZ9sRpQKc3
 aToE/IVYU+yOzIZ3ltk59nY8sBD0fjLAAqy3HDVw4A+CwomKEeYlZ87AO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373438566"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="373438566"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018379911"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="1018379911"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:00:36 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 16:00:29 -0800
Message-ID: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Don't take a PM ref for vm-less permanent
 queues
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

VM-less permanent queues exists for the whole lifetime of the driver, so
they can't hold a wakeref. Given that these queues are never
disabled/deregistered and should never hang, we don't expect any G2H
messages outside of the submission flow and therefore we don't need the
extra ref at all as long as the driver makes sure to hold a wakeref when
submitting.

Daniele Ceraolo Spurio (1):
  fixup! drm/xe: standardize vm-less kernel submissions

 drivers/gpu/drm/xe/xe_exec_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

