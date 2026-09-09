Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2177C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C8910E1D9;
	Wed,  9 Sep 2026 15:30:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41D10E1D9;
 Wed,  9 Sep 2026 15:30:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4958264600299237314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/display=3A_Enable?=
 =?utf-8?q?_AS_SDP_Skip_Frames_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 15:30:42 -0000
Message-ID: <178896784228.143075.17546843683046382405@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909080810.2202879-1-uma.shankar@intel.com>
In-Reply-To: <20260909080810.2202879-1-uma.shankar@intel.com>
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

--===============4958264600299237314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Enable AS SDP Skip Frames (rev6)
URL   : https://patchwork.freedesktop.org/series/162015/
State : failure

== Summary ==

CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_FULL -> xe-pw-162015v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162015v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162015v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162015v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-bmg:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-lnl:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@xe_mempage_offline@inject-single-page.html

  
#### Warnings ####

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          [SKIP][3] ([Intel XE#4417] / [Intel XE#5447]) -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  
New tests
---------

  New tests have been introduced between xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_FULL and xe-pw-162015v6_FULL:

### New IGT tests (213) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [28.94] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [28.86] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [28.98] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [28.94] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.85] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_pm_backlight@bad-brightness:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@kms_pm_backlight@bad-brightness@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_pm_backlight@basic-brightness:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_pm_backlight@fade:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.16] s

  * igt@kms_pm_backlight@fade-with-dpms:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_backlight@fade-with-suspend:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.10] s

  * igt@kms_pm_backlight@fade-with-suspend@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.11] s

  * igt@kms_pm_backlight@fade@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.12] s

  * igt@kms_pm_dc@dc5-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_pm_dc@dc5-dpms-negative:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 3.28] s

  * igt@kms_pm_dc@dc5-psr:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.01, 0.69] s

  * igt@kms_pm_dc@dc6-dpms:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 2.15] s

  * igt@kms_pm_dc@dc6-psr:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_pm_dc@dc9-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_pm_lpsp@kms-lpsp:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 0.58] s

  * igt@xe_exec_system_allocator@many-64k-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.93, 1.07] s

  * igt@xe_exec_system_allocator@many-64k-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 1.02] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 1.00] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.28] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 0.76] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.12, 1.49] s

  * igt@xe_exec_system_allocator@many-64k-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 1.11] s

  * igt@xe_exec_system_allocator@many-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 1.26] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.83, 1.24] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 1.27] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.40] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 0.87] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.56, 1.71] s

  * igt@xe_exec_system_allocator@many-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.90, 1.45] s

  * igt@xe_exec_system_allocator@many-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.71] s

  * igt@xe_exec_system_allocator@many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 3.45] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.87, 3.02] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.52, 2.56] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 2.54] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 1.92] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.94, 3.25] s

  * igt@xe_exec_system_allocator@many-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.75, 3.20] s

  * igt@xe_exec_system_allocator@many-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 2.34] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.72, 2.87] s

  * igt@xe_exec_system_allocator@many-large-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.40] s

  * igt@xe_exec_system_allocator@many-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.49] s

  * igt@xe_exec_system_allocator@many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 2.16] s

  * igt@xe_exec_system_allocator@many-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [2.00, 3.09] s

  * igt@xe_exec_system_allocator@many-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.88] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@xe_exec_system_allocator@many-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 1.14] s

  * igt@xe_exec_system_allocator@many-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.66] s

  * igt@xe_exec_system_allocator@many-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.52] s

  * igt@xe_exec_system_allocator@many-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 1.14] s

  * igt@xe_exec_system_allocator@many-stride-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [3.38, 4.89] s

  * igt@xe_exec_system_allocator@many-stride-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 1.35] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 4.38] s

  * igt@xe_exec_system_allocator@many-stride-mmap-free-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@xe_exec_system_allocator@many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [4.76, 5.47] s

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 2.14] s

  * igt@xe_exec_system_allocator@many-stride-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [3.67, 4.82] s

  * igt@xe_exec_system_allocator@once-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_system_allocator@once-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_system_allocator@once-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.12] s

  * igt@xe_exec_system_allocator@once-large-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_system_allocator@once-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@xe_exec_system_allocator@once-large-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_system_allocator@once-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_exec_system_allocator@once-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@xe_exec_system_allocator@once-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@xe_exec_system_allocator@once-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@xe_exec_system_allocator@once-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_system_allocator@once-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@xe_exec_system_allocator@process-many-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.36] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.32] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.54] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.28] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.32] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.39] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.45] s

  * igt@xe_exec_system_allocator@process-many-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.33] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 1.10] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.62] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.63] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.62] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.84] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 1.11] s

  * igt@xe_exec_system_allocator@process-many-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 1.06] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.67] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.62] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.70] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.62] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.74] s

  * igt@xe_exec_system_allocator@process-many-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 1.13] s

  * igt@xe_exec_system_allocator@process-many-malloc-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.50] s

  * igt@xe_exec_system_allocator@process-many-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.26] s

  * igt@xe_exec_system_allocator@process-many-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.31] s

  * igt@xe_exec_system_allocator@process-many-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.37] s

  * igt@xe_exec_system_allocator@process-many-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.36] s

  * igt@xe_exec_system_allocator@process-many-stride-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 1.06] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.46] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 2.42] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.06, 1.22] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.16, 1.25] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.97] s

  * igt@xe_exec_system_allocator@process-many-stride-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 1.02] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.32] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.92] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.54] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.33] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.47] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@xe_exec_system_allocator@threads-many-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.69] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.97] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.79] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 2.64] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.60] s

  * igt@xe_exec_system_allocator@threads-many-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 1.64] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.77] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.88] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.65] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.66] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 2.24] s

  * igt@xe_exec_system_allocator@threads-many-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 1.46] s

  * igt@xe_exec_system_allocator@threads-many-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.29] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.51] s

  * igt@xe_exec_system_allocator@threads-many-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.34] s

  * igt@xe_exec_system_allocator@threads-many-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.31] s

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.46] s

  * igt@xe_exec_system_allocator@threads-many-new-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@xe_exec_system_allocator@threads-many-stride-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.53] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.44] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 3.46] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.10, 1.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.05, 1.25] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 1.67] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.91] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.44] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.93] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.49] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.43] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.46] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.37] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.57] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.97] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 5.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.74] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 1.76] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 1.59] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.61] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 1.03] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 5.29] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.69] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 1.48] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.34] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.90] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.52] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.36] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.53] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.38] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.06, 1.74] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.63] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 5.02] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.24] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.28] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 1.57] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.72] s

  * igt@xe_exec_system_allocator@twice-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_exec_system_allocator@twice-large-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_system_allocator@twice-large-malloc-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@xe_exec_system_allocator@twice-large-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@xe_exec_system_allocator@twice-large-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.16] s

  * igt@xe_exec_system_allocator@twice-large-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_system_allocator@twice-malloc-madvise:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_system_allocator@twice-mmap-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_system_allocator@twice-mmap-remap-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_system_allocator@twice-new-madvise:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  

