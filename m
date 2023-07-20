Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF4EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A74F10E5C4;
	Thu, 20 Jul 2023 15:55:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3110E168
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868552; x=1721404552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCrz3m1nRgDpPjb4/qyuPoeu95dBb8g16Xc3SapnzGA=;
 b=K1xmuk/Z1MwaxVf2iW/ctnv6IMvf4J7lPACzk3AybaFzPg7hvWhT5a29
 kQewvLvVm5+hLFA6dnuwSEOg5DHVzdo5hn1s1fh1CRVJnA48wkqmhkjEw
 astYnXCZ2HTF1vG93yVikhd33Zv0SBEvZ1mtka7cL9VGjmCwUeGifdZC1
 dpRhbZSK5fDZHHGiVQlmig5D2RklD9IfaJ62PeDuuRE5cb7X+kMV8FqMj
 oUvGfV2eaBu5jJa9EpklLnRFeMu6CaWT1OL2hEXDvPJFFzV/NfN6+QV8T
 MzaCXI9J7mfdLk/qV1WjqP9opuesD+FTaZhdJjYWm8CaJDgLy72y2yCzp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347088634"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="347088634"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754105464"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754105464"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 08:55:39 -0700
Message-Id: <20230720155546.199766-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/7] More VM cleanups
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
 drivers/gpu/drm/xe/xe_vm.c       | 142 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h | 141 ++++++++++++++++--------------
 5 files changed, 179 insertions(+), 115 deletions(-)

-- 
2.34.1

