Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8CAC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF96A10E214;
	Tue, 14 Nov 2023 13:34:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3999E10E206
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699968885; x=1731504885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zWf7m3vsiBqEy86kJT7iablBely+TDZrA7cbsfY4Rr4=;
 b=GC6H5/TmIpR6e1kWSYCXZEnf+urBNUnAT2WyrD2vRoV9gwElm6LtOAJy
 pPg1R6+FEj6ibBxLuqqWiu/aq83treLX51eJ8FZVLAIbGGRB6nZ9rcMiF
 /8mg0QqMblCtJhHW4gP1uqEOyveEl/KWU88tyE1kfMAt5rppHhq8HNSO0
 lSsufKi6qjQnNb/kSaocXxk19NphbibXLaiMM67NT9XQEHtL1jyISi57M
 IJPiYGixNa8/UJXQ23s80MOon2yhZjgydgV3V2vOJ7/oM+jdIUx8Oxfjh
 O25oNuYSro9TKVW9l4r7Rv1Nl+JuNEaD8WKatuXO0aETGG3b6y0uvSa9b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9293949"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9293949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764661268"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764661268"
Received: from kdijkstr-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.218.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:43 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:34:26 +0000
Message-Id: <20231114133434.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 0/8] uAPI Alignment - Renaming
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
it difficult to review and to digest by UMDs. This new series is a second
break down which focuses only on renaming in the uAPI, which does not break
binary compatibility. It is to be applied on top of [2].

[1] https://patchwork.freedesktop.org/series/126203/
[2] https://patchwork.freedesktop.org/series/126278/

Francois Dugast (3):
  drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
  drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
  drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance

Rodrigo Vivi (5):
  drm/xe/uapi: Rename *_mem_regions masks
  drm/xe/uapi: Rename query's mem_usage to mem_regions
  drm/xe/uapi: Standardize the FLAG naming and assignment
  drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
  drm/xe/uapi: Be more specific about the vm_bind prefetch region

 drivers/gpu/drm/xe/xe_bo.c              |  14 +-
 drivers/gpu/drm/xe/xe_exec_queue.c      |  22 +--
 drivers/gpu/drm/xe/xe_gt.c              |   2 +-
 drivers/gpu/drm/xe/xe_pmu.c             |  24 +--
 drivers/gpu/drm/xe/xe_query.c           |  57 +++----
 drivers/gpu/drm/xe/xe_sync.c            |  16 +-
 drivers/gpu/drm/xe/xe_vm.c              | 101 ++++++------
 drivers/gpu/drm/xe/xe_vm_doc.h          |  14 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  24 +--
 include/uapi/drm/xe_drm.h               | 205 ++++++++++++------------
 10 files changed, 245 insertions(+), 234 deletions(-)

-- 
2.34.1