Known issues
------------

  Here are the changes found in xe-pw-162015v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-lnl:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@fbdev@eof.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#8583])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2233])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_interruptible@legacy-setmode:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#9125]) +11 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_atomic_interruptible@legacy-setmode.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +26 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3297])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color@ctm-0-25.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#7006])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6969]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6974])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7642]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309] / [Intel XE#7343])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4210] / [Intel XE#7467])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4354] / [Intel XE#7386])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#9009])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4331] / [Intel XE#7227])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8265]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#8265])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4422] / [Intel XE#7442])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [PASS][44] -> [SKIP][45] ([Intel XE#9127])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_fbcon_fbt@fbc.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1138] / [Intel XE#7344])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2374] / [Intel XE#6127])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#9132])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][51] ([Intel XE#301]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [PASS][52] -> [SKIP][53] ([Intel XE#2482]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2482])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          [PASS][57] -> [SKIP][58] ([Intel XE#1745] / [Intel XE#9144])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7179])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7905]) +19 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7061])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7061]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4141]) +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#656] / [Intel XE#7905]) +13 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1469] / [Intel XE#7399]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +52 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6312]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7779]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2313]) +54 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [PASS][74] -> [SKIP][75] ([Intel XE#7779]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#2548] / [Intel XE#7779]) +15 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7865]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [PASS][79] -> [SKIP][80] ([Intel XE#2568])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4298] / [Intel XE#5873])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6911] / [Intel XE#7466])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#6900] / [Intel XE#7362])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8348])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7283]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7283]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#8303]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#9128])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#9128])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#599] / [Intel XE#7382]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#5020] / [Intel XE#7348])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#5020] / [Intel XE#7348])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][94] -> [SKIP][95] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plane_scaling@invalid-num-scalers.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [PASS][96] -> [SKIP][97] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - shard-lnl:          [PASS][99] -> [SKIP][100] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [PASS][101] -> [SKIP][102] ([Intel XE#7760])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms (NEW):
    - shard-lnl:          [PASS][104] -> [SKIP][105] ([Intel XE#870])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_pm_backlight@fade-with-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#3309] / [Intel XE#7368])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr (NEW):
    - shard-lnl:          [PASS][107] -> [SKIP][108] ([Intel XE#7794])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [PASS][109] -> [SKIP][110] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [PASS][111] -> [SKIP][112] ([Intel XE#1439] / [Intel XE#836])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#6813])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#6814] / [Intel XE#7428])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-lnl:          [PASS][115] -> [SKIP][116] ([Intel XE#7106])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_rpm@system-suspend-idle.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608] / [Intel XE#7304]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4608]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1489]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [PASS][122] -> [SKIP][123] ([Intel XE#1489])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1128] / [Intel XE#7413])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2387] / [Intel XE#7429])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406] / [Intel XE#7345])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr2-basic:
    - shard-lnl:          [PASS][129] -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_psr@psr2-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2234])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#3904] / [Intel XE#7342])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#6503]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2426] / [Intel XE#5848])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#330] / [Intel XE#5857])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][138] -> [SKIP][139] ([Intel XE#9125]) +36 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_vrr@flip-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1499]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1499])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#6599])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8370])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#7482]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1392]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#8374]) +13 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#8374]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#8364]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8364]) +26 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#8369]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#6196])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#9096])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-hang-basic:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#8378]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-hang-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#8378]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#6964]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#6964]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#7793])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#7793])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2236] / [Intel XE#7590])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#584] / [Intel XE#7369])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4733] / [Intel XE#7417])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#944]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4130] / [Intel XE#7366])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#3342])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          NOTRUN -> [FAIL][173] ([Intel XE#6569])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][174] ([Intel XE#8963])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-lnl:          [SKIP][175] ([Intel XE#2134]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@fbdev@nullptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@fbdev@nullptr.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][177] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color@deep-color.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          [SKIP][179] ([Intel XE#7006]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-lnl:          [SKIP][181] ([Intel XE#2482]) -> [PASS][182] +5 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip@absolute-wf_vblank.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [SKIP][183] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][185] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][186] +18 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][187] ([Intel XE#7779]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][189] ([Intel XE#1503]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][191] ([Intel XE#2568]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [SKIP][193] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [SKIP][195] ([Intel XE#7780] / [Intel XE#9125]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-lnl:          [SKIP][197] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][198] +9 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [SKIP][199] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][200] +9 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend (NEW):
    - shard-lnl:          [SKIP][201] ([Intel XE#870]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [FAIL][203] ([Intel XE#8399]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-psr (NEW):
    - shard-lnl:          [SKIP][205] ([Intel XE#7794]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [SKIP][207] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [SKIP][209] ([Intel XE#4886]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-lnl:          [SKIP][211] ([Intel XE#9126]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [SKIP][213] ([Intel XE#9129]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][215] ([Intel XE#1489]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][217] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][218] +5 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [SKIP][219] ([Intel XE#9125]) -> [PASS][220] +40 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vrr@flipline.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [ABORT][221] ([Intel XE#8007]) -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@xe_configfs@gt-types-allowed.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_configfs@gt-types-allowed.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [FAIL][223] ([Intel XE#7992]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][225] ([Intel XE#1407]) -> [SKIP][226] ([Intel XE#9125]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][227] ([Intel XE#9125]) -> [SKIP][228] ([Intel XE#3658] / [Intel XE#7360]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][229] ([Intel XE#9125]) -> [SKIP][230] ([Intel XE#1407]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#9125]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][233] ([Intel XE#9125]) -> [SKIP][234] ([Intel XE#1467] / [Intel XE#7367])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][235] ([Intel XE#1477] / [Intel XE#7361]) -> [SKIP][236] ([Intel XE#9125])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][237] ([Intel XE#9125]) -> [SKIP][238] ([Intel XE#1124]) +7 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][239] ([Intel XE#7679]) -> [SKIP][240] ([Intel XE#9125]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][241] ([Intel XE#9125]) -> [SKIP][242] ([Intel XE#8365]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][243] ([Intel XE#9125]) -> [SKIP][244] ([Intel XE#367])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][245] ([Intel XE#8365]) -> [SKIP][246] ([Intel XE#9125]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][247] ([Intel XE#2669] / [Intel XE#3433] / [Intel XE#7389]) -> [SKIP][248] ([Intel XE#9125])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][249] ([Intel XE#3432]) -> [SKIP][250] ([Intel XE#9125])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> [SKIP][252] ([Intel XE#3432]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][253] ([Intel XE#2887]) -> [SKIP][254] ([Intel XE#9125]) +15 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][255] ([Intel XE#9125]) -> [SKIP][256] ([Intel XE#2887]) +12 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][257] ([Intel XE#7008]) -> [SKIP][258] ([Intel XE#9125])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][259] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][260] ([Intel XE#7006])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][261] ([Intel XE#1468] / [Intel XE#7396]) -> [SKIP][262] ([Intel XE#9125])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_content_protection@mei-interface.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][263] ([Intel XE#7642]) -> [SKIP][264] ([Intel XE#9125]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_content_protection@srm.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][265] ([Intel XE#9125]) -> [SKIP][266] ([Intel XE#7642]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_content_protection@uevent.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          [SKIP][267] ([Intel XE#9125]) -> [SKIP][268] ([Intel XE#1424]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][269] ([Intel XE#9125]) -> [SKIP][270] ([Intel XE#2321] / [Intel XE#7355])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          [SKIP][271] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][272] ([Intel XE#9125])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x512.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][273] ([Intel XE#1424]) -> [SKIP][274] ([Intel XE#9125]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][275] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][276] ([Intel XE#9125]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][277] ([Intel XE#9125]) -> [SKIP][278] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][279] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][280] ([Intel XE#9125])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][281] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][282] ([Intel XE#9125])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][283] ([Intel XE#9125]) -> [SKIP][284] ([Intel XE#323] / [Intel XE#6035])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][285] ([Intel XE#1508]) -> [SKIP][286] ([Intel XE#9125])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-lnl:          [SKIP][287] ([Intel XE#9125]) -> [SKIP][288] ([Intel XE#8265]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-lnl:          [SKIP][289] ([Intel XE#8265]) -> [SKIP][290] ([Intel XE#9125]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          [SKIP][291] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][292] ([Intel XE#9125])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][293] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][294] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][295] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][296] ([Intel XE#1745] / [Intel XE#9144])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][297] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][298] ([Intel XE#7779]) +5 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][299] ([Intel XE#6312]) -> [SKIP][300] ([Intel XE#7779]) +12 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][301] ([Intel XE#7061]) -> [SKIP][302] ([Intel XE#7779]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][303] ([Intel XE#7779]) -> [SKIP][304] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][305] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][306] ([Intel XE#2548] / [Intel XE#7779]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][307] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][308] ([Intel XE#656] / [Intel XE#7905]) +33 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][309] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][310] ([Intel XE#6312] / [Intel XE#651]) +9 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          [SKIP][311] ([Intel XE#7779]) -> [SKIP][312] ([Intel XE#6312]) +15 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][313] ([Intel XE#7399]) -> [SKIP][314] ([Intel XE#7779])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][315] ([Intel XE#7905]) -> [SKIP][316] ([Intel XE#7779]) +38 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][317] ([Intel XE#7779]) -> [SKIP][318] ([Intel XE#7865]) +29 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][319] ([Intel XE#7865]) -> [SKIP][320] ([Intel XE#7779]) +24 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][321] ([Intel XE#7779]) -> [SKIP][322] ([Intel XE#7905]) +33 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][323] ([Intel XE#7779]) -> [SKIP][324] ([Intel XE#7061]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][325] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][326] ([Intel XE#2548] / [Intel XE#7779]) +28 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][327] ([Intel XE#9125]) -> [SKIP][328] ([Intel XE#3374] / [Intel XE#3544])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [SKIP][329] ([Intel XE#3544]) -> [SKIP][330] ([Intel XE#3374] / [Intel XE#3544])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][331] ([Intel XE#1503]) -> [SKIP][332] ([Intel XE#9125])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_hdr@static-toggle.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][333] ([Intel XE#9125]) -> [SKIP][334] ([Intel XE#1503])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][335] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][336] ([Intel XE#9125])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][337] ([Intel XE#9125]) -> [SKIP][338] ([Intel XE#599] / [Intel XE#7382])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][339] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][340] ([Intel XE#9125])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][341] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][342] ([Intel XE#9125])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][343] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][344] ([Intel XE#309] / [Intel XE#7343])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][345] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][346] ([Intel XE#3307])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][347] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][348] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][349] ([Intel XE#1489]) -> [SKIP][350] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][351] ([Intel XE#1489]) -> [SKIP][352] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][353] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][354] ([Intel XE#1489]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][355] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][356] ([Intel XE#1489]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          [SKIP][357] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][358] ([Intel XE#1128] / [Intel XE#7413])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          [SKIP][359] ([Intel XE#1406]) -> [SKIP][360] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          [SKIP][361] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][362] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr@fbc-psr2-basic.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [SKIP][363] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][364] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][365] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][366] ([Intel XE#1406]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          [SKIP][367] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][368] ([Intel XE#9125]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_rotation_crc@bad-pixel-format.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][369] ([Intel XE#9125]) -> [SKIP][370] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][371] ([Intel XE#9125]) -> [SKIP][372] ([Intel XE#1127] / [Intel XE#5813])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          [SKIP][373] ([Intel XE#1499]) -> [SKIP][374] ([Intel XE#9125])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          [ABORT][375] ([Intel XE#8007] / [Intel XE#8868]) -> [ABORT][376] ([Intel XE#8868])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][377] ([Intel XE#9145]) -> [DMESG-WARN][378] ([Intel XE#9130])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_exec_reset@gt-reset-fault-injection.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [DMESG-WARN][379] ([Intel XE#9130]) -> [ABORT][380] ([Intel XE#9140] / [Intel XE#9145])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [DMESG-WARN][381] ([Intel XE#8963]) -> [ABORT][382] ([Intel XE#8963])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@xe_wedged@basic-wedged.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9086 -> IGT_9088
  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-pw-162015v6

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-pw-162015v6: 162015v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/index.html

--===============4958264600299237314==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/display: Enable AS SDP Skip Frames (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162015/">https://patchwork.freedesktop.org/series/162015/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_FULL -&gt; xe-pw-162015v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162015v6_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162015v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162015v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@xe_mempage_offline@inject-single-page.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cdclk@mode-transition@pipe-b-edp-1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_FULL and xe-pw-162015v6_FULL:</p>
<h3>New IGT tests (213)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.93, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.12, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.83, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.56, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.90, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.07, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.87, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.52, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.53, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.94, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.75, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.72, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.00, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.38, 4.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.76, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.67, 4.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.06, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.10, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.05, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 5.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.06, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 5.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.01, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-madvise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-madvise:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162015v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_atomic_interruptible@legacy-setmode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_backlight@brightness-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_psr@psr2-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-hang-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_invalid_mode@bad-vtotal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126">Intel XE#9126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_properties@colorop-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_vrr@flipline.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@xe_configfs@gt-types-allowed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-4/igt@xe_configfs@gt-types-allowed.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-1/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-1/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-10/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162015v6/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9086 -&gt; IGT_9088</li>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-pw-162015v6</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada<br />
  xe-pw-162015v6: 162015v6</p>

</body>
</html>

--===============4958264600299237314==--
