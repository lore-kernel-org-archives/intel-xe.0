Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82ACCCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 06:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785110E040;
	Mon, 13 Oct 2025 06:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adBQE/jB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22E910E040;
 Mon, 13 Oct 2025 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760335948; x=1791871948;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Hc7Co0ahPVWB7YJIM5Gv4QcyPJkQqUbGdvywN6VX7s=;
 b=adBQE/jB2PnXg/v1t+QI0o9zLwvGV73C8cZZ88pONtp0ouaSUY98VdUu
 reaGyHv04UAit8teKovv6DQhQO9xhZDrfICAmPEMgoPKNSLCiFWDUKMs9
 tSSNdf+lGjgQVcfguwq6xyJvIGOX2GDb/8W2b+QHjFMURHsoDBuhxOjo0
 JxgRaTrk8oelnQwJn4bF9nGsFnpPAEBTaoq0dzLpX109QkKPgxjesjjBm
 vHJ17Mt2tZW3MAYjXyo1ZVo2+gRcYL2dxKt9sSNMU8zU0rjeyWllNNbrm
 y/TpS8y7z9zOlZqLOBQTFMSjA/A0BKxdK/dhDOtIHUEmLMrJCKUMNz7zA g==;
X-CSE-ConnectionGUID: t7lqClG3QLqZmcfPtXzcOg==
X-CSE-MsgGUID: nut2a4Y7T/6QZ8zoU8yG5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62170056"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62170056"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 23:12:28 -0700
X-CSE-ConnectionGUID: WWjwg0+4SuOIf7LzR7CRug==
X-CSE-MsgGUID: fpA293vSSCiGS8rN8cjO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181083406"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa009.jf.intel.com with ESMTP; 12 Oct 2025 23:12:27 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [core-for-CI] KVM: x86/pmu: Don't try to get perf capabilities for
 hybrid CPUs
Date: Mon, 13 Oct 2025 11:25:15 +0530
Message-Id: <20251013055515.4105002-1-chaitanya.kumar.borah@intel.com>
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Explicitly zero kvm_host_pmu instead of attempting to get the perf PMU
capabilities when running on a hybrid CPU to avoid running afoul of perf's
sanity check.

  ------------[ cut here ]------------
  WARNING: arch/x86/events/core.c:3089 at perf_get_x86_pmu_capability+0xd/0xc0,
  Call Trace:
   <TASK>
   kvm_x86_vendor_init+0x1b0/0x1a40 [kvm]
   vmx_init+0xdb/0x260 [kvm_intel]
   vt_init+0x12/0x9d0 [kvm_intel]
   do_one_initcall+0x60/0x3f0
   do_init_module+0x97/0x2b0
   load_module+0x2d08/0x2e30
   init_module_from_file+0x96/0xe0
   idempotent_init_module+0x117/0x330
   __x64_sys_finit_module+0x73/0xe0

Always read the capabilities for non-hybrid CPUs, i.e. don't entirely
revert to reading capabilities if and only if KVM wants to use a PMU, as
it may be useful to have the host PMU capabilities available, e.g. if only
or debug.

Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/all/70b64347-2aca-4511-af78-a767d5fa8226@intel.com/
Fixes: 51f34b1e650f ("KVM: x86/pmu: Snapshot host (i.e. perf's) reported PMU capabilities")
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://lore.kernel.org/r/20251010005239.146953-1-dapeng1.mi@linux.intel.com
[sean: rework changelog, call out hybrid CPUs in shortlog]
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15122
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 40ac4cb44ed2..487ad19a236e 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -108,16 +108,18 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
 
-	perf_get_x86_pmu_capability(&kvm_host_pmu);
-
 	/*
 	 * Hybrid PMUs don't play nice with virtualization without careful
 	 * configuration by userspace, and KVM's APIs for reporting supported
 	 * vPMU features do not account for hybrid PMUs.  Disable vPMU support
 	 * for hybrid PMUs until KVM gains a way to let userspace opt-in.
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU))
+	if (cpu_feature_enabled(X86_FEATURE_HYBRID_CPU)) {
 		enable_pmu = false;
+		memset(&kvm_host_pmu, 0, sizeof(kvm_host_pmu));
+	} else {
+		perf_get_x86_pmu_capability(&kvm_host_pmu);
+	}
 
 	if (enable_pmu) {
 		/*
-- 
2.25.1

