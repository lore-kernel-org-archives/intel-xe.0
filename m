Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10571EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 21:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29B910E39D;
	Wed, 28 Jun 2023 21:41:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BD010E0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687988498; x=1719524498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPC6UhbHeto50gxBYeTLR+JAmqcIceLMpPwrLNuHz5Q=;
 b=HJbg3BdfTDtS7WRLiIGu3oqzsKTU/lR63OLPqyxxZyVCQ1K3p5B0J2Uj
 rAUDa64O/soxz3IsgpRS39lnOYRQ5WP8V5MKFWTMPmUA2V38M+1HO3kPz
 So3M/LAlt55S8VWM+cSjmBqtdUvQdfDjEeZf0Q6tNfBrJf5SIpAKbMweL
 qBma/7dDEsqMBNlOfO7F5MiutImA4sQUCVDNOFr16/PYIfJMLZ67yugKb
 UAdhdumdoW7jFxegcGMS6bphcybN8Bjci6abGbDpqRYdofocXkTZcljtS
 NRWXb8RNVvJBGcvc64rEFJ5wV6bh5rcWyNrCGrrdzzmOFuXihE4UipkJV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351760086"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351760086"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711183690"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="711183690"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 14:41:21 -0700
Message-Id: <20230628214127.870717-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628214127.870717-1-matthew.brost@intel.com>
References: <20230628214127.870717-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/9] maple_tree: Export mas_preallocate
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

The DRM GPUVA implementation needs this function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/maple_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1281a40d5735..4a6ecdb12a92 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5815,6 +5815,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
 	mas_reset(mas);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mas_preallocate);
 
 /*
  * mas_destroy() - destroy a maple state.
-- 
2.34.1

