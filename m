Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91934FF512C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 18:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360110E499;
	Tue,  7 Apr 2026 18:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnWTQ6wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC710E499
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775585037; x=1807121037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hlEkwTR4bkj0I2rWSSmejTwDzWlDylLW4tbLMyIzvxw=;
 b=lnWTQ6wp71jRNPPAVrtN2LrNpIBf7Eb+hfcV4zWY7PV1jsapcdghWr+n
 Fm5rxUn+iIjePtlataVEwltAuQNOQCTsesJjw8qWyxpMqeo0MFuU93m69
 OXsbLcNIAQveh/oidrDYrFTDokWUdvMR+DprorIBCFlgLHFrv2YLB8E7v
 RdGtGpbvFgApFkL5GocNRgVAOPqcXQ1RJyZ73JCWb74UpviEycsTkykrE
 Ruwr0L/f+f/91rVCOEwMS9zZw6RrsQU+Wt+eNKtPwOpV4w9RKkCs0MHZj
 eFgl+XbM+hN6nEf51PzUA/P6TbCiDZKeT5PbbD4Uki2cfZDaN7l0sjkTs w==;
X-CSE-ConnectionGUID: VXe0SKGxS8ie7kHBKg66KA==
X-CSE-MsgGUID: fHcvKOIxS36UA6a9xEP7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76521112"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76521112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 11:03:56 -0700
X-CSE-ConnectionGUID: iTJoqpj0SM21LIhrJydQPg==
X-CSE-MsgGUID: f44c3hDsSWG+7XQv9wFsAA==
X-ExtLoop1: 1
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 11:03:54 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, riana.tauro@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v2] drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox
 header macros
Date: Tue,  7 Apr 2026 11:03:40 -0700
Message-ID: <20260407180339.794310-2-anoop.c.vijay@intel.com>
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
---
v2: (Umesh, Riana)
- Fix macros instead of changing struct field, per review
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

