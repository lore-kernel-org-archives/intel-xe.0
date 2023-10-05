Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7614E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2F810E427;
	Thu,  5 Oct 2023 15:31:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510A710E424;
 Thu,  5 Oct 2023 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519897; x=1728055897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YqoAY4nCBLZudc/ZvZFaJnfQqHuQAkf/HwosfT4ZBzM=;
 b=L3QmMXhNdQIzZ/qCpD3SAN/tA7aLBVrTF5ASfBTTVJwexYE985HDwQm3
 x7FM9QKSVMFlHc4FpK2RJPH44UTUDdNF25OJMEcQNHgEB2xcf2dt/QjHH
 UhKK+3PMCKinPV9mHAyuIAp2flcIUrSrapzpZnuHonjqx8tYtLk7Iyoss
 S1WkvnFbQz4y9cVEEUCrKrQhP/hPjBjhNFyktKW8LzKWqKSFFaEmqWPCO
 fJSB3Ath19tDdMRvtQOkmhcseqeQXkJqxCsDaZVVece4qfuPivcRqUgz5
 V1ZjC8taRzGlWUIcoc1atIHtQFPA9EK9R31ilshLiI6JlQ+tmEvHc4X/U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810908"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810908"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631293"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631293"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:06 +0100
Message-ID: <20231005153116.452319-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 02/12] lib/igt_fb: mark buffers as SCANOUT
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Display buffers likely will want WC, instead of the default WB on the
CPU side, given that display engine is incoherent with CPU caches.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 54a66eb6a..f8a0db22c 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1206,7 +1206,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
 			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
-							visible_vram_if_possible(fd, 0));
+							    visible_vram_if_possible(fd, 0) |
+							    XE_GEM_CREATE_FLAG_SCANOUT);
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
-- 
2.41.0

