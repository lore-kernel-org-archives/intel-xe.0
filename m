Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5199DC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 09:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2774D10E05E;
	Tue,  8 Aug 2023 09:45:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0BFF10E05E;
 Tue,  8 Aug 2023 09:45:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BD4DDAADF2;
 Tue,  8 Aug 2023 09:45:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 08 Aug 2023 09:45:16 -0000
Message-ID: <169148791677.13860.1190662517643721225@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230808091208.112793-2-matthew.auld@intel.com>
In-Reply-To: <20230808091208.112793-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_skip_rebind=5Flist_if_vma_destroyed?=
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

Series: drm/xe: skip rebind_list if vma destroyed
URL   : https://patchwork.freedesktop.org/series/122146/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7be12219f212781677c5bb3217f55a075f0d3614
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Aug 8 10:12:09 2023 +0100

    drm/xe: skip rebind_list if vma destroyed
    
    If we are closing a vm, mark each vma as XE_VMA_DESTROYED and skip
    touching the rebind_list if this is seen on the eviction path. That way
    we can safely drop the vm dma-resv lock on the close path without
    needing to worry about racing with the eviction path trying to add stuff
    to the rebind_list which can corrupt our contended list, since the
    destroy and rebind links are the same list entry underneath.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d404117f8ff659d3f08a81ec60379fbafc084efb drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


