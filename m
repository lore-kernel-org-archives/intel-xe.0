Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19C9C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763DD11217E;
	Wed,  6 Mar 2024 10:19:49 +0000 (UTC)
Received: from out0-198.mail.aliyun.com (out0-198.mail.aliyun.com
 [140.205.0.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F45112012
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:19:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018047211;
 MF=tiwei.btw@antgroup.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---.Wgbn-Jk_1709720382; 
Received: from ubuntu..(mailfrom:tiwei.btw@antgroup.com
 fp:SMTPD_---.Wgbn-Jk_1709720382) by smtp.aliyun-inc.com;
 Wed, 06 Mar 2024 18:19:42 +0800
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
To: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net
Cc: <jani.nikula@intel.com>, <linux-um@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 "Tiwei Bie" <tiwei.btw@antgroup.com>
Subject: [PATCH v3 4/9] um: Fix the return type of __switch_to
Date: Wed, 06 Mar 2024 18:19:20 +0800
Message-Id: <20240306101925.1088870-5-tiwei.btw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
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

Make it match the declaration in asm-generic/switch_to.h. And
also include the header to allow the compiler to check it.

Signed-off-by: Tiwei Bie <tiwei.btw@antgroup.com>
---
 arch/um/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index 292c8014aaa6..a7607ef1b02f 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -26,6 +26,7 @@
 #include <linux/resume_user_mode.h>
 #include <asm/current.h>
 #include <asm/mmu_context.h>
+#include <asm/switch_to.h>
 #include <linux/uaccess.h>
 #include <as-layout.h>
 #include <kern_util.h>
@@ -73,7 +74,7 @@ static inline void set_current(struct task_struct *task)
 
 extern void arch_switch_to(struct task_struct *to);
 
-void *__switch_to(struct task_struct *from, struct task_struct *to)
+struct task_struct *__switch_to(struct task_struct *from, struct task_struct *to)
 {
 	to->thread.prev_sched = from;
 	set_current(to);
-- 
2.34.1

