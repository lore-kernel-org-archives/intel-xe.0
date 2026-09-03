Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA23C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 11:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39AF10F54A;
	Thu,  3 Sep 2026 11:52:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36B710F54A;
 Thu,  3 Sep 2026 11:52:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Flush_LSC_untyp?=
 =?utf-8?q?ed_L1_dataport_cache_after_rcs/ccs_batches_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 11:52:47 -0000
Message-ID: <178843636785.116940.12590422319955332562@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches (rev2)
URL   : https://patchwork.freedesktop.org/series/172216/
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
commit 93e5972421128b6aca656ec7cdf6cbcc0849f247
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Sep 3 13:45:52 2026 +0200

    drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches
    
    emit_render_cache_flush() sets PIPE_CONTROL0_HDC_PIPELINE_FLUSH to
    flush the L2/HDC data cache before fence signalling, but it never
    requests a flush of the LSC untyped L1 data cache via the 'Untyped
    Data-Port Cache Flush Enable' bit in PIPE_CONTROL DWord0[11].
    
    Per the Bspec, in 3D pipeline mode HDC Pipeline Flush is documented to
    also flush/invalidate the untyped L1 cache, but only depending on how
    HDC_CHICKEN0[13:11] is programmed. Starting with MTL, this coupling
    between HDC Pipeline Flush and the untyped L1 cache flush no longer
    holds in practice, regardless of how HDC_CHICKEN0 is programmed, so
    relying on it is not safe on newer platforms such as BMG. Mesa's Vulkan
    driver (anv) has been assuming the kernel flushes both caches between
    submissions, and hit user-visible corruption in apps such as Llama.cpp
    because of this gap; it now works around it by flushing both caches
    again from userspace at the end of every command buffer.
    
    Correctness between submissions on the same queue is userspace's
    responsibility and belongs in Mesa, not the kernel. However, for
    security we must ensure stale data can't leak through the untyped L1
    dataport cache once memory is reclaimed or evicted, which requires the
    KMD to flush it before releasing memory for reuse.
    
    Prior to MTL, HDC_CHICKEN0 could be programmed (as already done for
    DG2 via Wa_22010960976/Wa_14013347512) to reliably keep HDC Pipeline
    Flush coupled to the untyped L1 cache flush, so those platforms are
    unaffected. Mesa's own anv driver found that on MTL the HW
    disconnected the two independently of how HDC_CHICKEN0 is programmed,
    and could not bring the old behavior back even by writing the register
    by hand; see Mesa commit 7c2ff46a4fc3 ("anv: don't prevent L1 untyped
    cache flush in 3D mode"). The kernel can't reliably request the flush
    from the CS on MTL either, so restrict the new PIPE_CONTROL bit to
    GRAPHICS_VERx100 >= 2000 (Xe2 and later), where it can be relied on.
    
    Explicitly set PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH together
    with PIPE_CONTROL0_HDC_PIPELINE_FLUSH in emit_render_cache_flush() on
    Xe2 and later, so the L1 data cache is known clean before memory is
    released for reuse, without depending on undocumented
    platform-specific HDC_CHICKEN0 behavior.
    
    Bspec: 56551
    Link: https://gitlab.freedesktop.org/mesa/mesa/-/commit/7c2ff46a4fc3e537573ac9503057e0cd29b6fff3
    Fixes: 9f8f93bee3ef ("drm/xe: Emit a render cache flush after each rcs/ccs batch")
    Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8909
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v6.8+
    Assisted-by: GitHub_Copilot:claude-sonnet-5
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com> #v1
+ /mt/dim checkpatch ac238a043f935a7115a9c6e099fd45a4682a1b3c drm-intel
93e597242112 drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches
-:38: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7c2ff46a4fc3', maybe rebased or not pulled?
#38: 
by hand; see Mesa commit 7c2ff46a4fc3 ("anv: don't prevent L1 untyped

total: 0 errors, 1 warnings, 0 checks, 30 lines checked


