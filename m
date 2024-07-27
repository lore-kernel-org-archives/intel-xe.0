Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5644BC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 02:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2694810E0B6;
	Sat, 27 Jul 2024 02:09:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841D10E0B6;
 Sat, 27 Jul 2024 02:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Annotate_xe=5Fv?=
 =?utf-8?q?ma=5Fuserptr=5Fpin=5Fpages_with_might=5Falloc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 27 Jul 2024 02:09:08 -0000
Message-ID: <172204614848.387596.9487578222768035204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240727014414.2127079-1-matthew.brost@intel.com>
In-Reply-To: <20240727014414.2127079-1-matthew.brost@intel.com>
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

Series: drm/xe: Annotate xe_vma_userptr_pin_pages with might_alloc
URL   : https://patchwork.freedesktop.org/series/136581/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c6c72a4d32186654eef4210b04759202cf2302c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 26 18:44:14 2024 -0700

    drm/xe: Annotate xe_vma_userptr_pin_pages with might_alloc
    
    Let's catch corner cases with locking early by annotating
    xe_vma_userptr_pin_pages with might_alloc so if it is called with a lock
    in the path of reclaim lockdep pops even if the userptr hasn't been
    invalidated.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e948842a6cba538c9f5f5dc8535a88d82a3fc0fe drm-intel
2c6c72a4d321 drm/xe: Annotate xe_vma_userptr_pin_pages with might_alloc


