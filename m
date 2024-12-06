Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA5E7716E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 02:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B379910E02D;
	Fri,  6 Dec 2024 02:00:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1310E02D;
 Fri,  6 Dec 2024 02:00:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Call_invalidati?=
 =?utf-8?q?on=5Ffence=5Ffini_for_PT_inval_fences_in_error_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 02:00:58 -0000
Message-ID: <173345045871.3172147.5491042626736263821@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Call invalidation_fence_fini for PT inval fences in error state
URL   : https://patchwork.freedesktop.org/series/142204/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1ffedee345058fbe9f90925b91e82c706d950b07
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Dec 5 17:50:22 2024 -0800

    drm/xe: Call invalidation_fence_fini for PT inval fences in error state
    
    Invalidation_fence_init takes a PM reference, which is released in its
    _fini counterpart, so we need to make sure that the latter is called,
    even if the fence is in an error state.
    
    Since we already have a function that calls _fini() and signals the
    fence in the tlb inval code, we can expose that and call it from the PT
    code.
    
    Fixes: f002702290fc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 784dd0b20e39add60971ccdd5d2f7f3c27cf37bb drm-intel
1ffedee34505 drm/xe: Call invalidation_fence_fini for PT inval fences in error state


