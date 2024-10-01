Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B38CEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383D10E640;
	Tue,  1 Oct 2024 14:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMJexj75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B203510E640
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794411; x=1759330411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yvBBJl5SIqqmo3U4YGxGGFdYZwKItrjypC/o5O9XQxQ=;
 b=UMJexj75PTvH2fixjiCCXwfU2LjUx9zNCU8OX1m2wi13nwGEygTWVdIo
 Teqn53TDZRgO7xxqwI2Ek4tT2IesRwRhllTcs2KqAQIHboqtcPZIUWqLu
 sBsqayN4VYKkl2MairG6eu3HLTDRa/7BWJ9+VUy7SUdAR+4xiXCbkWeb/
 i5ipqHQMIlxeOJ52VcItnyHbNteFx+9mrM+ZU7mJeJGuGvZmRcT86AqWJ
 2/IlsiQjotkwR/jaMoYMvu3NEIENfNmQWna/KwMKjQ4Bv0kTF+YESHRfr
 pzNgnzMENhA3RB/+FpKeQL+JknAx8iEbRbDvqQ0FuiunQ+yda/IVKyVfp A==;
X-CSE-ConnectionGUID: yHZBeWPIT+qXjsKoRh9esA==
X-CSE-MsgGUID: Amhw9dCjTnCX/1HuhFTtMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091373"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:31 -0700
X-CSE-ConnectionGUID: 1ijE/HElTkmYjojgOyxuEw==
X-CSE-MsgGUID: 1g6Zju8NS7ygpDcU28iPVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048611"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:27 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 01/18] ptrace: export ptrace_may_access
Date: Tue,  1 Oct 2024 17:42:49 +0300
Message-Id: <20241001144306.1991001-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

xe driver would like to allow fine grained access control
for GDB debugger using ptrace. Without this export, the only
option would be to check for CAP_SYS_ADMIN.

The check intended for an ioctl to attach a GPU debugger
is similar to the ptrace use case: allow a calling process
to manipulate a target process if it has the necessary
capabilities or the same permissions, as described in
Documentation/process/adding-syscalls.rst.

Export ptrace_may_access function to allow GPU debugger to
have identical access control for debugger(s)
as a CPU debugger.

v2: proper commit message (Lucas)

Cc: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
CC: Andi Shyti <andi.shyti@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 kernel/ptrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d5f89f9ef29f..86be1805ebd8 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -354,6 +354,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
 	task_unlock(task);
 	return !err;
 }
+EXPORT_SYMBOL_GPL(ptrace_may_access);
 
 static int check_ptrace_options(unsigned long data)
 {
-- 
2.34.1

