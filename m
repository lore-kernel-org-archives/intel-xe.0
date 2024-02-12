Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55BFC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 16:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112C10EB06;
	Mon, 12 Feb 2024 16:15:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637FC10E63A;
 Mon, 12 Feb 2024 16:15:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Prefer_struct?=
 =?utf-8?q?=5Fsize_over_open_coded_arithmetic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erick Archer" <erick.archer@gmx.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 16:15:17 -0000
Message-ID: <170775451740.1182955.16305805804604225420@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240210141913.6611-1-erick.archer@gmx.com>
In-Reply-To: <20240210141913.6611-1-erick.archer@gmx.com>
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

Series: drm/xe: Prefer struct_size over open coded arithmetic
URL   : https://patchwork.freedesktop.org/series/129775/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 317c76c221fe5f8e96416bd56c05f614570ee81e
Author: Erick Archer <erick.archer@gmx.com>
Date:   Sat Feb 10 15:19:12 2024 +0100

    drm/xe: Prefer struct_size over open coded arithmetic
    
    This is an effort to get rid of all multiplications from allocation
    functions in order to prevent integer overflows [1].
    
    As the "q" variable is a pointer to "struct xe_exec_queue" and this
    structure ends in a flexible array:
    
    struct xe_exec_queue {
            [...]
            struct xe_lrc lrc[];
    };
    
    the preferred way in the kernel is to use the struct_size() helper to
    do the arithmetic instead of the argument "size + size * count" in the
    kzalloc() function.
    
    This way, the code is more readable and more safer.
    
    Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
    Link: https://github.com/KSPP/linux/issues/160 [2]
    Signed-off-by: Erick Archer <erick.archer@gmx.com>
+ /mt/dim checkpatch 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce drm-intel
317c76c22 drm/xe: Prefer struct_size over open coded arithmetic


