Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9034CF9C69
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 21:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99010E15C;
	Tue, 24 Sep 2024 21:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY2/03Ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48610E15C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727213333; x=1758749333;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gsUBW9cw33ROlcdwY0UZCtwGIjD4+IX2E/WLzuVUT3k=;
 b=IY2/03Ii00eMHDkem083xwrJhZOjrPtwxVCFTTnhYuJF1XnPbNFQcWat
 OzhfpuIiLzqqqgYyL+YZXfZEGkoFT8B4pTr0YPkwdPiuc9JrN5rI/EiUF
 AjIzdritlI21GHe+K7mSG3JyzlyveB/jPL5BHiyjHdmvpM6L4UhAHfu0H
 VrtKdQXueM2Emz08hWcdVLIAGhz1LiejamsYaVRIc1ug+ab1hdi4LmQg7
 1h++dJmYeWjaC2qJx7yJwCxrjuADHiOPpGjv+/gVoR1UybmvxUtAJP0iD
 POAIFqRVk0YdRcQHIbgkCldb++H2ISmSooSVMpjeHxfCJ83jH3kHzqg5W A==;
X-CSE-ConnectionGUID: 1GD1tF8vRQizpQVdnza4xg==
X-CSE-MsgGUID: uvEDVuK1RbaCiVTDLZuneA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25710746"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="25710746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 14:28:53 -0700
X-CSE-ConnectionGUID: JhcrmK+4R1aNK7W8n0/Qjg==
X-CSE-MsgGUID: kWrMlklAQGGjWuJfqECcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76478606"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 14:28:52 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close
Date: Tue, 24 Sep 2024 14:28:47 -0700
Message-ID: <20240924212847.3496979-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

From: José Roberto de Souza <jose.souza@intel.com>

Mesa testing on Xe2+ revealed that when OA metrics are collected for an
exec_queue, after the OA stream is closed, future batch buffers submitted
on that exec_queue do not complete. Not resetting OAC_CONTEXT_ENABLE on OA
stream close resolves these hangs and should not have any adverse effects.

Bspec: 60314
Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2821
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d17f89a132d2..ee172d5befc82 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -774,7 +774,7 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 
 	/* Modify stream hwe context image with regs_context */
 	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
-				     regs_context, ARRAY_SIZE(regs_context));
+				     regs_context, enable ? ARRAY_SIZE(regs_context) : 1);
 	if (err)
 		return err;
 
-- 
2.41.0

