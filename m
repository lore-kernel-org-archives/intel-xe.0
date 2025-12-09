Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CEBD3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468710E1EC;
	Tue,  9 Dec 2025 20:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCFa/arF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ACF10E216
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765313391; x=1796849391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xGOPOCm5km5iEeWfZJKFi+xuMvKiI6/Zb+EwuEX2+Yo=;
 b=iCFa/arFUpoqB+tO7JjFVIiyuKTpCXIi57TJ6ZZPEQavxSxiGo2coX7h
 AwSCAs6DRF9culQNPv6wTKGFCt+AoJF3ddm5GR5ZkAR+MOabEsVAWyVrb
 yDXfa7nykKLz7UuZ2j4Me8K3YRpZx2QMVRccvBxTdtejHwjnBadYtwl34
 SjN4fQlKT4emQMCmL7UgR7HpI8l1VfnYXVpIg1/Y+kTmCqTSNK9yt4wVx
 adrAR4BS8brDQXThPJmNZToycAKmT1cRRpGqp+9K2BRVTMTNt0OBrzzAF
 pJgQgYHeXPI1cWnWgGYIZ4epDAU4idiDXs40GwA8Mjm50oTG5cxkbQQS4 g==;
X-CSE-ConnectionGUID: AIMn1Yo7SYyfiAn2b0RKhQ==
X-CSE-MsgGUID: qkujinj+Tdyux38CsxVUPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67175096"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67175096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:49:50 -0800
X-CSE-ConnectionGUID: jkWs4bCGTguTsCMSqdk4CA==
X-CSE-MsgGUID: aGkQ5sY7TpSjIo7OQd3sTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196369570"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.209])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:49:49 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe/bo: Don't include the CCS metadata in the dma-buf
 sg-table
Date: Tue,  9 Dec 2025 21:49:20 +0100
Message-ID: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some Xe bos are allocated with extra backing-store for the CCS
metadata. It's never been the intention to share the CCS metadata
when exporting such bos as dma-buf. Don't include it in the
dma-buf sg-table.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 54e42960daad..7c74a31d4486 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -124,7 +124,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 	case XE_PL_TT:
 		sgt = drm_prime_pages_to_sg(obj->dev,
 					    bo->ttm.ttm->pages,
-					    bo->ttm.ttm->num_pages);
+					    obj->size >> PAGE_SHIFT);
 		if (IS_ERR(sgt))
 			return sgt;
 
-- 
2.51.1

