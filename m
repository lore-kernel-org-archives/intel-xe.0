Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D9C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B905D10EC4E;
	Wed,  6 Mar 2024 10:19:46 +0000 (UTC)
Received: from out0-208.mail.aliyun.com (out0-208.mail.aliyun.com
 [140.205.0.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749710EC67
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:19:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018047213;
 MF=tiwei.btw@antgroup.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---.Wgbn-Jf_1709720382; 
Received: from ubuntu..(mailfrom:tiwei.btw@antgroup.com
 fp:SMTPD_---.Wgbn-Jf_1709720382) by smtp.aliyun-inc.com;
 Wed, 06 Mar 2024 18:19:42 +0800
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
To: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net
Cc: <jani.nikula@intel.com>, <linux-um@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 "Tiwei Bie" <tiwei.btw@antgroup.com>
Subject: [PATCH v3 3/9] um: Remove unused functions
Date: Wed, 06 Mar 2024 18:19:19 +0800
Message-Id: <20240306101925.1088870-4-tiwei.btw@antgroup.com>
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

These functions are not used anymore. Removing them will also address
below -Wmissing-prototypes warnings:

arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]

Signed-off-by: Tiwei Bie <tiwei.btw@antgroup.com>
---
 arch/um/kernel/process.c | 21 ---------------------
 arch/um/kernel/tlb.c     |  6 ------
 2 files changed, 27 deletions(-)

diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index 20f3813143d8..292c8014aaa6 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -48,17 +48,6 @@ static inline int external_pid(void)
 	return userspace_pid[0];
 }
 
-int pid_to_processor_id(int pid)
-{
-	int i;
-
-	for (i = 0; i < ncpus; i++) {
-		if (cpu_tasks[i].pid == pid)
-			return i;
-	}
-	return -1;
-}
-
 void free_stack(unsigned long stack, int order)
 {
 	free_pages(stack, order);
@@ -250,21 +239,11 @@ char *uml_strdup(const char *string)
 }
 EXPORT_SYMBOL(uml_strdup);
 
-int copy_to_user_proc(void __user *to, void *from, int size)
-{
-	return copy_to_user(to, from, size);
-}
-
 int copy_from_user_proc(void *to, void __user *from, int size)
 {
 	return copy_from_user(to, from, size);
 }
 
-int clear_user_proc(void __user *buf, int size)
-{
-	return clear_user(buf, size);
-}
-
 static atomic_t using_sysemu = ATOMIC_INIT(0);
 int sysemu_supported;
 
diff --git a/arch/um/kernel/tlb.c b/arch/um/kernel/tlb.c
index 7d050ab0f78a..70b5e47e9761 100644
--- a/arch/um/kernel/tlb.c
+++ b/arch/um/kernel/tlb.c
@@ -576,12 +576,6 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 }
 EXPORT_SYMBOL(flush_tlb_range);
 
-void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
-			unsigned long end)
-{
-	fix_range(mm, start, end, 0);
-}
-
 void flush_tlb_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
-- 
2.34.1

