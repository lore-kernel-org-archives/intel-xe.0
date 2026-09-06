Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFBC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCDF10E088;
	Sun,  6 Sep 2026 17:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVzy67DM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D771710E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714582; x=1820250582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dL50JqXVUTNTqTm1PZ6952o3kHQErzMqD9FLZzimmIc=;
 b=mVzy67DMhS5TeTCYagvQzXoX6pXvMPqMdZeJNOOvCD4WXhTvvyQ5sASa
 mGJE/6WDJDfSyNluxob1/uN2gxNASR//s9tbXLK5gfnIke2O0TvXdtMgS
 E9QlF99kstX9dK4/zGIUPitpj9+ThblwrhZE0FEgjNAPSiSiIT+eNZlI7
 dVJjVxXUHiz3tUSV3wWUQjY8ELXNngE1Sm2OsxMxyl/d537TVTlEzNQCE
 j4VnK+WXkjcOSRwS/Wok/KAF+iWPcFzUl7gVMv1Dzq0BgXPwn22nn77R6
 3t/fqDGfiznfJ+L0pCmOK8l/1KC2AmmIJhXahTqB/8wKCyKnBt4C8uh6f w==;
X-CSE-ConnectionGUID: dO9g2ZPrRbeWBUTHQ2hGZw==
X-CSE-MsgGUID: g62GDaByQuSctMkovm941w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071451"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:42 -0700
X-CSE-ConnectionGUID: 7nZNK42ORUWz0wNlmHuxBA==
X-CSE-MsgGUID: l+FfZ8oEQqeBTl/4GLWkdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996135"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:39 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 08/12] drm/xe/xe_ras: Report device memory errors using
 SIGID
Date: Sun,  6 Sep 2026 22:56:13 +0530
Message-ID: <20260906172604.2215987-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Use xe_log_comp_info helper to report device memory errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 288dbc0942f5..3a7f80370827 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -387,14 +387,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	 */
 	switch (info->category) {
 	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, "[RAS]: Poison error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Poison error detected\n");
 		break;
 	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, "[RAS]: Data parity error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
-		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
-			info->sw_address);
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Double-bit ECC error detected at sw address 0x%llx\n",
+				 info->sw_address);
 		/* TODO: Add page offlining for Double-bit ECC error */
 		fallthrough;
 	default:
-- 
2.54.0

