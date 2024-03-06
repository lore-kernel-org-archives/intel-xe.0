Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC1C54E5D
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CDE11217B;
	Wed,  6 Mar 2024 10:19:49 +0000 (UTC)
Received: from out0-211.mail.aliyun.com (out0-211.mail.aliyun.com
 [140.205.0.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FF610EC67
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:19:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018047207;
 MF=tiwei.btw@antgroup.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---.Wgbn-K1_1709720384; 
Received: from ubuntu..(mailfrom:tiwei.btw@antgroup.com
 fp:SMTPD_---.Wgbn-K1_1709720384) by smtp.aliyun-inc.com;
 Wed, 06 Mar 2024 18:19:44 +0800
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
To: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net
Cc: <jani.nikula@intel.com>, <linux-um@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 "Tiwei Bie" <tiwei.btw@antgroup.com>
Subject: [PATCH v3 8/9] um: Fix -Wmissing-prototypes warnings for text_poke*
Date: Wed, 06 Mar 2024 18:19:24 +0800
Message-Id: <20240306101925.1088870-9-tiwei.btw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
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

The prototypes for text_poke* are declared in asm/text-patching.h
under arch/x86/include/. It's safe to include this header, as it's
UML-aware (by checking CONFIG_UML_X86).

This will address below -Wmissing-prototypes warnings:

arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]

Signed-off-by: Tiwei Bie <tiwei.btw@antgroup.com>
---
 arch/um/kernel/um_arch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 7a9820797eae..e95f805e5004 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -23,6 +23,7 @@
 #include <asm/cpufeature.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
+#include <asm/text-patching.h>
 #include <as-layout.h>
 #include <arch.h>
 #include <init.h>
-- 
2.34.1

