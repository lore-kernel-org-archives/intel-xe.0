Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB02FC369CA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 22:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932910E3CF;
	Thu, 17 Apr 2025 22:42:58 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347010E3CB;
 Thu, 17 Apr 2025 22:42:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_do_not_flus?=
 =?utf-8?q?h_the_GSC_worker_from_the_reset_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 22:42:57 -0000
Message-ID: <174492977740.16420.17616554468968393405@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417223713.1377506-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250417223713.1377506-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: do not flush the GSC worker from the reset path
URL   : https://patchwork.freedesktop.org/series/147944/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ef005d27e9508c7a423785f79f11c5559713a897
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Apr 17 15:37:13 2025 -0700

    drm/xe/gsc: do not flush the GSC worker from the reset path
    
    The workqueue used for the reset worker is marked as WQ_MEM_RECLAIM,
    while the GSC one isn't (and can't be as we need to do memory
    allocations in the gsc worker). Therefore, we can't flush the latter
    from the former.
    
    The reason why we had such a flush was to avoid interrupting either
    the GSC FW load or in progress GSC proxy operations. GSC proxy
    operations fall into 2 categories:
    
    1) GSC proxy init: this only happen once immediately after GSC FW laod
       and does not support being interrupted. The only way to recover from
       an interruption of the proxy init is to do an FLR and re-load the GSC.
    
    2) GSC proxy request: this can happen in response to a request that
       the driver sends to the GSC. If this is interrupted, the GSC FW will
       timeout and the driver request will be failed, but overall the GSC
       will keep working fine.
    
    Flushing the work allowed us to avoid interruption in both cases (unless
    the hang came from the GSC engine itself, in which case we're toast
    anyway). However, a failure on a proxy request is tolerable if we're in
    a scenario where we're triggering a GT reset (i.e., something is already
    gone pretty wrong), so what we really need to avoid is interrupting
    the init flow, which we can do by polling on the register that reports
    when the proxy init is complete (as that ensure us that all the load and
    init operations have been completed).
    
    Note that during suspend we still want to do a flush of the worker to
    make sure it completes any operations involving the HW before the power
    is cut.
    
    Fixes: dd0e89e5edc2 ("drm/xe/gsc: GSC FW load")
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 5cd835ef6352a207fa4177184b397dfd82989e5d drm-intel
ef005d27e950 drm/xe/gsc: do not flush the GSC worker from the reset path


