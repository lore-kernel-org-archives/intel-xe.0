Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60710D374A2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 15:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356010E85A;
	Thu, 17 Oct 2024 15:08:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9410E860;
 Thu, 17 Oct 2024 15:08:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Avoid_unnecessa?=
 =?utf-8?q?ry_OOM_kills?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 15:08:18 -0000
Message-ID: <172917769863.1279498.7480546716964186697@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Avoid unnecessary OOM kills
URL   : https://patchwork.freedesktop.org/series/140118/
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
commit 0dc98431464164aea1572bff9e22bef83d971972
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Oct 17 16:44:07 2024 +0200

    drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds
    
    Multiple single-ioctl binds can be split up into multiple bind
    ioctls, reducing the memory required to hold the bind array.
    
    So rather than allowing the OOM killer to be invoked, return
    -ENOMEM or -ENOBUFS to user-space to take corrective action.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6d5c65cb1afb42b0bbe813847d9271271d2875a2 drm-intel
d28623b099ed drm/xe: Avoid the OOM killer on buffer object memory allocation
0dc984314641 drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds


