Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5951C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12EE10E9B8;
	Mon, 25 Mar 2024 16:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fozFoJM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09D10E9B1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711384913; x=1742920913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JEt9DjjYJE0OPciG9o5UiB9CVSDeGKVx1+bzbBs3NGI=;
 b=fozFoJM2LRafKNsgKCYjt6SU7FuasNFwGd3n1EGn5IJ+MbZKS4N+fBGN
 fj01SCjx3tAiSBgUSpFObJ0i5fFV/5NmfB5nG7t2ZW17GmfL7GaRoGbp+
 P/0LjCFq2h13KCTJJ/DymTUi0pcJn6wH/PNuMtMpmbWzPIHCrG3iL5lIt
 C9wC+TPo1Lvp5Tg0rjYXMu7q1MJaXluVfGIxcfWGGYTQDtxmMtELsHehX
 qneIdT13tRi1xZH5RtdAizMOPP/QBvuM+WFYJskjS1huGmdojGIIAoOko
 vTnzlwvTJgZRSHsHGTUkd1VSARELwKJscOJ5X+b+/MnabM7yHMbAO2THI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6511142"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6511142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53146069"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:41:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 akshata.jahagirdar@intel.com
Subject: [PATCH v1 0/1] Send flat_ccs in config
Date: Mon, 25 Mar 2024 21:40:04 -0700
Message-Id: <cover.1711427514.git.akshata.jahagirdar@intel.com>
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

In igt tests such as xe_ccs, we need to check if the platform supports
compression before running the test.
Pass the flat_ccs value along with other values in config so that we can
read it in igt testcases and proceed accordingly.

Akshata Jahagirdar (1):
  drm/xe/xe2: Send flat_ccs value in config

 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 4 insertions(+)

-- 
2.34.1

