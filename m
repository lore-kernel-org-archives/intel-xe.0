Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53026C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 17:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193BB10E785;
	Wed, 13 Aug 2025 17:09:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA2E10E77E;
 Wed, 13 Aug 2025 17:09:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_perf=3A_Rework_event=5Fin?=
 =?utf-8?q?it_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Robin Murphy" <robin.murphy@arm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 17:09:05 -0000
Message-ID: <175510494544.234050.7412345103074524033@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1755096883.git.robin.murphy@arm.com>
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: perf: Rework event_init checks
URL   : https://patchwork.freedesktop.org/series/152905/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 201dab03ecbb775fefedeeb4ed1ebda1f60ae05e
Author: Robin Murphy <robin.murphy@arm.com>
Date:   Wed Aug 13 18:01:11 2025 +0100

    perf: Garbage-collect event_init checks
    
    All these boilerplate event_init checks are now redundant. Of course
    many of them were already redundant, or done in the wrong order so as to
    be pointless, and what we don't see here is all the ones which were
    missing, but have now been implicitly gained thanks to some of these new
    core code behaviours. In summary:
    
    - event->attr.type
            Now only relevant to PERF_TYPE_RAW PMUs or those advertising
            PERF_PMU_CAP_RAW_EVENTS.
    
    - event->cpu < 0
            Already rejected by perf_event_alloc() unless a task is passed,
            wherein that will also set PERF_ATTACH_TASK prior to reaching
            perf_init_event(), so is always redundant with...
    
    - PERF_ATTACH_TASK
            Since at least commit bd2756811766 ("perf: Rewrite core context
            handling"), only relevant to PMUs using perf_hw_context or
            perf_sw_context; for uncore PMUs this is covered by
            perf_event_alloc() again, right after perf_init_event() returns,
            by virtue of the same non-NULL task which caused attach_state to
            be set in the first place.
    
    - is_sampling_event() (and variations)
            Now only relevant to PMUs advertising PERF_PMU_CAP_SAMPLING.
    
    - has_branch_stack()
            Now doubly-illogical for PMUs which never supported sampling
            anyway.
    
    Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+ /mt/dim checkpatch b6d374ca303d7b9f6456bc6db0cfe6e4d30bf472 drm-intel
f2510528d114 perf/arm-cmn: Fix event validation
a8b32cbc44fb perf/hisilicon: Fix group validation
46c68a589f98 perf/imx8_ddr: Fix group validation
00b38ea06851 perf/starfive: Fix group validation
059c36130466 iommu/vt-d: Fix perfmon group validation
b0a3f6c5c0c7 ARM: l2x0: Fix group validation
468d1a0405e3 ARM: imx: Fix MMDC PMU group validation
3bc63977115b perf/arm_smmu_v3: Improve group validation
3e9ca1d977ac perf/qcom: Improve group validation
-:74: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'event->group_leader->pmu == event->pmu'
#74: FILE: drivers/perf/qcom_l2_pmu.c:497:
+	if ((event->group_leader->pmu == event->pmu) &&
 	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
 	     L2_EVT_GROUP(event->attr.config))) {

-:84: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'sibling->pmu == event->pmu'
#84: FILE: drivers/perf/qcom_l2_pmu.c:508:
+		if ((sibling->pmu == event->pmu) &&
 		    (L2_EVT_GROUP(sibling->attr.config) ==
 		     L2_EVT_GROUP(event->attr.config))) {

total: 0 errors, 0 warnings, 2 checks, 101 lines checked
73ed423dfebe perf/arm-ni: Improve event validation
fc684823da8b perf/arm-cci: Tidy up event validation
a8ce748ce2b0 perf: Ignore event state for group validation
a84d3f1d9bec perf: Add helper for checking grouped events
20d0bcc872bb perf: Clean up redundant group validation
dd6dae6fc884 perf: Simplify group validation
b96da25d1084 perf: Introduce positive capability for sampling
a6cea8900044 perf: Retire PERF_PMU_CAP_NO_INTERRUPT
e3388d0671f5 perf: Introduce positive capability for raw events
201dab03ecbb perf: Garbage-collect event_init checks


