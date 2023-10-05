Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A39E92713
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606DD10E42A;
	Thu,  5 Oct 2023 15:31:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D5610E427;
 Thu,  5 Oct 2023 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519898; x=1728055898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izIrWNW4Xp8n1I1dC69zgoPMS6dyU9onm5urkIdggcU=;
 b=HGSHe1OUtGmtro+FJ94VTyOx7oaviOPLKtouly/AOV4wCys5RD9f368L
 DcywTQVtlr984xEdRLyPmICQ9U3t1w1JoV1iqLIHCdiclYtvXVsQ0zm4w
 7yg1nFkwYLxkETT8MO7NiKG4MihnKMY2uGBbWVNzKulU8PbHXgbIxpIWa
 Mm++XWo1W/DzgNNcfMl0NkYvZGjyNAVKkFvYO2zt8LsCKFev6Fp1hY4S6
 qaVaxZdXxeRYDscP5bDFtdvEwW0L5+7LuAA8dSNS4Mzon8wdFmrKLfkyj
 qyhL4GU0iIS+Dzn+wdGz9OFyKSI4P439rYzeL3cpDS39FOLyrvfde4S1u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810910"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810910"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631300"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631300"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:07 +0100
Message-ID: <20231005153116.452319-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 03/12] lib/igt_draw: mark buffers as SCANOUT
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
 lib/igt_draw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 476778a13..2332bf94a 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -791,7 +791,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create_flags(fd, 0,
 						ALIGN(tmp.size, xe_get_default_alignment(fd)),
-						visible_vram_if_possible(fd, 0));
+						visible_vram_if_possible(fd, 0) |
+						XE_GEM_CREATE_FLAG_SCANOUT);
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
-- 
2.41.0

