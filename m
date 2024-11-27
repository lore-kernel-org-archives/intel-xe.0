Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B2DD66BA3
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 01:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA010E106;
	Wed, 27 Nov 2024 01:24:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949C10E18F;
 Wed, 27 Nov 2024 01:24:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Enable_WA?=
 =?utf-8?q?=5FDUAL=5FQUEUE_for_newer_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 01:24:05 -0000
Message-ID: <173267064595.3549515.8389420184489502489@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
URL   : https://patchwork.freedesktop.org/series/141812/
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
commit 6c7b1fdbc1c070252bd34e8eff82a970b55d89de
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Nov 26 17:11:05 2024 -0800

    drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
    
    The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
    on RCS and CCSes with different address spaces, which on DG2 is
    required as a WA for an HW bug. On newer platforms, this block has
    been moved in HW at the CS level, by stalling the RCS/CCS context
    switch when one of the other RCS/CCSes is busy with a different
    address space. While functionally correct, having a submission
    stalled on the HW limits the GuC ability to shuffle things around and
    can cause complications if the non-stalled submission runs for a long
    time, because the GuC doesn't know that the stalled submission isn't
    actually running and might declare it as hung. Therefore, we enable
    the DUAL_QUEUE_WA on all newer platforms to move management back to
    the GuC.
    
    Note that the GuC specs also recommend enabling this for all platforms
    starting from MTL that have a CCS.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 739a2506c44a0be22cc842d2c625a05ed21c1198 drm-intel
6c7b1fdbc1c0 drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms


