Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644C5EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 21:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E1010E255;
	Mon, 26 Jun 2023 21:22:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA7310E255
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 21:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687814554; x=1719350554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqzD+Wc6QJdIAPsH8Xu/R4rqpgw+f3PHbp5LrAxi0BY=;
 b=EdA3GRa87QKfwRW2+2jMdNlssclA0qmy7ixfmme5JRBE/ig522Zghh2h
 PZm0zpW0Uw0AXljhvc+bbl2GAjOwh7k2h9ZjlgphLvlRQMLGDNa8z8K72
 0VwL0nJCSikFWhyiSqJHqyKowAtk7H0Il+Y4O8/065V5VaoLdvx8i0ZpW
 8/R7qES4WihDEjzOGAbIbaeezAXZowkNZNVLKawizUConFRuqGonyjsPe
 Vi7Co1r4r0GMMncCYFHetEBpAtDHzaUiSc2DCI4pqKvaP+BSwhAfvn9ej
 aA1mVWI0wY9QtHrhZdbSrqPk4ILkYe1TNCV1RC+JoDpxlnw0sZogyiESE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351175953"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="351175953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 14:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="716300828"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="716300828"
Received: from swalke-mobl2.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.112.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 14:22:32 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 14:22:20 -0700
Message-Id: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len' in
 xe_engine_create_ioctl
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

There's this shared machine running xe.ko and I often log in to see my
tmux corrupted by messages such as:

    usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!

I also sometimes see:

    kernel BUG at mm/usercopy.c:102!

Someone is running a program that's definitely submitting random
numbers to this ioctl. If you pass width=65535 and
num_placements=32769 then you get a negative 'len', which avoids the
EINVAL check, leading to the bug.

Switch 'len' to u32. It is the result of the multiplication of two u16
numbers, so it won't be able to overflow back into smaller numbers as
an u32.

Very simple reproducer:
    https://people.freedesktop.org/~pzanoni/engine-create-bug/

v2: Make len u32 instead of checking for <=0 (José).

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 6e6b2913f766..530f55a33b03 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -522,7 +522,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_engine *e = NULL;
 	u32 logical_mask;
 	u32 id;
-	int len;
+	u32 len;
 	int err;
 
 	if (XE_IOCTL_ERR(xe, args->flags) ||
-- 
2.39.2

