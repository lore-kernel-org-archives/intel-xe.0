Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B3DCE7CE7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95FD10E5F9;
	Tue,  1 Oct 2024 08:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx71OBhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CF910E107
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727772252; x=1759308252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NikIlOR247N8HjbsfLXdEHSOadUyqYQMzDwX0DHwedg=;
 b=cx71OBhzc8Kq3joAr371jswNzG8wTAkGJ2zyavDyC5VDNWXdH8P1538Y
 wIIbgxBmn58ti4HUG3KtPM9Ep5znf2xln4u6FsHxCGanSXAPkDt6kCFl2
 ELMSha5V6VGm69qX4Z6F4o2VhEKEdKTl/Hj1jPYr3jj2UbnIohL9hNSSV
 LQh2UGMSBXeDsJL/tVIXnIpIwYx9cabH1Cre93W/jTI3bE0MevnlFOG23
 vlMLltxWuFSkEjewHScviNuknwm5ESYN2uUIzCJ4+YNvAv+8QBMEdWcjX
 a2phU8B0+Xf/+my8cXuZgdhMrLCTsATqmnDKVXMEq+zpKekF4SrpwqIQq A==;
X-CSE-ConnectionGUID: OshxceDUQPWZ6MkWzskvrA==
X-CSE-MsgGUID: 8ePaSX69Q7+BoTlRj6i9cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27020715"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27020715"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:12 -0700
X-CSE-ConnectionGUID: LmuwFW8aRFK0mw33O7xTWg==
X-CSE-MsgGUID: 2xJh5uyIR0iJaixoiDAISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104413731"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO mwauld-desk.intel.com)
 ([10.245.245.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/xe/ct: fix xa_store() error checking
Date: Tue,  1 Oct 2024 09:43:48 +0100
Message-ID: <20241001084346.98516-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001084346.98516-5-matthew.auld@intel.com>
References: <20241001084346.98516-5-matthew.auld@intel.com>
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

Looks like we are meant to use xa_err() to extract the error encoded in
the ptr.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 44263b3cd8c7..d3de2e6d690f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -667,16 +667,12 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		num_g2h = 1;
 
 		if (g2h_fence_needs_alloc(g2h_fence)) {
-			void *ptr;
-
 			g2h_fence->seqno = next_ct_seqno(ct, true);
-			ptr = xa_store(&ct->fence_lookup,
-				       g2h_fence->seqno,
-				       g2h_fence, GFP_ATOMIC);
-			if (IS_ERR(ptr)) {
-				ret = PTR_ERR(ptr);
+			ret = xa_err(xa_store(&ct->fence_lookup,
+					      g2h_fence->seqno, g2h_fence,
+					      GFP_ATOMIC));
+			if (ret)
 				goto out;
-			}
 		}
 
 		seqno = g2h_fence->seqno;
@@ -879,14 +875,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 retry_same_fence:
 	ret = guc_ct_send(ct, action, len, 0, 0, &g2h_fence);
 	if (unlikely(ret == -ENOMEM)) {
-		void *ptr;
-
 		/* Retry allocation /w GFP_KERNEL */
-		ptr = xa_store(&ct->fence_lookup,
-			       g2h_fence.seqno,
-			       &g2h_fence, GFP_KERNEL);
-		if (IS_ERR(ptr))
-			return PTR_ERR(ptr);
+		ret = xa_err(xa_store(&ct->fence_lookup, g2h_fence.seqno,
+				      &g2h_fence, GFP_KERNEL));
+		if (ret)
+			return ret;
 
 		goto retry_same_fence;
 	} else if (unlikely(ret)) {
-- 
2.46.2

