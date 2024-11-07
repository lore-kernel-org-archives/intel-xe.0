Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F6AD29FBC
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 02:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160AF10E21B;
	Thu,  7 Nov 2024 02:05:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5379C10E21B;
 Thu,  7 Nov 2024 02:05:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Ensure_all_lock?=
 =?utf-8?q?s_released_in_exec_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 02:05:20 -0000
Message-ID: <173094512033.1419823.9431968149274086563@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106224944.30130-1-matthew.brost@intel.com>
In-Reply-To: <20241106224944.30130-1-matthew.brost@intel.com>
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

Series: drm/xe: Ensure all locks released in exec IOCTL
URL   : https://patchwork.freedesktop.org/series/141031/
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
commit 4c7da8f3d764a9d1f11675518fc91c19d52ac893
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Nov 6 14:49:44 2024 -0800

    drm/xe: Ensure all locks released in exec IOCTL
    
    In couple of places the wrong error handling goto was used to release
    locks. Fix these to ensure all locks dropped on exec IOCTL errors.
    
    Cc: Francois Dugast <francois.dugast@intel.com>
    Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 drm-intel
4c7da8f3d764 drm/xe: Ensure all locks released in exec IOCTL


