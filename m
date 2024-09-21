Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A8CF9C5C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 01:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DAD10E124;
	Sat, 21 Sep 2024 01:23:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6310E124;
 Sat, 21 Sep 2024 01:23:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Clean_up_VM_/_e?=
 =?utf-8?q?xec_queue_file_lock_usage=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Sep 2024 01:23:19 -0000
Message-ID: <172688179941.1052506.17632643678439891741@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240921011712.2681510-1-matthew.brost@intel.com>
In-Reply-To: <20240921011712.2681510-1-matthew.brost@intel.com>
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

Series: drm/xe: Clean up VM / exec queue file lock usage.
URL   : https://patchwork.freedesktop.org/series/138938/
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
commit 446f0b078692dc394c8111d86846e8a619811d98
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Sep 20 18:17:12 2024 -0700

    drm/xe: Clean up VM / exec queue file lock usage.
    
    Both the VM / exec queue file lock protect the lookup and reference to
    the object, nothing more. These locks are not intended anything else
    underneath them. XA have their own locking too, so no need to take the
    VM / exec queue file lock aside from when doing a lookup and reference
    get.
    
    Add some kernel doc to make this clear and cleanup a few typos too.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 drm-intel
446f0b078692 drm/xe: Clean up VM / exec queue file lock usage.


