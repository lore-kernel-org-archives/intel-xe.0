Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C0FCDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DD310E224;
	Mon, 16 Oct 2023 15:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2078710E224
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697470713; x=1729006713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VVjrrLlBce4TWw5xa5zuTtoA2FdF9YBJq50jTXrudY=;
 b=nDr6TJ9eXnGT1JMTIsRXLnhFQsnipTW0VfmKjsHqtH5GtGWxp50s9LG/
 DJxwNHz9ZnV+VxNfi696W5oML0RpHQS9y1pOb3EQH75P7ZTE08MKxldBc
 FH484BKq/XI9ar0la/4vM9evdwSbdI5bA/FoHjc2qmerN+L/R9sF0KHDC
 rcYKX0JzeVdP2P9HXteTjvlVhwvVrP6gN+1YlqRsvzQ7juBoe4IhalElD
 gCebsw8dOm63F4oVuw6n+Y74NNh1QOcmbSrJJzU7kvitUDFgKb5MUnZc1
 74jrLBwo647nyQmbF0sPcPYBuSUA3ttYOhoVhuHNa/qG7BR9qING47Hgh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382777125"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="382777125"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732333620"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="732333620"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:38:32 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 08:40:24 -0700
Message-Id: <20231016154025.3358622-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016154025.3358622-1-fei.yang@intel.com>
References: <20231016154025.3358622-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] x86/alternatives: Disable KASAN in
 apply_alternatives()
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
Cc: Peter Zijlstra <peterz@infradead.org>, lucas.demarchi@intel.com,
 stable@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Fei has reported that KASAN triggers during apply_alternatives() on
a 5-level paging machine:

	BUG: KASAN: out-of-bounds in rcu_is_watching()
	Read of size 4 at addr ff110003ee6419a0 by task swapper/0/0
	...
	__asan_load4()
	rcu_is_watching()
	trace_hardirqs_on()
	text_poke_early()
	apply_alternatives()
	...

On machines with 5-level paging, cpu_feature_enabled(X86_FEATURE_LA57)
gets patched. It includes KASAN code, where KASAN_SHADOW_START depends on
__VIRTUAL_MASK_SHIFT, which is defined with cpu_feature_enabled().

KASAN gets confused when apply_alternatives() patches the
KASAN_SHADOW_START users. A test patch that makes KASAN_SHADOW_START
static, by replacing __VIRTUAL_MASK_SHIFT with 56, works around the issue.

Fix it for real by disabling KASAN while the kernel is patching alternatives.

[ mingo: updated the changelog ]

Fixes: 6657fca06e3f ("x86/mm: Allow to boot without LA57 if CONFIG_X86_5LEVEL=y")
Reported-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20231012100424.1456-1-kirill.shutemov@linux.intel.com
(cherry picked from commit d35652a5fc9944784f6f50a5c979518ff8dacf61)
---
 arch/x86/kernel/alternative.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 517ee01503be..73be3931e4f0 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -403,6 +403,17 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 	u8 insn_buff[MAX_PATCH_LEN];
 
 	DPRINTK(ALT, "alt table %px, -> %px", start, end);
+
+	/*
+	 * In the case CONFIG_X86_5LEVEL=y, KASAN_SHADOW_START is defined using
+	 * cpu_feature_enabled(X86_FEATURE_LA57) and is therefore patched here.
+	 * During the process, KASAN becomes confused seeing partial LA57
+	 * conversion and triggers a false-positive out-of-bound report.
+	 *
+	 * Disable KASAN until the patching is complete.
+	 */
+	kasan_disable_current();
+
 	/*
 	 * The scan order should be from start to end. A later scanned
 	 * alternative code can overwrite previously scanned alternative code.
@@ -452,6 +463,8 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 		text_poke_early(instr, insn_buff, insn_buff_sz);
 	}
+
+	kasan_enable_current();
 }
 
 static inline bool is_jcc32(struct insn *insn)
-- 
2.25.1

