Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A903606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWbvvJZO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBBF11267C;
	Thu, 26 Nov 2026 18:07:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358E10EA03;
 Thu, 26 Nov 2026 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716419; x=1827252419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HtVnO/EGWzO1zQb/ffFktyHySN0nHcZhkWSa5DgYCI8=;
 b=VWbvvJZObZKMTZm4pusA1KBCjGCdmtk77EVT6FTUA6v2zf3kOYjIhfVr
 j7dTp69iOwkJ6lm8GKkawLwCUDG9K/dFXLWiWtpzJuPVII15j8Z8NNKEY
 ic0jMNsp1mOjKwdU/xadP4DQGN/O+xwMhJp7E2HaQm5sZeRghgc0qRRUx
 YmsBtHMvAmnmpxEAWmEDj3ZsGAEsMTgydDpLaTeAOmq8SJw21Wul6+IJh
 V80Ss1H/km+22jXCcAUbGmP6MFOFR8Dv2KsW8K+296f1TUJHqvsi8Xbu1
 rRywPip0/A1PZxv2VaQblReulDrpU2ZmS3Z+epk9hKf/FQVHqDmHuhyfY Q==;
X-CSE-ConnectionGUID: TlQ9LoYnT6KdOZz7sc2nvQ==
X-CSE-MsgGUID: X9CLkmYuQKyRVenODBfsgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702483"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:58 -0800
X-CSE-ConnectionGUID: 8Fw+Ndi2RrmZgSkxcS2UBg==
X-CSE-MsgGUID: WbpYOJcLQ4yJLjXByxP04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12454577"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:56 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 4/4] drm/i915/bios: s/init_bdb_blocks/init_each_bdb_block/
Date: Thu, 26 Nov 2026 19:06:14 +0100
Message-ID: <20261126180614.224327-5-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
References: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_bdb_blocks() and init_bdb_block() names differ only by the suffix
's'. Rename the former to lower the confusion and to reflect better it's
meaning.

No functional change.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4ffdfc271cca5..5c5640aa0c864 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -519,8 +519,8 @@ init_bdb_block(struct intel_display *display,
 	list_add_tail(&entry->node, &display->vbt.bdb_blocks);
 }
 
-static void init_bdb_blocks(struct intel_display *display,
-			    const void *bdb)
+static void init_each_bdb_block(struct intel_display *display,
+				const void *bdb)
 {
 	int i;
 
@@ -3335,7 +3335,7 @@ void intel_bios_init(struct intel_display *display)
 		    (int)sizeof(vbt->signature), vbt->signature,
 		    display->vbt.version);
 
-	init_bdb_blocks(display, bdb);
+	init_each_bdb_block(display, bdb);
 
 	/* Grab useful general definitions */
 	parse_general_features(display);
-- 
2.45.2

