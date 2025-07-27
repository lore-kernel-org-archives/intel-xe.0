Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE3C87FD1
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270AD10E313;
	Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrTmJFLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87610E312
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636822; x=1785172822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQLa9mGXCvK/0lx8MWNCoVKq6GNhJdsdItQds/C+i10=;
 b=hrTmJFLSu+gbrpveNEqtgoFxVoqkDmIiBGhY/hVk7Ob+5Ku2xyWGl8mr
 zElQQEdhlkH+CT/Un3HVVCHXz4hJZOqzDj2kHMMvI35gh8m2otiFBd1/H
 t6ThLeBl2ZvtCWLPRJHh1VQ3ZArUQ17VbIkfvk9CU+tieNsHKnNgXxg/G
 X6pE7EMIEGWL3XKeVQSHrcuIl9w0jHp/2XYojQnqVCzTdZACf0lyUTRFX
 pNWCL0VEwNuweK2Tfra0br8Kfd+u2XKXbw1PsxUn6lkIHd6sBhKZQp/hZ
 0IZ43pjMmmLP/132mTkuAnDZTbim/T3Y1el/t385KoAnDEzUi2OBuv7z6 A==;
X-CSE-ConnectionGUID: It413ShbSO2HHO/e3AGiyA==
X-CSE-MsgGUID: F/A6oqEoQSan5UO3f78Q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046722"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:22 -0700
X-CSE-ConnectionGUID: IKoWdLS5QM2J1xDVFCL6EQ==
X-CSE-MsgGUID: CJHZqx7FQ5GbpL9Bthd9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556818"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 02/11] drm/xe: Print module init abort code
Date: Sun, 27 Jul 2025 19:19:59 +0200
Message-ID: <20250727172009.587-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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

We should provide a hint to the user why the module refused to
load. This will also allow us to drop individual error messages
from init steps.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 593bc9e5851a..23be7c4cfde1 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -155,6 +155,8 @@ static int __init xe_init(void)
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
 		err = xe_call_init_func(&init_funcs[i]);
 		if (err) {
+			pr_info("%s: module_init aborted at %ps %pe\n",
+				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));
 			while (i--)
 				xe_call_exit_func(&init_funcs[i]);
 			return err;
-- 
2.47.1

