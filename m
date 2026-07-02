Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3AAC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 01:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D157D10E400;
	Thu,  2 Jul 2026 01:43:56 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AFC10E400;
 Thu,  2 Jul 2026 01:43:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_PTE_index_i?=
 =?utf-8?q?n_xe=5Fvm=5Fpopulate=5Fpgtable=28=29_for_chunked_binds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 01:43:55 -0000
Message-ID: <178295663543.140995.8779243314034054345@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702012434.3861171-1-matthew.brost@intel.com>
In-Reply-To: <20260702012434.3861171-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix PTE index in xe_vm_populate_pgtable() for chunked binds
URL   : https://patchwork.freedesktop.org/series/169655/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 05eb9855626ae70d9332ae4b96bdfea1d244d7df
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 1 18:24:34 2026 -0700

    drm/xe: Fix PTE index in xe_vm_populate_pgtable() for chunked binds
    
    xe_vm_populate_pgtable() indexed the source PTE array (update->pt_entries)
    by the per-call loop counter, assuming each call starts at the first entry
    of the update. That holds for the CPU bind path
    (xe_migrate_update_pgtables_cpu), which populates a whole update in a single
    call, but not for the GPU bind path: write_pgtable() splits an update into
    MAX_PTE_PER_SDI (510) sized MI_STORE_DATA_IMM chunks, invoking the populate
    callback once per chunk with an advancing qword_ofs but a fresh command-
    buffer destination pointer.
    
    As a result, every chunk after the first re-read pt_entries from index 0
    instead of from its true offset, so PTEs beyond the first 510 entries of a
    single update were programmed with the wrong physical pages, shifting the
    mapping by exactly MAX_PTE_PER_SDI pages.
    
    This stayed latent because a single update only exceeds 510 qwords when a
    large (e.g. 2M) region is bound as individual 4K PTEs rather than a single
    huge-page entry, which happens when the backing store is sufficiently
    fragmented. It was surfaced by the BO defrag path, which deliberately
    rebinds such fragmented ranges via the GPU bind path, producing
    deterministic data corruption offset by 510 pages.
    
    Index pt_entries by the chunk's absolute offset relative to update->ofs so
    both the CPU and GPU paths pick the correct entries.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: stable@vger.kernel.org
    Assisted-by: GitHub_Copilot:claude-opus-4.8
+ /mt/dim checkpatch 5394116badd62f96fbe40313704b555dac73379d drm-intel
05eb9855626a drm/xe: Fix PTE index in xe_vm_populate_pgtable() for chunked binds
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
(xe_migrate_update_pgtables_cpu), which populates a whole update in a single

-:63: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 24 lines checked


