Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28E2D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8562710E827;
	Thu, 14 Nov 2024 17:41:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94210E827;
 Thu, 14 Nov 2024 17:41:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ufence=3A_Wake_up_?=
 =?utf-8?q?waiters_after_setting_ufence-=3Esignalled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 17:41:07 -0000
Message-ID: <173160606745.4134303.15108235004675700409@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114150537.4161573-1-nirmoy.das@intel.com>
In-Reply-To: <20241114150537.4161573-1-nirmoy.das@intel.com>
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

Series: drm/xe/ufence: Wake up waiters after setting ufence->signalled
URL   : https://patchwork.freedesktop.org/series/141363/
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
commit 72661ddaa63d1428d6af7ba1c84116af4368f5be
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Nov 14 16:05:37 2024 +0100

    drm/xe/ufence: Wake up waiters after setting ufence->signalled
    
    If a previous ufence is not signalled, vm_bind will return -EBUSY.
    Delaying the modification of ufence->signalled can cause issues if the
    UMD reuses the same ufence so update ufence->signalled before waking up
    waiters.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3233
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
+ /mt/dim checkpatch 5ca0ec447ff9c0868ef93556f1f99828be0fa336 drm-intel
72661ddaa63d drm/xe/ufence: Wake up waiters after setting ufence->signalled


