Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BABD1073C99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169B810E612;
	Wed,  8 Apr 2026 11:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHryFSkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5473010E612
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775646488; x=1807182488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qy7KFf8sBRevBlkdzfDGqQRfsH2lrYfHaJptOs59oHs=;
 b=WHryFSkK8UqtkXCRRb7ojJ1IMsgU6A8rMLWbxcjAxZ4LSVfiqKrjkUYD
 xPYd7Wqo1rnbVoLpYlp/z6Fr7xqr+c37plLC7qQVeyystXHvwX5urkpc7
 DlmWBKVVrhOEuNLMBeVMn0SEWPAkN/8B4O9oDXJ4IvrHFF4CtDz0S3ves
 Xwu7M4NaAfm9o1MFgph6MMQ16xP4iTBYsz51mkRkIlweBOcuu9ktsSPhV
 4FFU1QU7b4Kx1rH5IT/G39jpANoWxTQ9AtsXBJ8fsrBGcrLFx050peKXI
 G3yt/3FxeXxR2fpTvef8lkQxlw37+XoUAk3PxhO+Dyu0eCtiit9Ia11Mo Q==;
X-CSE-ConnectionGUID: HhKlnLLSS12bdAGEOjopXw==
X-CSE-MsgGUID: Jv7Qzjd0Sbm7QsScTGgJ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79217245"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="79217245"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:08:08 -0700
X-CSE-ConnectionGUID: qO8mszrjQHKqis4FPgQaqg==
X-CSE-MsgGUID: PNhd4xIdRKeb2EW9sO5zgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251588524"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:08:06 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, riana.tauro@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v3] drm/xe/xe_sysctrl: Drop redundant endian conversions in
 mailbox header macros
Date: Wed,  8 Apr 2026 04:07:59 -0700
Message-ID: <20260408110759.1407342-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Remove unnecessary le32_to_cpu() conversions from XE_SYSCTRL_APP_HDR_*
macros.

Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: (Umesh, Riana)
- Fix macros instead of changing struct field, per review

v3:
- Reword subject line to describe the change
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index 91460be9e22c..f67e9234de48 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -15,13 +15,13 @@ struct xe_sysctrl;
 struct xe_sysctrl_mailbox_command;
 
 #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
-	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
-	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
-	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
+	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
 
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
-- 
2.43.0

