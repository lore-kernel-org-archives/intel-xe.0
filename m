Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF35C88E75
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0CF10E1C6;
	Mon, 14 Sep 2026 14:12:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5437510E1C6;
 Mon, 14 Sep 2026 14:12:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Make_p2pdma_dis?=
 =?utf-8?q?tance_check_verbose_via_dynamic_debug_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 14:12:35 -0000
Message-ID: <178939515534.159192.6497131743156331128@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914114617.112012-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260914114617.112012-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Make p2pdma distance check verbose via dynamic debug (rev2)
URL   : https://patchwork.freedesktop.org/series/174028/
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
commit 11c75494416a069940b161dfb7791e780c79c74a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 14 13:46:17 2026 +0200

    drm/xe: Make p2pdma distance check verbose via dynamic debug
    
    pci_p2pdma_distance() can optionally print details about how it
    computed the ACS/PCIe topology distance between the two devices, but
    xe_dma_buf_attach() always called it with verbose set to false,
    silently hiding useful diagnostics whenever a dma-buf attach unset
    attach->peer2peer.
    
    Tie the verbose argument to a dedicated dynamic-debug callsite tagged
    "xe dma-buf p2p debug" (in addition to keeping the existing
    DRM_UT_DRIVER category as a default), so the extra p2pdma distance
    logging can be switched on without a recompile in any of the following
    ways:
    
     - Enable the whole DRIVER category for xe via drm.debug, which is
       already used elsewhere in the driver:
    
         # echo 0x10 > /sys/module/drm/parameters/debug
    
     - Enable dynamic debug for the whole file:
    
         # echo 'file xe_dma_buf.c +p' > \
                 /sys/kernel/debug/dynamic_debug/control
    
     - Enable dynamic debug for just this callsite by function name:
    
         # echo 'func xe_dma_buf_attach +p' > \
                 /sys/kernel/debug/dynamic_debug/control
    
     - Enable dynamic debug by matching the format string used to
       register the callsite:
    
         # echo 'format "xe dma-buf p2p debug" +p' > \
                 /sys/kernel/debug/dynamic_debug/control
    
     - Enable it at boot via the dyndbg= kernel command line parameter:
    
         dyndbg="func xe_dma_buf_attach +p"
    
    Any of the above flips verbose_p2p_dist to true for that attach call,
    causing pci_p2pdma_distance() to log its distance calculation without
    requiring the whole DRM_UT_DRIVER category to be enabled.
    
    v2:
    - Guard the _dynamic_func_call() invocation and
      xe_ddebug_flip_bool() with a CONFIG_DYNAMIC_DEBUG check so the
      build does not break when dynamic debug is disabled. (Sashiko-bot)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Assisted-by: LLM
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 4f03eb1cbe37cc93b33d654828cf49b58d9e2bdc drm-intel
11c75494416a drm/xe: Make p2pdma distance check verbose via dynamic debug
-:88: WARNING:MACRO_ARG_UNUSED: Argument 'flag' is not used in function-like macro
#88: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:36:
+#define xe_dma_buf_p2p_debug_flip(flag) do { } while (0)

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


