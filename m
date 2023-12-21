Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A07C4706C
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 22:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B832A10E732;
	Thu, 21 Dec 2023 22:28:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128BF10E718;
 Thu, 21 Dec 2023 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197695; x=1734733695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8K/h1/j4SNbUYxEYWeTpA8KkHoZAgBmuZ8QW30qjzF4=;
 b=KvPByV5lTreEXNsOWmk5W0S1icsdWPg2nNa1hd+YCr3taNcPd7kZLYm/
 ONz0BfAKwEH3klmxL0V2yVMAQpZUZmXAlkLKNejCNm8I9aQcFhWcwv6Ac
 s9IH51HNFFiL2N6odIFIhV8upI56OeHtEqP6eNMiQt7ukb1T05Gdd/UM6
 iPF+g1jysXuWqXXo3sFO0gCFEvaS6uAjKtKNoLOD7HD9PUTq6FXHPbNtM
 xOTElAdxFP5fr/Ty//5qJLvzdq1mieBY7pnB83RR3XmkLybkOkUKYRgpq
 nYaa0U8zgQWdHc1vIPT5Lz8eAjGK7SzZZ+LVXtnlvX27rOuf6Ct34jFqE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876531"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876531"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458222"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458222"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe: Fix cast on trace variable
Date: Thu, 21 Dec 2023 14:28:08 -0800
Message-Id: <20231221222809.4123220-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: daniel.vetter@ffwll.ch, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 airlied@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cast the pointer to unsigned long and let it be implicitly extended to
u64. This fixes the build on 32bits arch.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..e4e7262191ad 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -31,7 +31,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-- 
2.40.1

