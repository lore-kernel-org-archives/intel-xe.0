Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A359B606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gohL1yjl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EA210E83E;
	Sat, 21 Nov 2026 02:02:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19710E8B0
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226520; x=1826762520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9DzhgM4bCNvg6sxOydk1TJVA4GbXV3QxHNq5I5XTIRI=;
 b=gohL1yjlIOnOVBB2jZJVHtrRQteULy9YYyUW9Dtio/GVe3A3X1iJQt3h
 A3luMUtwKA54KgvPGuMoX/2zUj5TYLow1eLSpR8nupKirjWstbTWNR/dH
 GJ6THMzcyMqjo3wFhWiL0UAW23TH+ZWWCNZr66sIz303wDj4xAwSzQrdX
 yAfMV5j+RFhPiKs1g32YvbahoLn1OSeLi0Q92EUV8ArWEoDHT7nai0bC7
 sErCeB7F1ci4+1LWI6Qcm8SnAHym2A1VNhH+kMKc0/AXJAAV14zPVuUXu
 GblNUHvbsWiGU3X1s1FopksJuBa9mldNbX/G4+hF2NUJ4bauezfbePjYz A==;
X-CSE-ConnectionGUID: zJtc6WYTSPqfSKIQSGiA9Q==
X-CSE-MsgGUID: lpOxrn1YR4OT/V83uUyZzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118791"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:54 -0800
X-CSE-ConnectionGUID: 2g7gN8JiR0G0odOoDtRXnw==
X-CSE-MsgGUID: DlzxP5z5SimkWqUrRKjOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182109"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 1/7] drm/xe/oa: Ignore a HW tail pointer outside the OA
 buffer
Date: Fri, 20 Nov 2026 18:01:47 -0800
Message-ID: <20261121020145.147384-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

