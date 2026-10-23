Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D286606A320
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lvzbp6qg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDE410E708;
	Fri, 23 Oct 2026 21:10:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD3710E70B
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789844; x=1824325844;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kVNxwxLsrketoQFUkl84Zd7jJvAw04hMD0VzI3Xxa7A=;
 b=Lvzbp6qgN04e5LJM/AkSCEPme8/9CSXEZwLjf5jxKZR6dV8O7tCWh8zk
 ksF83KhW4E5PDSKMArBPXdgnaw++jqRbFWfy4kw7hINIxyNrYW3/3s/wA
 /Iyxo1ebuoSV0dV7GI8Q6dQjoSXVmL5a8IhRTmKpjJHnVzu7s0nVSvhPb
 KdqhXKfjeOKjAGa9CmHrrjYyGnwamv7guEaef6oU2QYDSjdYzUyUCj/p2
 I9KGZgQ7Fg9490QxgsMU0DjOvr+0ujUkM0ntGUpTAcMwTdqzoRgk/ocQ4
 ln7HFyKMVysj6Aujlj4krmr1CkGsv0wgFGxuL6wgiyUsVN79kS4nqkhRQ g==;
X-CSE-ConnectionGUID: Yp58W1BFSzWcTXLqvj9Zlg==
X-CSE-MsgGUID: VW1WDSy7RqeUBlOQv5GgMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562596"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:40 -0700
X-CSE-ConnectionGUID: 93y2UEz4TfWsn+KggQ3g4g==
X-CSE-MsgGUID: ranbXccuQa60rMtvCR6AgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804790"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:38 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:37 -0300
Subject: [PATCH 09/10] drm/xe/guc: Increment regset size for RING_IDLEDLY
 workarounds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-9-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
In-Reply-To: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We need to keep calculate_regset_size() in sync with
guc_mmio_regset_write(). They became out of sync when RING_IDLEDLY was
added.

This likely went unnoticed because ADS_REGSET_EXTRA_MAX - being
greater than the current size of extra_regs - inadvertently provided
some extra room in the regset, which ended up being used for
RING_IDLEDLY.

However, we should not rely on that. We should make
ADS_REGSET_EXTRA_MAX strictly about extra_regs, and explicitly account
for the RING_IDLEDLY register.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a67d3405b10f..2e738d205738 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -226,6 +226,9 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 
 		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
 			count += LNCFCMOCS_REG_COUNT;
+
+		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
+			count++; /* RING_IDLEDLY */
 	}
 
 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;

-- 
2.56.0

