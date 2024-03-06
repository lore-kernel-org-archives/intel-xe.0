Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733C8C54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 18:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E3113453;
	Wed,  6 Mar 2024 18:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHZjARJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23411344D;
 Wed,  6 Mar 2024 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749999; x=1741285999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7kyJBefDhprRICBFCkcsVq50Tuu5A/ZILxT36Yg5FO4=;
 b=OHZjARJYgG4fc17d9kqkzA/z7wdQytb0wI4PL54XjyhivSPsQ4SFOflJ
 +s1es1IR0Sihck/FOgeruHaFlQSvlM6mTBdt8aJ8mGkUGFXg59/fuhIqB
 5bG88R4dr2ZXKwbzjuOwMeZwvlVtUYXDyZQo76miiHao63Lwrbx9drUMc
 YtARKfsKjdWwUJrSsBJRIlc2wzTjreEhzsuYHjo3bK5dPoXSMdM2IZs3i
 Bl7avrxEFAq12QbXwKTwyRtPkNnTCAxhNiUgTAJFvP3nZq8Ux8hw0MCE8
 XX/BkfUP43b8vmrVAJDMYeSatbKTykVLPmGHRyxgzx/2unmufXRP4afXV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102855"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9989575"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 21/22] drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
Date: Wed,  6 Mar 2024 20:31:26 +0200
Message-Id: <d34aec95975ce8cc9f372670dad51d1860102530.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There's no proper way to document function pointer members, but at least
silence the warnings.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_kmap_iter.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_kmap_iter.h b/include/drm/ttm/ttm_kmap_iter.h
index cc5c09a211b4..fe72631a6e93 100644
--- a/include/drm/ttm/ttm_kmap_iter.h
+++ b/include/drm/ttm/ttm_kmap_iter.h
@@ -20,7 +20,7 @@ struct iosys_map;
  */
 struct ttm_kmap_iter_ops {
 	/**
-	 * kmap_local() - Map a PAGE_SIZE part of the resource using
+	 * @map_local: Map a PAGE_SIZE part of the resource using
 	 * kmap_local semantics.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
@@ -31,7 +31,7 @@ struct ttm_kmap_iter_ops {
 	void (*map_local)(struct ttm_kmap_iter *res_iter,
 			  struct iosys_map *dmap, pgoff_t i);
 	/**
-	 * unmap_local() - Unmap a PAGE_SIZE part of the resource previously
+	 * @unmap_local: Unmap a PAGE_SIZE part of the resource previously
 	 * mapped using kmap_local.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
-- 
2.39.2

