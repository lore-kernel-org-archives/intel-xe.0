Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63477C64ED9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4454A10E138;
	Fri, 17 Feb 2023 00:53:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78910E1AA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595184; x=1708131184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7wXotebfuJNrBaaXXcBt6oS/64oJcHgel3Vny2IMpw=;
 b=iNaND5XvBBNw4gJY0JrkIFs4FAmnSXmXddEAhr6I0wVhxvVWyAccTAH8
 z48tvWwIeRaj87eEAeBEjb1jBlGAdRxnV9zjasJzUgBORGNc3gXm1biSQ
 i0LniEzOarSGbloWVQjb3qW3fBzCbQj74oTUCFIaMxfmoEzpEyurYO41+
 q2my4ig+1MLmaqa3zVJwT0B7v56o0SKQN3rIglUlvdPJn0yeFymVyEuG3
 8cA6zeHf118JUUehjgNj9ddxAnzAcwIQTzMGWbQeX6yaAX8vDv3eOih65
 EPk6JHBjFeXgQkwcYlRt9Gvq3wBLeTAn5zcNX/sKV472BDgg8JHCgmSzw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602193"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417769"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417769"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:16 -0800
Message-Id: <20230217005226.106499-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/11] drm/xe: Remove outdated build workaround
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use the more common "call cc-disable-warning" way to disable warnings.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

