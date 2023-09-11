Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648D1EEB581
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 20:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2955410E1CF;
	Mon, 11 Sep 2023 20:45:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4023E10E1CF;
 Mon, 11 Sep 2023 20:45:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3BD37AADDA;
 Mon, 11 Sep 2023 20:45:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 11 Sep 2023 20:45:30 -0000
Message-ID: <169446513024.31369.12820217398156107440@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911194712.34387-1-gustavo.sousa@intel.com>
In-Reply-To: <20230911194712.34387-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Tu?=
 =?utf-8?q?rn_display_finalizers_into_static_functions_=28rev3=29?=
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

Series: Turn display finalizers into static functions (rev3)
URL   : https://patchwork.freedesktop.org/series/123443/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 605dcc3e0bcc9bf00ae908152188e7daa86fb55d
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Sep 11 16:47:12 2023 -0300

    fixup! drm/xe/display: Implement display support
    
    Finalizer counterparts of display initializers are registered with
    drmm_add_action_or_reset(). Since there are no other explicit users of
    them outside of xe_display.c, let's turn them into static functions.
    
    While at it, since this is a fixup patch, also do other cleanups
    suggested by Lucas:
    
        * s/xe_display_modset_driver_remove/xe_display_driver_remove/
    
        * Remove the unused xe_display_enable()
    
        * s,xe_display_unlink,xe_display_fini,
    
          The original suggestion for the above was to replace with
          xe_display_shutdown, but I went with xe_display_fini to be
          consistent with the other "stepped" display finalizers.
    
        * Group functions in the header by namespaces.
    
    v2:
      - Add more cleanups. (Lucas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 8b1dfde2899992006000b358a282173604338f88 drm-intel
605dcc3e0 fixup! drm/xe/display: Implement display support


