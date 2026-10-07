Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6263CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 15:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C21E10E5A4;
	Wed,  7 Oct 2026 15:42:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1610E4A3;
 Wed,  7 Oct 2026 15:42:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_sticky_TT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 15:42:54 -0000
Message-ID: <179138777479.249228.17128439587507067180@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007153605.1743626-5-matthew.auld@intel.com>
In-Reply-To: <20261007153605.1743626-5-matthew.auld@intel.com>
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

Series: sticky TT (rev2)
URL   : https://patchwork.freedesktop.org/series/175133/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 309105bf1bdc939fc486867591791428d1f96fba
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Oct 7 16:36:09 2026 +0100

    drm/xe: skip p2p for suspected display buffers
    
    If p2p is allowed on the CPU (like on AMD), we currently permit p2p for
    all exported VRAM buffers. However, in some multi-GPU setups, like with
    prime rendering on a dgpu and scanout/compositor using the igpu, it
    looks like the exported dma-buf window buffer can in some cases end up
    using p2p.
    
    However, user is reporting a kernel regression where performance here
    massively tanks across many games/workloads, where it looks like on each
    frame, the igpu is reading/sampling from VRAM over pcie for the window
    buffer, since it uses p2p. p2p is currently more intended for dgpu <->
    dgpu, and not so much display buffers with igpu <-> dgpu, at least for
    now.
    
    We don't currently have any hints to say "please use p2p for this
    buffer, or please don't", however we can use some heuristics to try to
    determine if this is likely a display buffer being exported to an igpu,
    which probably never intended for p2p:
    
     1. FLAG_SCANOUT being set on the buffer. Window buffers usually get
        tagged with this, but not always.
    
     2. Importer being a PCI device with display, which is not xe driver.
    
    We also rely on the existing p2p Intel CPU whitelist to stop this
    happening on xe igpu. Currently p2p is only enabled for server CPUs, on
    Intel. We also limit the above to dual placement buffers.
    
    The original regression was bisected to commit 609fc8766d68 ("dma-buf:
    Always build with DMABUF_MOVE_NOTIFY"), however the behaviour was
    already present when enabling that knob, so this goes back even further.
    
    User has confirmed that along with the sticky dma-buf TT placement fix,
    to prevent ping-ponging, the performance is back to normal.
    
    Assisted-by: LLM
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9415
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.12
+ /mt/dim checkpatch 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05 drm-intel
578a7fe25c4b drm/xe/dma-buf: keep non-p2p imported buffers in system memory
e51636dd985b drm/xe/vm: make PREFETCH to TT sticky
-:21: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#21: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 5c87fee3c96c ("drm/xe: Attempt to bring bos back to VRAM after eviction")

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
309105bf1bdc drm/xe: skip p2p for suspected display buffers


