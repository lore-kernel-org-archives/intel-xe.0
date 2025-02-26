Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D73C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 17:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850A10E0EE;
	Wed, 26 Feb 2025 17:08:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0810E0EE;
 Wed, 26 Feb 2025 17:08:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_uninitializ?=
 =?utf-8?q?ed_pointer_def?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 17:08:46 -0000
Message-ID: <174058972640.2396655.7305463798218449181@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226160524.566074-1-colin.i.king@gmail.com>
In-Reply-To: <20250226160524.566074-1-colin.i.king@gmail.com>
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

Series: drm/xe: Fix uninitialized pointer def
URL   : https://patchwork.freedesktop.org/series/145504/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 773d61229fd19172fefd5cc4112dc07c7ac4bc32
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Wed Feb 26 16:05:24 2025 +0000

    drm/xe: Fix uninitialized pointer def
    
    In the case where a set of checks on xe->info.platform don't assign
    a value to pointer def the pointer remains uninitialized and hence
    can fail the following !def check. Fix this be ensuring pointer
    def is initialized to NULL.
    
    Fixes: 292b1a8a5054 ("drm/xe: Stop ignoring errors from xe_heci_gsc_init()")
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c30d867c64c3257fca98492cf97fa6893ba5d294 drm-intel
773d61229fd1 drm/xe: Fix uninitialized pointer def


