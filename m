Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A9BC61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A910E35D;
	Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F5010E187
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008476; x=1708544476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+vs/pNuMBAd50eF1MY0zAcQb3qQ8Io2E+whDKnJCbE=;
 b=CRRdx146JQNedzSq3/jUNrsNJL5hWuAptMGXjOb9UIG5iuDI/aPdKIhv
 KcoW39Ljg/A9G9mHTgvlGlce16r71HH5TyG92xfOaPr6jY13t2yu1HpSp
 noNeh8FS1ShdU3s0nPs+mKMFZEWOSnXxOW5A+8ba/HrmtIYReuUMr4OKL
 czBUgqocTxTAAulm/sDMX0S/v8zx39Qoj+agDJReMk9UccuTWyO0p8lI/
 ELYodgxnl1wboq2L94ElhKG+kDWtJmF07z6s0v+wzG1wVG5HNKJd0r5d6
 gjrbJXmHs8IKvwPlIPXtX7ZtUzlRGIFNQX94FeRFLPbRBYkXYK3ACt+gS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735692"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735692"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622187"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622187"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:50 -0800
Message-Id: <20230221194002.819026-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/13] drm/xe: Remove outdated build workaround
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use the more common "call cc-disable-warning" way to disable warnings.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index abd804d622e6..18257cd7227d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -13,14 +13,8 @@
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
 subdir-ccflags-y := -Wall -Wextra
-# making these call cc-disable-warning breaks when trying to build xe.mod.o
-# by calling make M=drivers/gpu/drm/xe. This doesn't happen in upstream tree,
-# so it was somehow fixed by the changes in the build system. Move it back to
-# $(call cc-disable-warning, ...) after rebase.
-subdir-ccflags-y += -Wno-unused-parameter
-subdir-ccflags-y += -Wno-type-limits
-#subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
-#subdir-ccflags-y += $(call cc-disable-warning, type-limits)
+subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
+subdir-ccflags-y += $(call cc-disable-warning, type-limits)
 subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
 subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 # clang warnings
-- 
2.39.0

