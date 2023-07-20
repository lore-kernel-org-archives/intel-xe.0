Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9757EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F48C10E552;
	Thu, 20 Jul 2023 04:21:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057E10E029
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826881; x=1721362881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/ZLhaMOI3Iu1LJPuSEXsss4lpIavt5TzJrPazxHypQ=;
 b=GgW56FUtnqx/HT2Lt/nee6dtZNSp+2r8bNJCI2ZbOApyP4jL56xN+xbe
 buvoAKqjMegNZzI+bn3Z/kaUFmJOzKDbBlYJ6fEqM87D72PUF06FBbuKC
 RIkAUIpFrVIGFqNlj6ktbZc1nVEUUA+10cVshWG2JzK4EGzxxtK0lC81G
 EABL39G0pulHZms6UmsibS1C04Z7xeweT3iwNMAutjzu3irxMYJ2CoItq
 7OTK4e0bTww3V0OKM3ULM65VeDNtLG7f/irLRqcVdBnPP2IPmoxuY6n8g
 c1kEXherWcvZ/gYsq6ByoTsGClg+1FwWCBdpJi5P0y6cfLZDjyve7sY+7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366661709"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366661709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724245037"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724245037"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:21:08 -0700
Message-Id: <20230720042115.119494-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/7] More VM cleanups
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

Continuation of [1]. These are the last changes in [1] that will not
break the uAPI.

Matt

[1] https://patchwork.freedesktop.org/series/117156/

Matthew Brost (7):
  drm/xe: Remove xe_vma_op_unmap
  drm/xe: Avoid doing rebinds
  drm/xe: Reduce the number list links in xe_vma
  drm/xe: Replace list_del_init with list_del for
    userptr.invalidate_link cleanup
  drm/xe: Change tile masks from u64 to u8
  drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
  drm/xe: Only alloc userptr part of xe_vma for userptrs

 drivers/gpu/drm/xe/xe_bo.c       |   6 +-
 drivers/gpu/drm/xe/xe_exec.c     |   2 +-
 drivers/gpu/drm/xe/xe_pt.c       |   3 +-
 drivers/gpu/drm/xe/xe_vm.c       | 140 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h | 141 +++++++++++++++++--------------
 5 files changed, 178 insertions(+), 114 deletions(-)

-- 
2.34.1

