Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E41C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15B810E6EE;
	Wed, 17 Jan 2024 13:41:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F4B10E6BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498876; x=1737034876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1NBcIo5c3kCXLF++H/IhKC7YrmihvddlT+uChVx/Mg=;
 b=ijYHVizcpLd3victNU1O6rlzREqY1IkSswERFAoKGgghS94vxDumwahw
 Zh3/VBh/hq2uq2MOuhZUN+E49m9bXj0f7IfzYxQCisZJ9h5VW6AHNidro
 tDWipG7e4lLGR0D4PeLE+/zNVW+2hgrCPgRLUoF7V4bMYU+vLr8TIKIib
 lE9tJzyUWEgxNzqYR820PIrIjCz/dTYw0/6dEacBi5uR3hOR1c0PjYC+z
 vvWbOLmGhYOZvXLPxrOsJknSFlkXrPcJtSRkpb/QVPictDxhNL6IHNi82
 9oebXAOXT+UiU9dFdfSZxDj/7hyDR5jslglPMrJogOBxqw+GyCJVlWXvS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549623"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549623"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831080"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831080"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/5] drm/xe/ggtt: Use ioread64 to dereference ggtt::gsm
Date: Wed, 17 Jan 2024 14:40:45 +0100
Message-ID: <20240117134048.165425-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The pointer is an __iomem pointer.
Silence the sparse warning.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6fdf830678b3..305f414b9b65 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -307,11 +307,11 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 		unsigned int i = addr / XE_PAGE_SIZE;
 
 		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
-		if (ggtt->gsm[i] == scratch_pte)
+		if (ioread64(ggtt->gsm + i) == scratch_pte)
 			continue;
 
 		printk("%s    ggtt[0x%08x] = 0x%016llx",
-		       prefix, (u32)addr, ggtt->gsm[i]);
+		       prefix, (u32)addr, ioread64(ggtt->gsm + i));
 	}
 }
 
-- 
2.43.0

