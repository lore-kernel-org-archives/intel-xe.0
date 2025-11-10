Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46406CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 20:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC8210E1A3;
	Mon, 10 Nov 2025 20:02:07 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EAA10E1A3;
 Mon, 10 Nov 2025 20:02:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_Introduce_=25?=
 =?utf-8?q?ptS_for_struct_timespec64_and_convert_users?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 20:02:06 -0000
Message-ID: <176280492660.35461.4668532660325353948@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
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

Series: treewide: Introduce %ptS for struct timespec64 and convert users
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
commit 58b9814a5114f2b94fc2be6f7b9a90aea1df6347
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Nov 10 19:40:42 2025 +0100

    tracing: Switch to use %ptSp
    
    Use %ptSp instead of open coded variants to print content of
    struct timespec64 in human readable format.
    
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+ /mt/dim checkpatch a9792b1ab75123e4aceaba953a89809e745919c6 drm-intel
9374ba89907d lib/vsprintf: Add specifier for printing struct timespec64
-:76: ERROR:CODE_INDENT: code indent should use tabs where possible
#76: FILE: lib/vsprintf.c:1997:
+                     struct printf_spec spec, const char *fmt)$

-:76: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#76: FILE: lib/vsprintf.c:1997:
+                     struct printf_spec spec, const char *fmt)$

total: 1 errors, 1 warnings, 0 checks, 85 lines checked
76657a2b6ffc ALSA: seq: Switch to use %ptSp
057313bd82d6 ceph: Switch to use %ptSp
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: fs/ceph/inode.c:901:
+			doutc(cl, "mtime %ptSp -> %ptSp tw %d -> %d\n", &imtime, mtime,
 			     ci->i_time_warp_seq, (int)time_warp_seq);

total: 0 errors, 0 warnings, 1 checks, 129 lines checked
1262eee7dc60 libceph: Switch to use %ptSp
2a4e93f401e3 dma-buf: Switch to use %ptSp
53b8657970cb drm/amdgpu: Switch to use %ptSp
aa08f3769a8a drm/msm: Switch to use %ptSp
74fde8076f4d drm/vblank: Switch to use %ptSp
53df36491325 drm/xe: Switch to use %ptSp
e6b3f5e4023f e1000e: Switch to use %ptSp
4a7a17ffda83 igb: Switch to use %ptSp
80cdc2f1a0f1 ipmi: Switch to use %ptSp
b7afcbc5cd99 media: av7110: Switch to use %ptSp
80513a4aef68 media: v4l2-ioctl: Switch to use %ptSp
-:22: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#22: FILE: drivers/media/v4l2-core/v4l2-ioctl.c:794:
+	pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%ptSp\n",

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
b9fdd5df2216 mmc: mmc_test: Switch to use %ptSp
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/mmc/core/mmc_test.c:590:
+	pr_info("%s: Transfer of %u x %u sectors (%u x %u%s KiB) took %ptSp seconds (%u kB/s, %u KiB/s, %u.%02u IOPS, sg_len %d)\n",
+		 mmc_hostname(test->card->host), count, sectors, count,

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/mmc/core/mmc_test.c:3075:
+			seq_printf(sf, "%u %d %ptSp %u %u.%02u\n",
+				tr->count, tr->sectors, &tr->ts,

total: 0 errors, 0 warnings, 2 checks, 30 lines checked
9ed591ea7c51 net: dsa: sja1105: Switch to use %ptSp
056b1224817f PCI: epf-test: Switch to use %ptSp
5ac41f6d1ed4 pps: Switch to use %ptSp
8dd21dbdf482 ptp: ocp: Switch to use %ptSp
149b3ec31bee s390/dasd: Switch to use %ptSp
75daf3897569 scsi: fnic: Switch to use %ptS
3baaa4d28aa9 scsi: snic: Switch to use %ptSp
-:34: CHECK:SPACING: No space is necessary after a cast
#34: FILE: drivers/scsi/snic/snic_debugfs.c:301:
+		   (u64) stats->misc.last_isr_time, &last_isr_tms,

-:35: CHECK:SPACING: No space is necessary after a cast
#35: FILE: drivers/scsi/snic/snic_debugfs.c:302:
+		   (u64) stats->misc.last_ack_time, &last_ack_tms,

total: 0 errors, 0 warnings, 2 checks, 33 lines checked
58b9814a5114 tracing: Switch to use %ptSp


