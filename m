Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DBECCFA13
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 17:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16A10E57A;
	Fri,  1 May 2026 17:50:01 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762410E567;
 Fri,  1 May 2026 17:50:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=3A_Drop_redund?=
 =?utf-8?q?ant_=40flags=2E*_kernel-doc_on_struct_drm=5Fgpusvm=5Fpages_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 May 2026 17:50:00 -0000
Message-ID: <177765780054.31620.17572887778714990292@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260501174435.4053381-1-shuicheng.lin@intel.com>
In-Reply-To: <20260501174435.4053381-1-shuicheng.lin@intel.com>
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

Series: drm/gpusvm: Drop redundant @flags.* kernel-doc on struct drm_gpusvm_pages (rev2)
URL   : https://patchwork.freedesktop.org/series/165849/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12f912ca057babf2100a5cac0e2fef7a62fa7782
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri May 1 17:44:35 2026 +0000

    drm/gpusvm: Drop redundant @flags.* kernel-doc on struct drm_gpusvm_pages
    
    The kernel-doc block above struct drm_gpusvm_pages duplicates the
    descriptions of the bit-flags that live in struct drm_gpusvm_pages_flags
    using dotted notation (@flags.migrate_devmem, @flags.unmapped, ...).
    That dotted notation is intended for nested anonymous structs/unions that
    the parser flattens into the parent's parameter list.  Here, however,
    flags is of a named external type, so the parser does not flatten its
    members and the dotted entries do not match any member of
    drm_gpusvm_pages.  They also duplicate the canonical descriptions already
    present in the kernel-doc of struct drm_gpusvm_pages_flags itself.
    
    Drop the five @flags.* lines and replace them with a single @flags entry
    that cross-references the type via kernel-doc's "&struct ..." syntax.
    This eliminates the redundancy and removes warnings emitted by the new
    parameterdescs check in scripts/kernel-doc:
    
      Excess struct member 'flags.migrate_devmem' description in
       'drm_gpusvm_pages'
      Excess struct member 'flags.unmapped' description in 'drm_gpusvm_pages'
      Excess struct member 'flags.partial_unmap' description in
       'drm_gpusvm_pages'
      Excess struct member 'flags.has_devmem_pages' description in
       'drm_gpusvm_pages'
      Excess struct member 'flags.has_dma_mapping' description in
       'drm_gpusvm_pages'
    
    No functional change.
    
    v2: change base to drm-misc.
    
    Assisted-by: GitHub Copilot <copilot@github.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch a1e8c0d0d0d7687f5cdce1a4477e2f2cfb900c97 drm-intel
12f912ca057b drm/gpusvm: Drop redundant @flags.* kernel-doc on struct drm_gpusvm_pages
-:36: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#36: 
Assisted-by: GitHub Copilot <copilot@github.com>

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


