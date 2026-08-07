Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5008DC5AC67
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 02:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B364D10E30F;
	Fri,  7 Aug 2026 02:37:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30810E30F;
 Fri,  7 Aug 2026 02:37:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7063186281203242765=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Crescent_Island_PMT_suppor?=
 =?utf-8?q?t_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Aug 2026 02:37:47 -0000
Message-ID: <178607026709.27571.717077150103225611@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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

--===============7063186281203242765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev3)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_FULL -> xe-pw-160717v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [FAIL][2] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [ABORT][3] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html

  
New tests
---------

  New tests have been introduced between xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_FULL and xe-pw-160717v3_FULL:

### New IGT tests (199) ###

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.16] s

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 2.15] s

  * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@xe_exec_system_allocator@many-64k-free:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.16] s

  * igt@xe_exec_system_allocator@many-64k-free-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [1.13, 1.23] s

  * igt@xe_exec_system_allocator@many-64k-free-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 1.18] s

  * igt@xe_exec_system_allocator@many-64k-free-race-nomemset:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@xe_exec_system_allocator@many-64k-malloc:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 1.13] s

  * igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 1.12] s

  * igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 1.03] s

  * igt@xe_exec_system_allocator@many-64k-malloc-busy:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 1.37] s

  * igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 1.05] s

  * igt@xe_exec_system_allocator@many-64k-malloc-fork-read:
    - Statuses : 2 pass(s)
    - Exec time: [5.46, 8.89] s

  * igt@xe_exec_system_allocator@many-64k-malloc-fork-read-after:
    - Statuses : 2 pass(s)
    - Exec time: [8.21, 12.27] s

  * igt@xe_exec_system_allocator@many-64k-malloc-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 1.04] s

  * igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.95] s

  * igt@xe_exec_system_allocator@many-64k-malloc-multi-fault:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@xe_exec_system_allocator@many-64k-malloc-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.93] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.86] s

  * igt@xe_exec_system_allocator@many-64k-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.23] s

  * igt@xe_exec_system_allocator@many-64k-malloc-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.25] s

  * igt@xe_exec_system_allocator@many-64k-malloc-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.34] s

  * igt@xe_exec_system_allocator@many-64k-mmap:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.26] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.27] s

  * igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.28] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 1.27] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 2.52] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [1.13] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.87, 1.30] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-race:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.59] s

  * igt@xe_exec_system_allocator@many-64k-mmap-free-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 1.56] s

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.47] s

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.45] s

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.82] s

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 1.19] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.74] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - Statuses : 2 pass(s)
    - Exec time: [2.54, 2.58] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [1.86, 2.26] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.68] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.57] s

  * igt@xe_exec_system_allocator@many-64k-mmap-new-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.89] s

  * igt@xe_exec_system_allocator@many-64k-mmap-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 1.01] s

  * igt@xe_exec_system_allocator@many-64k-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.81] s

  * igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.26] s

  * igt@xe_exec_system_allocator@many-64k-mmap-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.24] s

  * igt@xe_exec_system_allocator@many-64k-mmap-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.38] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.31] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.24] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap-eocheck:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.27] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.35] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 1.37] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.23] s

  * igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.23] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.26] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 1.36] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.74] s

  * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-eocheck:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 1.19] s

  * igt@xe_exec_system_allocator@many-64k-new:
    - Statuses : 2 pass(s)
    - Exec time: [0.75, 1.22] s

  * igt@xe_exec_system_allocator@many-64k-new-bo-map:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 1.11] s

  * igt@xe_exec_system_allocator@many-64k-new-bo-map-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 1.07] s

  * igt@xe_exec_system_allocator@many-64k-new-busy:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.17] s

  * igt@xe_exec_system_allocator@many-64k-new-busy-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 1.17] s

  * igt@xe_exec_system_allocator@many-64k-new-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 1.16] s

  * igt@xe_exec_system_allocator@many-64k-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 1.03] s

  * igt@xe_exec_system_allocator@many-64k-new-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 1.06] s

  * igt@xe_exec_system_allocator@many-64k-new-race-nomemset:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.89] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 1.05] s

  * igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.42] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.93] s

  * igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.45] s

  * igt@xe_exec_system_allocator@many-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 1.67] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 2.84] s

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.37] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 2.82] s

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.40] s

  * igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 4.20] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 2.72] s

  * igt@xe_exec_system_allocator@many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.26] s

  * igt@xe_exec_system_allocator@many-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 2.67] s

  * igt@xe_exec_system_allocator@many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.32] s

  * igt@xe_exec_system_allocator@many-large-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 4.09] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.88] s

  * igt@xe_exec_system_allocator@many-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.23] s

  * igt@xe_exec_system_allocator@many-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.82] s

  * igt@xe_exec_system_allocator@many-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@xe_exec_system_allocator@many-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 1.55] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.36] s

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 2.08] s

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.35] s

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 8.00] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exec_system_allocator@once-large-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_system_allocator@once-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_system_allocator@once-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_system_allocator@once-large-new-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_system_allocator@once-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exec_system_allocator@once-mmap-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@once-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exec_system_allocator@once-new-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exec_system_allocator@prefetch-benchmark:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 85.82] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.22] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.30] s

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.25] s

  * igt@xe_exec_system_allocator@process-many-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.42] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.58] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.23] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.56] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.25] s

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.81] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.56] s

  * igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.59] s

  * igt@xe_exec_system_allocator@process-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.23] s

  * igt@xe_exec_system_allocator@process-many-large-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.89] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.25] s

  * igt@xe_exec_system_allocator@process-many-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.21] s

  * igt@xe_exec_system_allocator@process-many-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.24] s

  * igt@xe_exec_system_allocator@process-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.21] s

  * igt@xe_exec_system_allocator@process-many-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.39] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.45] s

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.56] s

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.19] s

  * igt@xe_exec_system_allocator@process-many-stride-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.37] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.25] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.67] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.86] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.21] s

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 1.84] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.82] s

  * igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.89] s

  * igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.20] s

  * igt@xe_exec_system_allocator@threads-many-large-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 1.82] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.25] s

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.23] s

  * igt@xe_exec_system_allocator@threads-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-new-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.79] s

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-race:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.72] s

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.18] s

  * igt@xe_exec_system_allocator@threads-many-stride-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 7.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 1.14] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.26] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 1.27] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 1.92] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 5.83] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.21] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 5.77] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-prefetch:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 5.31] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.16] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 3.70] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 3.78] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.98] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.76] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.18] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 1.68] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 5.10] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.20] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 3.52] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.22] s

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 8.01] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_exec_system_allocator@twice-large-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@xe_exec_system_allocator@twice-large-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@xe_exec_system_allocator@twice-malloc-prefetch-race:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.09] s

  * igt@xe_exec_system_allocator@twice-mmap-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@xe_exec_system_allocator@twice-mmap-prefetch-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@xe_exec_system_allocator@twice-new-prefetch:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  

