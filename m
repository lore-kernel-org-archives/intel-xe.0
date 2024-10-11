Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A65D0D791
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AE710EAEB;
	Fri, 11 Oct 2024 13:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZY9avQ0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC1B10EAEB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728653809; x=1760189809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wlp64ocQwO0ULZow76Y602j/+aNP8TFmvRUudPm7FLw=;
 b=ZY9avQ0T9l2d5e2NpLvB49e1vCIXupx2cHfqpBaLFld0zH7mczfmE0JB
 wurE7Kg3B5Cc5dVdpUFeBQqb1ZGq7L+gVOg5XqJWmLgOnxUsNVNF3J1yG
 vH8JBY7Dj7LNfTzRBodUQieNP3uA85DOuAj8XK25rBn2altGsEQXcMja7
 NY8qAFV2QpYnzxh85LKBvIR3x1shjBLu5UrgZLBCIVxO32+ai1SjWMWDp
 p8qsr0cyxFD/Fola0nOxHqSAE1qwI/GzBd3qU7hEIlbvV4IIj+aRngSOi
 qUFmrSoRqczF6DjCTNjlCeVLCM1yYudyiJFCD50SPcQ9sHavNgn5UnbS9 g==;
X-CSE-ConnectionGUID: Dzye8VQ5T2uVe0F/+kUxWQ==
X-CSE-MsgGUID: KifCAMUrQ16vj08PHMx79A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="45562370"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="45562370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:36:49 -0700
X-CSE-ConnectionGUID: GnXBE5umT/K6mYgF1QRA+Q==
X-CSE-MsgGUID: rQj1+r7kSGqdAB200rsoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81442200"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:36:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe/xe_sync: initialise ufence.signalled
Date: Fri, 11 Oct 2024 14:36:34 +0100
Message-ID: <20241011133633.388008-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
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

We can incorrectly think that the fence has signalled, if we get a
non-zero value here from the kmalloc, which is quite plausible. Just use
kzalloc to prevent stuff like this.

Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
---
 drivers/gpu/drm/xe/xe_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index bb3c2a830362..c6cf227ead40 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -58,7 +58,7 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	if (!access_ok(ptr, sizeof(*ptr)))
 		return ERR_PTR(-EFAULT);
 
-	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
+	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.46.2

