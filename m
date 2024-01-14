Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFCC4707B
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jan 2024 15:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4567C10E1A4;
	Sun, 14 Jan 2024 15:20:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0871D10E19A;
 Sun, 14 Jan 2024 15:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Remove_usag?=
 =?utf-8?q?e_of_the_deprecated_ida=5Fsimple=5Fxx=28=29_API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Date: Sun, 14 Jan 2024 15:20:30 -0000
Message-ID: <170524563003.370395.3908918053187044317@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
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

Series: drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
URL   : https://patchwork.freedesktop.org/series/128758/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit de2ff0a40d707aa95b4a31d42899fb0b1b0f1f5a
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Sun Jan 14 16:09:16 2024 +0100

    drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
    
    ida_alloc() and ida_free() should be preferred to the deprecated
    ida_simple_get() and ida_simple_remove().
    
    Note that the upper limit of ida_simple_get() is exclusive, but the one of
    ida_alloc_max() is inclusive. So a -1 has been added when needed.
    
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
de2ff0a40 drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API


