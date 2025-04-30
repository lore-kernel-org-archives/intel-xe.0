Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF9C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 07:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304EE10E291;
	Wed, 30 Apr 2025 07:01:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD9D10E02C;
 Wed, 30 Apr 2025 07:01:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/eustall=3A_Use_copy=5Ffrom=5Fuser=28=29_instead_of_?=
 =?utf-8?q?=5F=5Fcopy=5Ffrom=5Fuser=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Apr 2025 07:01:02 -0000
Message-ID: <174599646271.28422.4156446252743466511@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <c8b410629c1825f5b16537974a3cee11b2d911f2.1745989733.git.harish.chegondi@intel.com>
In-Reply-To: <c8b410629c1825f5b16537974a3cee11b2d911f2.1745989733.git.harish.chegondi@intel.com>
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

Series: series starting with [1/1] drm/xe/eustall: Use copy_from_user() instead of __copy_from_user()
URL   : https://patchwork.freedesktop.org/series/148461/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 571737ae415b3a7e3cb4c2cab376547e316ba734
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Tue Apr 29 22:11:11 2025 -0700

    drm/xe/eustall: Use copy_from_user() instead of __copy_from_user()
    
    copy_from_user() has more checks and is more safer than
    __copy_from_user()
    
    Fixes: 1537ec85ebd7 ("drm/xe/uapi: Introduce API for EU stall sampling")
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch 1295f065de1df2595f37d907efa3354b19d9b639 drm-intel
571737ae415b drm/xe/eustall: Use copy_from_user() instead of __copy_from_user()


