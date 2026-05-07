Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F185DCD3436
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51810E245;
	Thu,  7 May 2026 01:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mj+5P23Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67E010E245;
 Thu,  7 May 2026 01:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117511; x=1809653511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNjYj6OGqgDXzzKCuYHFbYWHd83V2c87qD7QDfeVqNo=;
 b=Mj+5P23YtMgLgLk+UUx/DADE6pUbvSVFZpW/zon2LalqezuFssDnQlul
 LJcVRUozBvxKlMGDXHoNp+gRD5Nf2M/YGu7B9+/bYDBA/Pst+u4AdeqKB
 WEgmrpx2afW3nBlVJVPT0a6vNI2gyC7JwJ3hirdtJB8AIijs2IZUjNukZ
 /qz6k0zXqndDQQSAavjziqhMDZ+OlLWfOzc1jyjsF7+2M5wQjlOWHes2S
 56dlbGegGuvDAsUt2z6J6Eu32LgKALNUVkZA95amb6HNKV0HoupdMdxNg
 2nenlPdq1YEgVv1PT+FiM9TJRmVPK9UJAYiUTsuaKekdDtzkHmZxFvF+8 A==;
X-CSE-ConnectionGUID: SNDdzACrRVWTF0QC3pNG+A==
X-CSE-MsgGUID: /l+68tvSS+GXJ8xvcYXRKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089016"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:31:51 -0700
X-CSE-ConnectionGUID: ONgxqhhGTsmauiyvRKarqA==
X-CSE-MsgGUID: 6mjqBtHcR+G5RWYEC3U5lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692730"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:31:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 02/31] drm/i915/bios: search for VBT #57 by default
Date: Thu,  7 May 2026 03:31:08 +0200
Message-ID: <20260507013137.527510-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Start searching for Vswing / Preemphasis Override Block during VBT
parsing at init_bdb_blocks().

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b6fe87c29aa7c..5700de438fdfd 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -200,6 +200,8 @@ static const struct {
 	  .min_size = sizeof(struct bdb_mipi_sequence) },
 	{ .section_id = BDB_COMPRESSION_PARAMETERS,
 	  .min_size = sizeof(struct bdb_compression_parameters), },
+	{ .section_id = BDB_VSWING_PREEMPH,
+	  .min_size = sizeof(struct bdb_vswing_preemph), },
 	{ .section_id = BDB_GENERIC_DTD,
 	  .min_size = sizeof(struct bdb_generic_dtd), },
 };
-- 
2.45.2

