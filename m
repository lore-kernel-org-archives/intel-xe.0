Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949CC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC46A10F4D9;
	Wed, 29 May 2024 16:07:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B5C10F49B;
 Wed, 29 May 2024 16:07:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22drm/xe=3A_make_?=
 =?utf-8?q?gt=5Fremove_use_devm=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 16:07:47 -0000
Message-ID: <171699886721.2233681.1168567802451354337@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
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

Series: Revert "drm/xe: make gt_remove use devm" (rev2)
URL   : https://patchwork.freedesktop.org/series/134149/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a7b48d637bbac89e1e4b4a4b4fc62da1edd8c0b
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue May 28 11:23:54 2024 -0700

    Revert "drm/xe: make gt_remove use devm"
    
    The gt_remove function was explictly added as part of the remove flow
    instead of using drmm/devm automatic cleanup due to it being illegal
    to remove a component after the driver has been detached from the pci
    device; the GSC proxy component is removed as part of gt_remove, so we
    need to do it in the pci cleanup flow. The function already has a
    comment above it to explain this.
    
    Note that the change to use the devm also caused an invalid pointer
    deref in the gsc_proxy unbind function, but I didn't bother to debug
    which pointer was bad since we shouldn't be calling the unbind that
    late anyway and this revert fixes it.
    
    Both issue were not seen in CI because the GSC loading is temporarily
    disabled due to a critical bug, which means we're not binding the
    component.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch fc8c84173ee4de00aaea8235be8442b50af5454a drm-intel
8a7b48d637bb Revert "drm/xe: make gt_remove use devm"
-:6: WARNING:TYPO_SPELLING: 'explictly' may be misspelled - perhaps 'explicitly'?
#6: 
The gt_remove function was explictly added as part of the remove flow
                           ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 97 lines checked


