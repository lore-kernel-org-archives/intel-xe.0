Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B248C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 12:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5151110E809;
	Wed, 28 Feb 2024 12:32:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96F10E7FC;
 Wed, 28 Feb 2024 12:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=3A_avoid_using_writeq?=
 =?utf-8?q?=28=29_on_32-bit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 12:32:37 -0000
Message-ID: <170912355771.368864.17479779774253424332@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228122746.3091608-1-arnd@kernel.org>
In-Reply-To: <20240228122746.3091608-1-arnd@kernel.org>
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

Series: xe: avoid using writeq() on 32-bit
URL   : https://patchwork.freedesktop.org/series/130494/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b804a381d8316296c299a13ee93835d778dd4836
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Feb 28 13:27:33 2024 +0100

    xe: avoid using writeq() on 32-bit
    
    32-bit kernels do not provide a writeq(), failing the build:
    
    drivers/gpu/drm/xe/xe_ggtt.c:78:2: error: use of undeclared identifier 'writeq'
       78 |         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
    
    Using lo_hi_writeq() instead will write the lower 32 bits to the address
    before writing the upper 32 bits to the following word, which is likely
    the correct replacement to do on 32-bit targets.
    
    Include the linux/io-64-nonatomic-lo-hi.h header to automatically pick
    the regular writeq() on 64-bit machines but fall back to lo_hi_writeq()
    on 32-bit ones.
    
    Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch bef66e9b0047b939e925a5c9ca02a750cd884765 drm-intel
b804a381d831 xe: avoid using writeq() on 32-bit


