Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D81D5C0FB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 16:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBC910E9EB;
	Fri,  8 Nov 2024 16:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWj+rziI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07C610E9EB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731082413; x=1762618413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=smmjNkt1w4XBLBNPm6vRf49Af8bP/jT27p1Fg9G0Qu8=;
 b=bWj+rziIXk7ffNaBY81XKA2XhSRd0hAk3eLXjyYL5nYodgp6pR2iKyrb
 OfL+zKY9zTD5YsnlZ32YHUO3walgQ54AtScw3Q7VFBJVoE8pG7wVtToEx
 OZ5dwzHY3M60x8aBrJye5N09aZfYnIkytoVsBK1pr1WFH294ZqKV/zpfD
 ykgfXTFnHkWIlzRWXf6YLHtBsqYyTXplohtbQNhsdl3yCWZTtICwIdjcT
 h+jW+HISGNijj4w1BSdLJNORbZAgOvq0UXc5Zs34O9aGEh4yIZkdtH6RV
 wVhYklPk96XfyvP0AlOi6nXy4yr9r3c2nwwst8BHWMcPeGv8aWi1aJM+Q A==;
X-CSE-ConnectionGUID: z6SiDRz/S1CfqVnjeeIVCQ==
X-CSE-MsgGUID: L8oxuYaeS3aJx4Xf2bTgnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31077273"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31077273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:13:32 -0800
X-CSE-ConnectionGUID: mvxUH3BDQ0We6NSo01plMQ==
X-CSE-MsgGUID: AusuWLz7RHm/FH5uSLwOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85612804"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:13:31 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 0/1] Allow fault injection in vm create and vm bind IOCTLs
Date: Fri,  8 Nov 2024 17:11:55 +0100
Message-ID: <20241108161307.1203967-1-francois.dugast@intel.com>
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

Sending as RFC to get feedback on the approach before extending to more
functions and more IOCTLs. The IGT series for it is:
https://patchwork.freedesktop.org/series/139777/#rev2

Francois Dugast (1):
  drm/xe: Allow fault injection in vm create and vm bind IOCTLs

 drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
 drivers/gpu/drm/xe/xe_pt.c         | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
 3 files changed, 6 insertions(+)

-- 
2.43.0

