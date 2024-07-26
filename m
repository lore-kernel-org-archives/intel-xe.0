Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C765FC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AFA10E9A3;
	Fri, 26 Jul 2024 14:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPZHow9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604110E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ls7g6KKt3RJx75bW/gTpC8vGHXZUdco3NKBdrvULtJ0=;
 b=XPZHow9+tCqCW5fdIPQeoVZlhXB4Lg0F4kiJtxS87kmNXG+XjUDN4Wxq
 2PcjBnL4WbctbyuNKvga5ZDottxOFUDXWlGwtpGEi7FHezVAnAZcHYi2l
 NA+fD3BPfqKzoS5uumCvWJnTKCA9bpI/P2Txy9nM3UJB5MbqbxRKhp1vS
 XoT2MWW3VYymwARnTbED5tjjq77NWLmDQrHFLrS5OwOD2bK3Su9pqqiAF
 NnICrAfqYEb44vmU9UTrklObEzSM1VYAbNOHne0c8tM6MRhQryFNCP3hv
 P/hip7Mbnu4WScf5gdaQijY9GQk5nstDZZE5bg/fC2Uh0AJW6i71vfoNe A==;
X-CSE-ConnectionGUID: DYiL3gQvQ0e8A6ltUNiuhg==
X-CSE-MsgGUID: se1qASzGQEeAey1am3UWjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598747"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:22 -0700
X-CSE-ConnectionGUID: Uv+Z43fmSX++kxvXNCy3pA==
X-CSE-MsgGUID: enTnRAVMQ8ufn9/Tnwd5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861354"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:20 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/21] kernel: export ptrace_may_access
Date: Fri, 26 Jul 2024 17:08:01 +0300
Message-Id: <20240726140818.54304-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

We need to export ptrace_may_access to be able to
allow debugger connection to check for debuggee access and
at the same time allow xe.ko module build.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: Andi Shyti <andi.shyti@intel.com>
CC: Maciej Patelczyk <maciej.patelczyk@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