Known issues
------------

  Here are the changes found in xe-pw-160717v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#3718] / [Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#6078])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-bmg:          [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#7774]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-2/igt@kms_cursor_crc@cursor-size-change.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#8265])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301] / [Intel XE#3149])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1489])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8370])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8374])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8364])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-priority-smem.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#7850])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][27] -> [ABORT][28] ([Intel XE#8007]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][29] ([Intel XE#7571]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][31] ([Intel XE#301]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][33] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_exec_reset@long-spin-many-preempt-media:
    - shard-bmg:          [FAIL][35] ([Intel XE#7956]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-media.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-media.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [ABORT][37] ([Intel XE#8007]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][39] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][40] ([Intel XE#301])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][41] ([Intel XE#301]) -> [FAIL][42] ([Intel XE#301] / [Intel XE#3149])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][43] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][44] ([Intel XE#1729] / [Intel XE#7424])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][45] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][46] ([Intel XE#2426] / [Intel XE#5848])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374


Build changes
-------------

  * Linux: xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343 -> xe-pw-160717v3

  IGT_9043: 9043
  xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343: 25ed4a41b6058c0622ccadb523aa009c55d1f343
  xe-pw-160717v3: 160717v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/index.html

--===============7063186281203242765==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_FULL -&gt; xe-pw-160717v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160717v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160717v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@pf-unbind-with-vf-probed:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic-hdcp14:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_FULL and xe-pw-160717v3_FULL:</p>
<h3>New IGT tests (199)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.13, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-free-race-nomemset:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-bo-unmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-busy:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-fork-read:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.46, 8.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-fork-read-after:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.21, 12.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-multi-fault:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-malloc-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.87, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.01, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.54, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.86, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-remap-ro-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-shared-remap-eocheck:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.75, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-bo-map:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-bo-map-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-busy:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-busy-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-new-race-nomemset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.69, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 2.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 4.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 8.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-benchmark:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 85.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 7.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 5.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 5.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-prefetch:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 3.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 3.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 5.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 8.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-prefetch-race:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-prefetch-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-prefetch:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-2/igt@kms_cursor_crc@cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-media.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-media.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343 -&gt; xe-pw-160717v3</li>
</ul>
<p>IGT_9043: 9043<br />
  xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343: 25ed4a41b6058c0622ccadb523aa009c55d1f343<br />
  xe-pw-160717v3: 160717v3</p>

</body>
</html>

--===============7063186281203242765==--
