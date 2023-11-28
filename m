Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F23EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 22:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD2810E357;
	Tue, 28 Nov 2023 22:42:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A98F10E357;
 Tue, 28 Nov 2023 22:42:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 66C28AADDD;
 Tue, 28 Nov 2023 22:42:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Tue, 28 Nov 2023 22:42:56 -0000
Message-ID: <170121137641.8220.16772753562449582476@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128175559.21326-1-brian.welty@intel.com>
In-Reply-To: <20231128175559.21326-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe=3A_Memory_allocations_are_tile-based=2C_not_GT-base?=
 =?utf-8?q?d?=
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

Series: fixup! drm/xe: Memory allocations are tile-based, not GT-based
URL   : https://patchwork.freedesktop.org/series/127003/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 19d8fcf06d39274526cd4d3de67b061a4b0b404f
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Nov 28 09:55:59 2023 -0800

    fixup! drm/xe: Memory allocations are tile-based, not GT-based
    
    Fix a missed conversion of GT to tile in vma_is_valid().
    Best is to update the function to take a tile argument.
    
    This bug causes page faults to not complete successfully from media
    engines and when the PTE had been invalidated prior.
    (Caught by igt@xe_exec_fault_mode and INVALIDATE tests.)
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch b06c9f366cd09b888be061d23eecffed7139c09b drm-intel
19d8fcf06 fixup! drm/xe: Memory allocations are tile-based, not GT-based


