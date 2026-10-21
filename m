Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD52606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drCG5fff
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91ED10E303;
	Wed, 21 Oct 2026 05:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2E110E303
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792560226; x=1824096226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MZ/0tYVWFCYPlsbTEzjyRuycXmqYoeAIZMi7vlTnYMU=;
 b=drCG5fff7+aeQxIxeMvkMuvSF0NMhCavjUDuH1LlpWo9KVVZ9EdKWtIF
 GCMNop2+VJuwv0BphVagnMOThO4gyDYjTzNNU6I93U3fYTNCmLkYV0amu
 zCKY7FwMEoPWUQ2agYgDQpR9MGUIHRsG+sxC5A9Mo37PC82zt4/pJ8mqh
 NYulQdaTICk/ONm4V0GZPeRnizYWHr1Q5TxYJBr5MvjCvU7QYLncLVJPm
 4OSLdknJt1pcjcqsflege7GpKDXYVS9byY2xLu7S+z7HJ+oILWjrcjzWr
 dBRplBRUOaw0oP295sqtYMmRxme2LCGUfD3P22TYqfZOlBVX3vFGbeXVx Q==;
X-CSE-ConnectionGUID: rS122FiTTQ2OXRgBHGMNnA==
X-CSE-MsgGUID: WvYfFOmtS3Ob+GefCFvJVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1174987"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1174987"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:23:45 -0700
X-CSE-ConnectionGUID: ywmXT+28QwqbGaa7jPnWFQ==
X-CSE-MsgGUID: 8C4ul7SjT6SrTwyhi5W/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4760428"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:23:44 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH v2] drm/xe/xe3: Fix OAM stream broken on Xe3+
Date: Wed, 21 Oct 2026 10:53:34 +0530
Message-ID: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

OAM stream: Prevent partial reports at the end of the buffer
when overrun mode is enabled by making the buffer size
a multiple of the report size.

v2: Fix checkpatch issues by using a static func instead of #define.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a3484e943c55..f45d4970b29b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1743,6 +1743,15 @@ static const struct file_operations xe_oa_fops = {
 	.mmap		= xe_oa_mmap,
 };
 
+#define oag_has_tail_address_wrap(stream) \
+	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
+	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+
+#define oam_has_tail_address_wrap(stream) \
+	(MEDIA_VER((stream)->oa->xe) >= 30 && \
+	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
+	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
+
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
@@ -1767,12 +1776,13 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->syncs = param->syncs;
 
 	/*
-	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
-	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
-	 * buffer whose size, circ_size, is a multiple of the report size
+	 * For Xe2+ OAG and Xe3+ OAM, when overrun mode is enabled, there are no
+	 * partial reports at the end of buffer, making the OA buffer effectively a
+	 * non-power-of-2 size circular buffer whose size, circ_size, is
+	 * a multiple of the report size.
 	 */
-	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
-	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
+	if (stream->sample &&
+	    (oag_has_tail_address_wrap(stream) || oam_has_tail_address_wrap(stream)))
 		stream->oa_buffer.circ_size =
 			param->oa_buffer_size -
 			param->oa_buffer_size % stream->oa_buffer.format->size;
-- 
2.53.0

