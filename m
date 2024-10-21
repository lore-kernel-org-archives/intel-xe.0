Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A285D0E6D9
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D301210E472;
	Mon, 21 Oct 2024 09:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRVM4bs1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C910E472
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504750; x=1761040750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rUzyA3P4vP0uX+BpZXtAn2TK5cH1yOHoe+GT7tEPTbg=;
 b=JRVM4bs1aR30Y1SnSOWIKbb+vu2fUvMeCdsd69xLHF4y2S8nrnljlDhN
 0G8lVUJJJKGwMclICOyMXlBFAlE9Px13JRo5HktztA/nt4bogZEKYESKa
 tlH+vXSz+ylbfaqs/N8ekgA0cbHiZCekGvrEjJBXwwHiRGEDRrXoEyMXS
 0D8sWsTs2MEnx2bKun73CgdtPjtzrxgK3ogi3mOu62DRgkGT6QaWgnI6I
 caYJNc7/UfCD/+ggonhG5MA47gm1AGUdMxGk/UTmSGTDWCZLmqZ0VwAqE
 7m3oHfphHFmglXIyNE4KCbspFp26Jp1qsdfIg9kailGJpJAnsu22+KKmN A==;
X-CSE-ConnectionGUID: obNBJh1uTUebkhudUAFNbA==
X-CSE-MsgGUID: VKPqzmgUTuC+4nfvJobAqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350741"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:10 -0700
X-CSE-ConnectionGUID: wBrHVExRR0S21/xJp7naNA==
X-CSE-MsgGUID: Heg5579NS3aPvS0ncASQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84545985"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:07 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 01/19] ptrace: export ptrace_may_access
Date: Mon, 21 Oct 2024 12:58:40 +0300
Message-ID: <20241021095904.439555-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

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
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
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
2.46.1

