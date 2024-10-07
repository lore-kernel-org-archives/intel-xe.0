Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC732CFB441
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 13:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDC110E066;
	Mon,  7 Oct 2024 13:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ft9NAQrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0B310E066
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728308299; x=1759844299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X7oA+MDu2bmd/Puwg9O/dCqdVYU5WiAvqKxqJ8sPb5c=;
 b=ft9NAQrGkWBHgML3CYRdiUFVdOSp67ypQBhYb3q8A2IMge1m4tLJACdf
 0oyUNZCvbYzYjLpSIxDKphLnggjSIjcl0mXGAvzEEJsskFpFhxHN+j+X+
 IxnjJ8LLosS3KLH3YWQedo2bjPrUeH9kT0sqXO5JWll45sa1MsE5QUnL0
 40DYlt5LYwSNd3y2grPXA7Kzw990VGQ8tPtmbrYRaqe5wiCy2WGetr3/Z
 vmqoPvEnmBz1fEjjU6w+v3qBv0+/nqxCaRlO1ei5wA81aFt/ShrYNS8fc
 68ZWwXZ8G3ZBqwv3zn/nW2x1uasIAHwGFePz5I5r2rm7TqrXv4HyhoCTT g==;
X-CSE-ConnectionGUID: aHnh1u35RIOuH7KvrRr1lA==
X-CSE-MsgGUID: WXGQwSSYTl6s5t5Y/xS9FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27625723"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27625723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 06:38:19 -0700
X-CSE-ConnectionGUID: KsMkCZ6+TduqkIifLRS3ZQ==
X-CSE-MsgGUID: ObF6RTi0T8mAY8A2zePgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="98791879"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 06:38:16 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 rui.zhang@intel.com, jani.saarinen@intel.com,
 srinivas.pandruvada@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
Date: Mon,  7 Oct 2024 19:22:42 +0530
Message-Id: <20241007135242.3028131-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Zhang Rui <rui.zhang@intel.com>

This is a core-for-CI patch for
https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/

According to Intel SDM, for the local APIC timer,
1. "The initial-count register is a read-write register. A write of 0 to
   the initial-count register effectively stops the local APIC timer, in
   both one-shot and periodic mode."
2. "In TSC deadline mode, writes to the initial-count register are
   ignored; and current-count register always reads 0. Instead, timer
   behavior is controlled using the IA32_TSC_DEADLINE MSR."
   "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarms
   the local-APIC timer."

Current code in lapic_timer_shutdown() writes 0 to the initial-count
register. This stops the local APIC timer for one-shot and periodic mode
only. In TSC deadline mode, the timer is not properly stopped.

Some CPUs are affected by this and they are woke up by the armed timer
in s2idle in TSC deadline mode.

Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0 to
MSR_IA32_TSC_DEADLINE.

Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when available")
Link: https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

---
 arch/x86/kernel/apic/apic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 6513c53c9459..d1006531729a 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct clock_event_device *evt)
 	v |= (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
 	apic_write(APIC_LVTT, v);
 	apic_write(APIC_TMICT, 0);
+
+	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
+		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
+
 	return 0;
 }
 
-- 
2.25.1

