Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BC2D39404
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 09:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319DE10F1AA;
	Thu,  2 Apr 2026 09:27:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EF610F1AA;
 Thu,  2 Apr 2026 09:27:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_slab-out-of?=
 =?utf-8?q?-bounds_on_PT_update_ops_retry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 09:27:30 -0000
Message-ID: <177512205034.427878.5411312065720736374@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix slab-out-of-bounds on PT update ops retry
URL   : https://patchwork.freedesktop.org/series/164284/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a3a10f7f6d020215ef9c00e258b58af9475806eb
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Apr 2 11:15:39 2026 +0200

    drm/xe: Fix slab-out-of-bounds on PT update ops retry
    
    xe_pt_update_ops_prepare() calls xe_pt_update_ops_init() at the start of
    each invocation to reset per-attempt state, but current_op was not
    included in that reset. When vm_bind_ioctl_ops_execute() retries due to
    ww-mutex contention (drm_exec_retry_on_contention), ops_execute() calls
    xe_pt_update_ops_prepare() again. The second call walks the same op list
    and fills ops[] starting from current_op, which still holds the value
    from the first attempt. This indexes past the end of the ops array
    allocated by xe_vma_ops_alloc(), whose size was computed for a single
    pass.
    
    KASAN reported:
      BUG: KASAN: slab-out-of-bounds in bind_op_prepare+0x89c/0xae0 [xe]
      Write of size 8 at addr ffff88812e72bae8 by task xe_evict/2848
      [...]
      bind_op_prepare+0x89c/0xae0 [xe]
      xe_pt_update_ops_prepare+0xbd0/0x1570 [xe]
      ops_execute+0x3ae/0x2030 [xe]
      vm_bind_ioctl_ops_execute+0x4d5/0xed0 [xe]
    
    The write lands at ops[1].vma (offset 360 into the second element of a
    one-element 384-byte allocation) because entries[] is exactly 360 bytes
    and current_op was 1 at the start of the retried prepare pass.
    
    Fix by resetting current_op to 0 in xe_pt_update_ops_init().
    
    Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: <stable@vger.kernel.org> # v6.12+
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 5ab3838428d9d2baa881cb9b23a30cc77e5c893c drm-intel
a3a10f7f6d02 drm/xe: Fix slab-out-of-bounds on PT update ops retry
-:38: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#38: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:38: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#38: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 7 lines checked


