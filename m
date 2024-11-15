Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790F7D68BDA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 22:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4689E10E183;
	Fri, 15 Nov 2024 22:34:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0510E183;
 Fri, 15 Nov 2024 22:34:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Converge_on_using_secs=5F?=
 =?utf-8?q?to=5Fjiffies=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 22:34:27 -0000
Message-ID: <173171006779.380829.14956643114160126570@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
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

Series: Converge on using secs_to_jiffies() (rev2)
URL   : https://patchwork.freedesktop.org/series/141435/
State : warning

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
commit b8b17b555ce572f3165821998ec99c974840a526
Author: Easwar Hariharan <eahariha@linux.microsoft.com>
Date:   Fri Nov 15 21:26:38 2024 +0000

    nfp: Convert timeouts to secs_to_jiffies()
    
    Changes made with the following Coccinelle rules:
    
    @@ constant C; @@
    
    - msecs_to_jiffies(C * 1000)
    + secs_to_jiffies(C)
    
    @@ constant C; @@
    
    - msecs_to_jiffies(C * MSEC_PER_SEC)
    + secs_to_jiffies(C)
    
    Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
+ /mt/dim checkpatch f43942f219c827e4e89baa102ceca3d62205135e drm-intel
8682b538a3c3 netfilter: conntrack: Cleanup timeout definitions
f5bbf2ee43c6 coccinelle: misc: Add secs_to_jiffies script
-:10: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#10: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
f80eff7eaba6 arm: pxa: Convert timeouts to use secs_to_jiffies()
-:32: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#32: FILE: arch/arm/mach-pxa/sharpsl_pm.c:35:
+#define SHARPSL_CHARGE_FINISH_TIME             (secs_to_jiffies(10*60)) /* 10 min */
                                                                   ^

total: 0 errors, 0 warnings, 1 checks, 12 lines checked
081a56c8be5b s390: kernel: Convert timeouts to use secs_to_jiffies()
682e8147c1b6 powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
cddd41e9c5c2 mm: kmemleak: Convert timeouts to secs_to_jiffies()
7839ffd9d1fd accel/habanalabs: Convert timeouts to secs_to_jiffies()
aa3bf6cbc89e drm/xe: Convert timeout to secs_to_jiffies()
0067add30426 drm/etnaviv: Convert timeouts to secs_to_jiffies()
9ace647b6928 scsi: lpfc: Convert timeouts to secs_to_jiffies()
15aa1431dade scsi: arcmsr: Convert timeouts to secs_to_jiffies()
826b1b9e978e scsi: pm8001: Convert timeouts to secs_to_jiffies()
08f4fec46568 xen/blkback: Convert timeouts to secs_to_jiffies()
3d89032fa5b4 gve: Convert timeouts to secs_to_jiffies()
e6575c295adb wifi: ath11k: Convert timeouts to secs_to_jiffies()
e7e491f4c3a9 Bluetooth: MGMT: Convert timeouts to secs_to_jiffies()
7b5179daa1f3 staging: vc04_services: Convert timeouts to secs_to_jiffies()
ef3432ae4cac ceph: Convert timeouts to secs_to_jiffies()
a8e601fb4323 livepatch: Convert timeouts to secs_to_jiffies()
29df3371e74c ALSA: line6: Convert timeouts to secs_to_jiffies()
b8b17b555ce5 nfp: Convert timeouts to secs_to_jiffies()


