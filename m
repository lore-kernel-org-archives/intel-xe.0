Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFCCD4F54
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF8410E80C;
	Mon, 18 May 2026 19:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fS3Vxeif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7FA10E80C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132362; x=1810668362;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KJaTJY/auPmrygUiWkTGJyL6H9M6ma+D+lou/7MVdWI=;
 b=fS3VxeifQo1ve9R2LloQNjo8B5z7rhO9DKEit+kqHPOFagL1kACQ98I/
 bjBcD1gbm8VSxR7fAxYHJO+pbSgd6VA4dqL2SYHhdV0tfY+PY4E7zDRfK
 XH/3rBqApLnmqKaEzApRcABW5mx3gu2KX10OjqkzGVnlOs4qkBT4k51Dn
 yXzgZPQApLTCIbbBzro7GlHGKyL62L4SgMSS9BNcYCIcTAY2u2/mZUd6E
 YILBD5wuhK83XaZf/9qMjt8ofvSfaJSyIi5IA75wvUtwSdxiMp7w1L0uE
 EMWCKuwJOEsKzHVxF/dxI7YK6Ifgey2eKck9+WJ7i/6lxoe56a3mNLq0M A==;
X-CSE-ConnectionGUID: jEXlk09oRN6RCV0wGhXXXQ==
X-CSE-MsgGUID: NyFr0fuXQfmEpyZb6Bc5aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304794"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:02 -0700
X-CSE-ConnectionGUID: l9yyt+7DRLm1Ng3TFyWnPA==
X-CSE-MsgGUID: T3HQnNEsT2yVXSy0jhbxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276032"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/xe/memirq: Update diagnostic message
Date: Mon, 18 May 2026 21:25:44 +0200
Message-ID: <20260518192547.600-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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

Instead printing static offset values, print number of allocated
pages and the actual GGTT addresses of the page zero source and
status and address of the common mask vector.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 92f1c1150d83..8dabd6744af9 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -226,9 +226,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq_assert(memirq, !memirq->status.is_iomem);
 	memirq_assert(memirq, !memirq->mask.is_iomem);
 
-	memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x status %#x\n",
-		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
-		     XE_MEMIRQ_STATUS_OFFSET(0));
+	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
+	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_SOURCE_OFFSET(0),
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_STATUS_OFFSET(0),
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_ENABLE_OFFSET);
 
 	return 0;
 
-- 
2.47.1

