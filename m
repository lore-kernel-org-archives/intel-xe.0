Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FA606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mE7ihj9u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156910F5D9;
	Tue, 10 Nov 2026 00:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4EF10F5DA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 00:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794270978; x=1825806978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m19RwHxpJU+UNcFCrSgGrbb076yTf62EHqdm9LZaoDo=;
 b=mE7ihj9uj5Weh/iwQmRRnUOOXof+Ms6vzDS7k6+2GOQdmUP5GyPfsbfw
 rKGSayG3AC5goj4Mk+2naGm7llAXJgnXbohfN4Rv99mWx9sarAWn8aSbt
 pAGHbvHuxqlkktuK+OiUAoYZGhW0AuK1tX9kVGW5jbRyQbJRW5dZpMNt3
 fdVtip4ckXfKUIDVkdrzvuanD5INz+jOJW8I7HAwZmMhe/oGxxCyjynsq
 yk+2jK/pFrLti4i2fhQ3yadboPSVU7XxF3w9Tmi+rGLyAXFG2U+VVJfJt
 17r/OAcaa6UPRPddQ+rZ6UtHT9kWsMw8LojJHw9rCepdNazt53wsY9YDx A==;
X-CSE-ConnectionGUID: VJsSLonyS1ylaQnLJj4zlQ==
X-CSE-MsgGUID: Dc2eUN1iQTuqoc0r13Jj5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3042625"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3042625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 16:36:15 -0800
X-CSE-ConnectionGUID: MQkPaXBYSwWzldWunQa1hQ==
X-CSE-MsgGUID: dlqam9VES06cmFPQ+gB2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8444426"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 16:36:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 4/4] drm/xe/guc: Define GuC firmware for NVL-P
Date: Tue, 10 Nov 2026 00:35:58 +0000
Message-ID: <20261110003553.787861-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
References: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
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

GuC firmware 70.83.0 (UAPI 1.46.0) is the first official GuC firmware
release for NVL-P. NVL-P has separate FW images for the primary and
media GTs, so we need independent entries in the table.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index bd75873a081c..ccc8167ce423 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -116,6 +116,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	major_ver(xe,	guc,	nvlpg,	70, 83, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	major_ver(xe,	guc,	nvlpm,	70, 83, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	major_ver(xe,	guc,	cri,	70, 83, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.53.0

