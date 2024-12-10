Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD1E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 22:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E41810E065;
	Tue, 10 Dec 2024 22:37:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E3510E065;
 Tue, 10 Dec 2024 22:37:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Converge_on_using_secs=5F?=
 =?utf-8?q?to=5Fjiffies=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 22:37:01 -0000
Message-ID: <173387022127.987366.15779978179197194266@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
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

Series: Converge on using secs_to_jiffies() (rev3)
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
commit aaeeed8a60aaefe8896300f0a2a0d02051b17ce2
Author: Easwar Hariharan <eahariha@linux.microsoft.com>
Date:   Tue Dec 10 22:02:50 2024 +0000

    ALSA: line6: Convert timeouts to secs_to_jiffies()
    
    Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
    secs_to_jiffies(). As the value here is a multiple of 1000, use
    secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
    
    This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
    the following Coccinelle rules:
    
    @@ constant C; @@
    
    - msecs_to_jiffies(C * 1000)
    + secs_to_jiffies(C)
    
    @@ constant C; @@
    
    - msecs_to_jiffies(C * MSEC_PER_SEC)
    + secs_to_jiffies(C)
    
    Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
+ /mt/dim checkpatch 2223c2c738ecb056c0a77e115334887da66668c8 drm-intel
9af740651d50 netfilter: conntrack: Cleanup timeout definitions
40b120c2bf4a coccinelle: misc: Add secs_to_jiffies script
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
fe3ab9c6bffe arm: pxa: Convert timeouts to use secs_to_jiffies()
-:38: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#38: FILE: arch/arm/mach-pxa/sharpsl_pm.c:35:
+#define SHARPSL_CHARGE_FINISH_TIME             (secs_to_jiffies(10*60))
                                                                   ^

-:40: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#40: FILE: arch/arm/mach-pxa/sharpsl_pm.c:37:
+#define SHARPSL_BATCHK_TIME_SUSPEND            (60*10) /* 10 min */
                                                   ^

total: 0 errors, 0 warnings, 2 checks, 14 lines checked
10db53e65e76 s390: kernel: Convert timeouts to use secs_to_jiffies()
aceb58abc01e powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
0771e5ddcd78 mm: kmemleak: Convert timeouts to secs_to_jiffies()
9334a301e835 accel/habanalabs: Convert timeouts to secs_to_jiffies()
95969d565a8d drm/xe: Convert timeout to secs_to_jiffies()
8b824a3a6936 scsi: lpfc: Convert timeouts to secs_to_jiffies()
58ce31947265 scsi: arcmsr: Convert timeouts to secs_to_jiffies()
58f6b10057d1 scsi: pm8001: Convert timeouts to secs_to_jiffies()
ed972d55c8d5 xen/blkback: Convert timeouts to secs_to_jiffies()
69e725313cc7 gve: Convert timeouts to secs_to_jiffies()
1c38fdc0ad7d wifi: ath11k: Convert timeouts to secs_to_jiffies()
419895552a5d Bluetooth: MGMT: Convert timeouts to secs_to_jiffies()
d9d2d401e59a staging: vc04_services: Convert timeouts to secs_to_jiffies()
331d5a952587 ceph: Convert timeouts to secs_to_jiffies()
bcdfc690c5bb livepatch: Convert timeouts to secs_to_jiffies()
aaeeed8a60aa ALSA: line6: Convert timeouts to secs_to_jiffies()


