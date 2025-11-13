Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CA0CD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 16:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF61810E8CB;
	Thu, 13 Nov 2025 16:49:02 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C517C10E8CB;
 Thu, 13 Nov 2025 16:49:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_Introduce_=25?=
 =?utf-8?q?ptS_for_struct_timespec64_and_convert_users_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Nov 2025 16:49:01 -0000
Message-ID: <176305254180.50964.4132058556269918491@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
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

Series: treewide: Introduce %ptS for struct timespec64 and convert users (rev3)
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
commit db1ff432430dd982b973209d41c475645ecc4272
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu Nov 13 15:32:35 2025 +0100

    tracing: Switch to use %ptSp
    
    Use %ptSp instead of open coded variants to print content of
    struct timespec64 in human readable format.
    
    Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ /mt/dim checkpatch 3ce0a1e8a582ad7bd9923eaafcb8619986d59310 drm-intel
90746e7cc180 lib/vsprintf: Add specifier for printing struct timespec64
623cf2a06dde ceph: Switch to use %ptSp
912543052831 libceph: Switch to use %ptSp
80883d426973 dma-buf: Switch to use %ptSp
2176c84c5c49 drm/amdgpu: Switch to use %ptSp
c116f962b7bd drm/msm: Switch to use %ptSp
9f35b41c874e drm/vblank: Switch to use %ptSp
6fda5ae858d9 drm/xe: Switch to use %ptSp
faf78b47b030 e1000e: Switch to use %ptSp
9c0e9f57f344 igb: Switch to use %ptSp
2b15ba1851d1 ipmi: Switch to use %ptSp
5938769dd45c media: av7110: Switch to use %ptSp
7d71bb605f3a mmc: mmc_test: Switch to use %ptSp
ae21d4f09465 net: dsa: sja1105: Switch to use %ptSp
db0c7b20568d PCI: epf-test: Switch to use %ptSp
ef2c23469a2c pps: Switch to use %ptSp
968f29ec7322 ptp: ocp: Switch to use %ptSp
a278d20e4ed9 s390/dasd: Switch to use %ptSp
1eec1b50f8db scsi: fnic: Switch to use %ptSp
3c35a33fdb38 scsi: snic: Switch to use %ptSp
-:35: CHECK:SPACING: No space is necessary after a cast
#35: FILE: drivers/scsi/snic/snic_debugfs.c:301:
+		   (u64) stats->misc.last_isr_time, &last_isr_tms,

-:36: CHECK:SPACING: No space is necessary after a cast
#36: FILE: drivers/scsi/snic/snic_debugfs.c:302:
+		   (u64) stats->misc.last_ack_time, &last_ack_tms,

total: 0 errors, 0 warnings, 2 checks, 33 lines checked
db1ff432430d tracing: Switch to use %ptSp


