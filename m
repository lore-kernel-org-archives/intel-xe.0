Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49545CE7B10
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C3210E0AB;
	Thu, 28 Sep 2023 10:18:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEFB810E0AB;
 Thu, 28 Sep 2023 10:18:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CC175AADF1;
 Thu, 28 Sep 2023 10:18:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 28 Sep 2023 10:18:21 -0000
Message-ID: <169589630183.21268.9549093185692189130@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230928100537.392675-7-matthew.auld@intel.com>
In-Reply-To: <20230928100537.392675-7-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PA?=
 =?utf-8?q?T_and_cache_coherency_support_=28rev7=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: PAT and cache coherency support (rev7)
URL   : https://patchwork.freedesktop.org/series/123027/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af55f15bc9bb795bbe7a55dc6a18924ec42c6582
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Sep 28 11:05:43 2023 +0100

    drm/xe/uapi: support pat_index selection with vm_bind
    
    Allow userspace to directly control the pat_index for a given vm
    binding. This should allow directly controlling the coherency, caching
    and potentially other stuff in the future for the ppGTT binding.
    
    The exact meaning behind the pat_index is very platform specific (see
    BSpec or PRMs) but effectively maps to some predefined memory
    attributes. From the KMD pov we only care about the coherency that is
    provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
    The vm_bind coherency mode for the given pat_index needs to be at least
    as coherent as the coh_mode that was set at object creation. For
    platforms that lack the explicit coherency mode, we treat UC/WT/WC as
    NONE and WB as AT_LEAST_1WAY.
    
    For userptr mappings we lack a corresponding gem object, so the expected
    coherency mode is instead implicit and must fall into either 1WAY or
    2WAY. Trying to use NONE will be rejected by the kernel. For imported
    dma-buf (from a different device) the coherency mode is also implicit
    and must also be either 1WAY or 2WAY i.e AT_LEAST_1WAY.
    
    v2:
      - Undefined coh_mode(pat_index) can now be treated as programmer
        error. (Matt Roper)
      - We now allow gem_create.coh_mode <= coh_mode(pat_index), rather than
        having to match exactly. This ensures imported dma-buf can always
        just use 1way (or even 2way), now that we also bundle 1way/2way into
        at_least_1way. We still require 1way/2way for external dma-buf, but
        the policy can now be the same for self-import, if desired.
      - Use u16 for pat_index in uapi. u32 is massive overkill. (José)
      - Move as much of the pat_index validation as we can into
        vm_bind_ioctl_check_args. (José)
    v3 (Matt Roper):
      - Split the pte_encode() refactoring into separate patch.
    v4:
      - Rebase
    
    Bspec: 45101, 44235 #xe
    Bspec: 70552, 71582, 59400 #xe2
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Pallavi Mishra <pallavi.mishra@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Filip Hazubski <filip.hazubski@intel.com>
    Cc: Carl Zhang <carl.zhang@intel.com>
    Cc: Effie Yu <effie.yu@intel.com>
+ /mt/dim checkpatch 7c58b58522cf124dd324fbf95d9dd838fac36bcb drm-intel
29b350c5f drm/xe/pat: trim the xelp PAT table
535470250 drm/xe: directly use pat_index for pte_encode
c45ed0c45 drm/xe/uapi: Add support for cache and coherency mode
26fbadf40 drm/xe/pat: annotate pat_index with coherency mode
af55f15bc drm/xe/uapi: support pat_index selection with vm_bind


