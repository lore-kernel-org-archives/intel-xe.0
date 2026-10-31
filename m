Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E461606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Oct 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMrwECMK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EF510E26B;
	Sat, 31 Oct 2026 05:57:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EE710E26B
 for <intel-xe@lists.freedesktop.org>; Sat, 31 Oct 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793426261; x=1824962261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rv2XS4IZkvKwUXCaY0waNbHZQtadMA3M2CCXdtCnHg0=;
 b=GMrwECMK3SR9MY892SGteIsOu4crsZ3VpbFxxV1V+rXoRbFmGL5QU0KC
 0Up973s3TdtqpZl9DJWH+1hOBNcbYOVUMsieIGLSRhnFDTiGbeBJLkm8R
 YxnfOPkDq+uyK+P3C+ljTQyi+i1XScAjZqr7Mh70MHJLkB988XFHkTHNk
 fK7lLZqZF4AfJuLUlJLfoNjWmkSrpEHGfKlw2uk7xwYSUP7baHef/O24a
 tpE9Muckjbsoj2e+DktJUMTfjxAVH23k0Cr5GXT4x0Uv/EOyAOm9WBHT6
 C40EzAB5FFVnZS7P56ZXCF626ETRSMlYUjahvc5ndlV4ftQJwEtIkMSQ3 Q==;
X-CSE-ConnectionGUID: Ox/bZUBHSKS56H7tLC26HA==
X-CSE-MsgGUID: rZ/9Qnx6TkeaY98GcfsS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2063713"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2063713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 22:57:40 -0700
X-CSE-ConnectionGUID: /hf2j2WcSDyEoKv/Ihi5eQ==
X-CSE-MsgGUID: OxFurtlnSJGB4yhcZTJ4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5480982"
Received: from fyang16-desk.jf.intel.com ([10.24.81.66])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 22:57:39 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, harish.chegondi@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH] drm/xe/eu_stall: Don't mark stream enabled if enable fails
Date: Fri, 30 Oct 2026 23:02:34 -0700
Message-ID: <20261031060234.2404661-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Fei Yang <fei.yang@intel.com>

xe_eu_stall_enable_locked() set stream->enabled before calling
xe_eu_stall_stream_enable(). If the firmware ACK timed out, the enable
path had already dropped its forcewake and runtime PM references, yet
the stream stayed marked as enabled. On close, the disable path then
released the same references a second time, tripping the forcewake
refcount assert.

Only mark the stream enabled, and queue the poll work, once enabling
has succeeded.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 8a7c1b5d5ab9b..c918fe3851c47 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -849,9 +849,11 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 	if (stream->enabled)
 		return ret;
 
-	stream->enabled = true;
-
 	ret = xe_eu_stall_stream_enable(stream);
+	if (ret)
+		return ret;
+
+	stream->enabled = true;
 
 	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
 			   &stream->buf_poll_work,
-- 
2.43.0

