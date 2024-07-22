Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CCC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 20:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28210E166;
	Mon, 22 Jul 2024 20:34:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09010E166;
 Mon, 22 Jul 2024 20:34:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Return_-ENOBUFS?=
 =?utf-8?q?_if_a_kmalloc_fails_which_is_tied_to_an_array_of_binds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 20:34:47 -0000
Message-ID: <172168048725.349898.12829682692977553788@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722202657.1601192-1-matthew.brost@intel.com>
In-Reply-To: <20240722202657.1601192-1-matthew.brost@intel.com>
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

Series: drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an array of binds (rev2)
URL   : https://patchwork.freedesktop.org/series/136292/
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
commit 4b7557ffb4dda0e6ada1f3c0baa08ad4f6577240
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 22 13:26:57 2024 -0700

    drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an array of binds
    
    The size of an array of binds is directly tied to several kmalloc in the
    KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
    the case of these failures.
    
    The expected UMD behavior upon returning -ENOBUFS is to split an array
    of binds into a series of single binds.
    
    v2:
     - Resend for CI
    
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 16dc06e8fb1aaf484c4914f1fecc22502c9ab641 drm-intel
4b7557ffb4dd drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an array of binds


