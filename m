Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF25C982D9
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84B10F28F;
	Fri, 18 Sep 2026 10:12:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7510F28F;
 Fri, 18 Sep 2026 10:12:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_KUnit_test_for_VF_provisi?=
 =?utf-8?q?oning_error_handling_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 10:12:48 -0000
Message-ID: <178972636802.181279.4965513026548773805@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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

Series: KUnit test for VF provisioning error handling (rev9)
URL   : https://patchwork.freedesktop.org/series/170198/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 928bd7cfd802d1c8f5100719cd3239bd31967b84
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Fri Sep 18 15:35:34 2026 +0530

    drm/xe/tests: Add KUnit tests for VF provisioning error handling
    
    VF relies on the PF to provide a valid hardware configuration via GuC
    KLV responses. In the unlikely event of PF malfunction or
    misconfiguration, a VF may receive incomplete, zero, or out-of-range
    values for its submission contexts, doorbells, VRAM or GGTT assignment.
    
    Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
    bad KLV responses and verify that VF can survive without crashing for
    the invalid configuration data received.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 15f7465765dc45d58738fc05a1c11a785e709c05 drm-intel
cf19c07694b3 drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
01fde98216d6 drm/xe/vf: Split submission config query helpers
f60c9ee757a6 drm/xe/vf: Add bounds checking for queried context and doorbell counts
b5f790f453fd drm/xe: Introduce helpers for VRAM alignment
98aef6ac7fd4 drm/xe/ggtt: Avoid integer overflow when validating VF GGTT range
6d65e9ec2a23 drm/xe/vf: Add bounds checking for queried GGTT base and size
94ff9dc69c99 drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
6386cd373ab4 drm/xe/vf: Add alignment check for queried VRAM size
b73ad23ffe7f drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
928bd7cfd802 drm/xe/tests: Add KUnit tests for VF provisioning error handling
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 673 lines checked


