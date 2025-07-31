Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1037C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D8510E7DB;
	Thu, 31 Jul 2025 19:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWKw01MC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567A510E7DA
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990436; x=1785526436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OTg5xLTbxY16QmH8TlqcGI3sFWW+oPZqEV0l0KogUsw=;
 b=mWKw01MCVerpQuxMfVIoP+ant9gsFsbY9qUhFggsZRtVxb/FKnwMb48+
 pXStnf2foX2PqWOXxY6Ju7Nb6w2Ob/8sfH8PDQwab9Rz1r2/4PeJ5d1qB
 8VjCeuLm/QvnbmIuboxPLcARF/uSkasBZhqrQTE4c83j4Pe04QgnaGCXT
 e0P+yRjTu0/KEfS/EFrPvno28H6Sm8q6A0uYYpUXug4srNkRuvI9tgXFg
 sQpIl3uXXHTnfvb5VQcCWDeiXyfoIIQcrfI6yaRbVNN87bOigEPuCPk6k
 TfhCyE826sbhCFbxeikUazhWEm0nAn6GQkvdGun1y0ehZUOVXj5eW5qwq A==;
X-CSE-ConnectionGUID: hTf4GZrwQEq1L/HtV1kRAg==
X-CSE-MsgGUID: z4z0A5rjToet18HeAYvFLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395023"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395023"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:56 -0700
X-CSE-ConnectionGUID: ikUJUx7KQMKbEai18pf+Kw==
X-CSE-MsgGUID: xEhnqWGAQPKoCaqOxim09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333962"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex on
 exit/error
Date: Thu, 31 Jul 2025 21:33:31 +0200
Message-ID: <20250731193339.179829-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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

While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
enabled, we should still call it.

While around, drop a traling line.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: remove pr_err in separate patch (Rodrigo)
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 36e2b45b305f..56fbf4c1c37f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -401,6 +401,7 @@ int __init xe_configfs_init(void)
 	if (ret) {
 		pr_err("Error %d while registering %s subsystem\n",
 		       ret, root->cg_item.ci_namebuf);
+		mutex_destroy(&xe_configfs.su_mutex);
 		return ret;
 	}
 
@@ -410,5 +411,5 @@ int __init xe_configfs_init(void)
 void __exit xe_configfs_exit(void)
 {
 	configfs_unregister_subsystem(&xe_configfs);
+	mutex_destroy(&xe_configfs.su_mutex);
 }
-
-- 
2.47.1

