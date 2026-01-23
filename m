Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A60D778AF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 20:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A057D10E0BC;
	Fri, 23 Jan 2026 20:32:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11AA10E0BC;
 Fri, 23 Jan 2026 20:31:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_P?=
 =?utf-8?q?rotect_priority_against_concurrent_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 20:31:59 -0000
Message-ID: <176920031973.189333.4174154741225895774@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123195124.3390157-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260123195124.3390157-2-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Protect priority against concurrent access (rev2)
URL   : https://patchwork.freedesktop.org/series/160447/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 652f9b1b9a7193856fd4104d6c1c1342047f8011
Author: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
Date:   Fri Jan 23 11:51:25 2026 -0800

    drm/xe/multi_queue: Protect priority against concurrent access
    
    Use a spinlock to protect multi-queue priority being concurrently
    updated by multiple set_priority ioctls and to protect against
    concurrent read and write to this field.
    
    v2: Update documentation, remove WRITE/READ_LOCK() (Thomas)
        Use scoped_guard, reduced lock scope (Matt Brost)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a0ea91e77badad299c63216a93999551ea2a02f0 drm-intel
652f9b1b9a71 drm/xe/multi_queue: Protect priority against concurrent access
-:97: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>' != 'Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 64 lines checked


