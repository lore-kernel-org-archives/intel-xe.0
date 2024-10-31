Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BADED767D8
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 16:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52D10E108;
	Thu, 31 Oct 2024 16:29:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56410E108;
 Thu, 31 Oct 2024 16:29:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Avoid_unnecessa?=
 =?utf-8?q?ry_OOM_kills_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 16:29:30 -0000
Message-ID: <173039217062.1385405.14800568390894126373@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Avoid unnecessary OOM kills (rev2)
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
commit af9ff21359751b1fdb4b93d74b673a519faec230
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Oct 31 16:37:32 2024 +0100

    drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds
    
    Multiple single-ioctl binds can be split up into multiple bind
    ioctls, reducing the memory required to hold the bind array.
    
    So rather than allowing the OOM killer to be invoked, return
    -ENOMEM or -ENOBUFS to user-space to take corrective action.
    
    v2:
    - Add __GFP_NOWARN to __GFP_RETRY_MAYFAIL allocations to avoid
      spamming the kernel log if a recoverable allocation fails.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
+ /mt/dim checkpatch b8c3c871a2df70e3201eb70505981d39e449384d drm-intel
b91ff860bae7 drm/xe: Avoid the OOM killer on buffer object memory allocation
af9ff2135975 drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds


