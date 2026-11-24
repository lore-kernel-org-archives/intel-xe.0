Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588B606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CBVECnVG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175B110E5A0;
	Tue, 24 Nov 2026 20:12:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6268B10E1BB
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795551124; x=1827087124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9DzhgM4bCNvg6sxOydk1TJVA4GbXV3QxHNq5I5XTIRI=;
 b=CBVECnVGHBR2K3htWn3AMIMwEIgj5bkMa8W1ozy8J/Y2d85pzyJgoHIv
 xAEwHXomjErDf4hoTFpwUEvX3pklbVFKNxwguSdR7Awbnp/f68fK1q6sa
 jaqS8LI2Ooxypn5ZxsxShj4ixVqatMbnqy/zVZGGqz2KfYD0NgXnZ7iLK
 sXMdBpG0QsZoL4ES6zhkRifJSY+OVgObX44BOinoPpYmrDOuA3i1tnboU
 1JbLF+To+yjRfK9J8HaWiOTbtz+5e9n9CMn8xoBXYc835RYdIhLE7emQj
 AOh/rQszaxHV2IYb2zqBYV3j48GRcJPvPH+QXW4XiJpWE9mIztjehc9xM w==;
X-CSE-ConnectionGUID: vyDoZoYhQuC2qwfv20vW/Q==
X-CSE-MsgGUID: LMxM50ttSheHBEBTYUtdTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4305566"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4305566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
X-CSE-ConnectionGUID: ZlpBMJbRQY6YY11JeJUCww==
X-CSE-MsgGUID: a8NJFeazQvKmz7V1jsZWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12240622"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v10 1/7] drm/xe/oa: Ignore a HW tail pointer outside the OA
 buffer
Date: Tue, 24 Nov 2026 12:11:52 -0800
Message-ID: <20261124201150.405479-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A device that stopped responding, e.g. during PCI error recovery or
after a surprise removal, returns all ones for the OA tail pointer, and
a reset device returns 0. Subtracting the GGTT address of the OA buffer
then leaves a tail offset way past the end of the OA buffer.

Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
walks backward from it, reading report ids and timestamps out of bounds
of the OA buffer mapping, from the poll hrtimer in hardirq context and
with the OA buffer lock held.

Ignore a HW tail outside the OA buffer, as if no new reports landed.

Fixes: cffd77865f47 ("drm/xe/oa: Enable Xe2+ overrun mode")
Cc: stable@vger.kernel.org
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
v2: Update the Fixes tag
---
 drivers/gpu/drm/xe/xe_oa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 664fc4e4741f..d99593e62ca7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	hw_tail = xe_oa_hw_tail_read(stream);
 	hw_tail -= gtt_offset;
 
+	/*
+	 * A device that stopped responding, or was reset, returns a tail outside the OA
+	 * buffer. Don't walk the buffer from there.
+	 */
+	if (hw_tail >= stream->oa_buffer.circ_size) {
+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+		return false;
+	}
+
 	/*
 	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
 	 * increments. Also report size may not be a power of 2. Compute potential
-- 
2.55.0

