Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661B1CF6493
	for <intel-xe@archiver.kernel.org>; Sat, 28 Sep 2024 14:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E9D10E170;
	Sat, 28 Sep 2024 14:43:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4A510E139;
 Sat, 28 Sep 2024 14:43:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/backlight=3A_Rem?=
 =?utf-8?q?ove_a_useless_kstrdup=5Fconst=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Sep 2024 14:43:49 -0000
Message-ID: <172753462983.1131390.1159229160729606063@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
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

Series: drm/i915/backlight: Remove a useless kstrdup_const()
URL   : https://patchwork.freedesktop.org/series/139245/
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
commit ef4ba7e2e7a0a804aba4b7a2a36a048d904384ec
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Sat Sep 28 16:28:24 2024 +0200

    drm/i915/backlight: Remove a useless kstrdup_const()
    
    "name" is allocated and freed in intel_backlight_device_register().
    The initial allocation just duplicates "intel_backlight".
    
    Later, if a device with this name has already been registered, another
    dynamically generated one is allocated using kasprintf().
    
    So at the end of the function, when "name" is freed, it can point either to
    the initial static literal "intel_backlight" or to the kasprintf()'ed one.
    
    So kfree_const() is used.
    
    However, when built as a module, kstrdup_const() and kfree_const() don't
    work as one would expect and are just plain kstrdup() and kfree().
    
    Slightly change the logic and introduce a new variable to hold the
    address returned by kasprintf() should it be used.
    
    This saves a memory allocation/free and avoids these _const functions,
    which names can be confusing when used with code built as module.
    
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
+ /mt/dim checkpatch 26055f21c653a310af74417fe81466cb3ede668c drm-intel
ef4ba7e2e7a0 drm/i915/backlight: Remove a useless kstrdup_const()


