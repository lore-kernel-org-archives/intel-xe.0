Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59544CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 12:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160F810E563;
	Tue, 11 Nov 2025 12:41:03 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A772D10E563;
 Tue, 11 Nov 2025 12:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_Introduce_=25?=
 =?utf-8?q?ptS_for_struct_timespec64_and_convert_users_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 12:41:01 -0000
Message-ID: <176286486165.41027.8911126807159594632@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
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

Series: treewide: Introduce %ptS for struct timespec64 and convert users (rev2)
URL   : https://patchwork.freedesktop.org/series/157346/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad25db59aa841d2e49846d3232329d57e1a69ce4
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Tue Nov 11 13:20:21 2025 +0100

    tracing: Switch to use %ptSp
    
    Use %ptSp instead of open coded variants to print content of
    struct timespec64 in human readable format.
    
    Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ /mt/dim checkpatch 52764bea2cf028d285b0f4d86ee1ebfd4e196486 drm-intel
783f484c3ab8 lib/vsprintf: Add specifier for printing struct timespec64
093acfd52fd4 ceph: Switch to use %ptSp
b219c29e2164 libceph: Switch to use %ptSp
7837a31e3861 dma-buf: Switch to use %ptSp
adfb89919d72 drm/amdgpu: Switch to use %ptSp
ecf86273b844 drm/msm: Switch to use %ptSp
326cc627457d drm/vblank: Switch to use %ptSp
e0f765516082 drm/xe: Switch to use %ptSp
69b94095e006 e1000e: Switch to use %ptSp
4b6113b81941 igb: Switch to use %ptSp
f6e493b110ee ipmi: Switch to use %ptSp
72ecfe4634b2 media: av7110: Switch to use %ptSp
fe2830859c66 mmc: mmc_test: Switch to use %ptSp
1e9e855397c4 net: dsa: sja1105: Switch to use %ptSp
420b1e848eec PCI: epf-test: Switch to use %ptSp
6f71369b7ffb pps: Switch to use %ptSp
a19484c355d9 ptp: ocp: Switch to use %ptSp
0b969592c669 s390/dasd: Switch to use %ptSp
724cfd4e2118 scsi: fnic: Switch to use %ptS
91ab1e170994 scsi: snic: Switch to use %ptSp
-:34: CHECK:SPACING: No space is necessary after a cast
#34: FILE: drivers/scsi/snic/snic_debugfs.c:301:
+		   (u64) stats->misc.last_isr_time, &last_isr_tms,

-:35: CHECK:SPACING: No space is necessary after a cast
#35: FILE: drivers/scsi/snic/snic_debugfs.c:302:
+		   (u64) stats->misc.last_ack_time, &last_ack_tms,

total: 0 errors, 0 warnings, 2 checks, 33 lines checked
ad25db59aa84 tracing: Switch to use %ptSp


