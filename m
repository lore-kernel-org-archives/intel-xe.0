Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FC6EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 18:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5432910E07D;
	Thu, 29 Jun 2023 18:30:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBB110E134
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688063423; x=1719599423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPC6UhbHeto50gxBYeTLR+JAmqcIceLMpPwrLNuHz5Q=;
 b=SDNhRA1ov8B4WfSZeYcH9Ms5o8Eq9dExvGzQ/WvKbQtmd9ff/bdzVEF6
 1n4FkxUGUJetrjl9p/c4af+pdHvEAYLSFKse47dDxfmKGrCGMi/FYruPz
 qfNUCC5ZtO824NHV6jhkd5j9nzD2AUncHvbIc4aHzm81PIc9hmFZPdCyW
 XU4HvjKD889A6AvYmD6ghR3xAaafRD+XSvBvcTc36FFe5qsm57uxQ0y7N
 fb2YJUl7OcwxOfoxqo8pZD/03kBy2wJ5Z1rlZXJ6biG+Z8wIIuea61pe3
 BFKtnjy3DvOG+4+gEBqgwEjlZUZDic0f/AVfD8h75/SV/50cA5B9p9NRu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448572580"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="448572580"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 11:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711549545"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711549545"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 11:30:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 11:30:29 -0700
Message-Id: <20230629183034.930121-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629183034.930121-1-matthew.brost@intel.com>
References: <20230629183034.930121-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/8] maple_tree: Export mas_preallocate
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

