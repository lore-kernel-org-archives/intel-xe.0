Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B371E728CF
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 18:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A62A10E172;
	Fri, 29 Sep 2023 18:19:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83B10E172
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696011541; x=1727547541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QyaZtAm9zX+0auxkZVOVYxgD35rFk0Oaakc8LDdi7zw=;
 b=j95J3zdDxMUlhpD3C1WeJ3/s5NhEqNq9ueM+WArhWCJUAO+K5zQJ5bQ1
 cFmMwfLhEehvGZMO4fHfoNe0vqpHJsGm6Ozv66eil2EdbXJ1I3HYlq+Fw
 wKPK2c8p5drVsusIeE0SVoMZ+6wl0Hrk66ImOQlriELYcqs7pZKNlxJvn
 1nEsNQBBF3hs02KQM/4IwOxEf9d3PcyMuGw7Q7x8RHd2+R3acw4QPStoQ
 uysURLGuYT96Y51SYFpubCT/XbByiRhLTeEX4tOjEwBS6INyEaffnzVqG
 gwWp5R8PK3W0obnLeUA4bT+cBlPNwg/O4DcgzNgWz16iG3Wr6ajzYTriJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3919707"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="3919707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699717336"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="699717336"
Received: from dahluwa1-mobl1.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.74.66])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 10:31:36 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 10:31:04 -0700
Message-Id: <20230929173104.2014590-3-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: fix range printing for debug messages
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

We're already using the half-open interval notation "[A, B)", that "-
1" there makes it wrong. Also, getting rid of the "-1" makes it much
easier to grep for the logs when you're looking for an address that's
the end of a vma and the start of another.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4d4c6a4c305e..70a8bd3558c2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1265,7 +1265,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
+	       xe_vma_start(vma), xe_vma_end(vma), q);
 
 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
 	if (err)
@@ -1618,7 +1618,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
+	       xe_vma_start(vma), xe_vma_end(vma), q);
 
 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-- 
2.39.2

