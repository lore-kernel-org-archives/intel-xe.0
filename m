Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B0CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6DD10E47D;
	Mon, 12 Oct 2026 11:22:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0D910E47D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791804134; x=1823340134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JKuUy1YIWhTnYS8tD5eRDhWB1DI9ITRbcqI4prrhakI=;
 b=iUmKJu8BZ4fv9VMm6APlw3xm8owcRRWOfle2krlwTeAPgcuOjIKQNFtk
 G6WuqbDdUSCkCvQAo3lBLU30Hd2QvT5Q1U1b5Okx4BmpwVndPfhTZ32c3
 yUR9tfI4M88EuMACvR0h6L5gvDF6xHeP74U2xaezLwkO4j/qtC7Fl3LmX
 eTNyLcTOxbZDJTvsWTMWRYXCDM4tqin/7yh/q+L5G01rihd8okIvWHYSE
 hevkQe2cJZ4WiqBYKpEdQ46hdgE7FKWbDMlM+AvFyNFikybOTDs40VmbV
 BC8BqOrH2PACELFguO16qFx3jocIEU/Wfhw993WM687v9s25KKwU47rlW Q==;
X-CSE-ConnectionGUID: F+iVS/LyTg+FDR2aakuYOQ==
X-CSE-MsgGUID: DFWB2wO3T9aW4ygtEsqIsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="395248"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="395248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:22:14 -0700
X-CSE-ConnectionGUID: fWMyR1ocSu+w6cE5PT1MIQ==
X-CSE-MsgGUID: b2AFNyOZSAKnDzDHITT3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="855882"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:22:12 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH v1] drm/xe/xe3: Fix OAM stream broken on Xe3+
Date: Mon, 12 Oct 2026 16:51:58 +0530
Message-ID: <20261012112158.180251-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

OAM stream: Prevent partial reports at the end of the buffer
when overrun mode is enabled by making the buffer size
a multiple of the report size.

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

