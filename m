Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E21C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE96310E605;
	Thu, 16 Nov 2023 14:43:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447CB10E603
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700145806; x=1731681806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rM/NUR6X5PPUVN2u5xh23ZPAkNE8Da3CcvtYps22bFg=;
 b=Ei8IwJiFgCxg+4yVloj/Dq7e/1Qw9/jgyzJk9bkG0uKJCnHoI32U7HIx
 HSIKSyAigAYvG6T0j+ZuSyMlicb+Z9sG0WqtzjGHVBapA/YJWEOwx/+wr
 SqATYwWNhIiA13CUqizTHkPvStRYgsujIz7IerL7HbavOkY3HmlsswEuN
 iQbb3lsREvv6406ztRBptc+ss/l4BUFqGip9nFr5tN1pNwXoiR0RD0SS0
 ip/ZwAWfqw0b6oXTXUr7WX9ArL1DWIw95zJhALnRicKcld74rPyIhaWGX
 jh0QqaSpzD5zYINE5ZtFncJ7VRPaeloO8mFZBwV7fnpbniQubsIs1bMvx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="389958463"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="389958463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="765310656"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="765310656"
Received: from nitishpa-mobl2.gar.corp.intel.com (HELO 7194aa40b138.intel.com)
 ([10.251.218.100])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:24 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 14:43:08 +0000
Message-Id: <20231116144316.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 0/8] uAPI Alignment - Cleanup and future proof
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The series "uAPI Alignment - take 2 v3" [1] has grown too much which makes
it difficult to review and to digest by UMDs. This new series is a third
break down, which cleans up the uAPI and prepares for future needs. It is
to be applied on top of [2].

[1] https://patchwork.freedesktop.org/series/126203/
[2] https://patchwork.freedesktop.org/series/126399/

Francois Dugast (3):
  drm/xe/uapi: Align on a common way to return arrays (memory regions)
  drm/xe/uapi: Align on a common way to return arrays (gt)
  drm/xe/uapi: Align on a common way to return arrays (engines)

José Roberto de Souza (1):
  drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Mauro Carvalho Chehab (1):
  drm/xe/uapi: Reject bo creation of unaligned size

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (2):
  drm/xe/uapi: Separate bo_create placement from flags
  drm/xe/uapi: Add Tile ID information to the GT info query

 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   8 +-
 drivers/gpu/drm/xe/xe_bo.c            |  39 ++++---
 drivers/gpu/drm/xe/xe_query.c         |  83 ++++++++------
 include/uapi/drm/xe_drm.h             | 158 ++++++++++++++++----------
 4 files changed, 177 insertions(+), 111 deletions(-)

-- 
2.34.1

