Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C6C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D810EB3F;
	Fri, 16 May 2025 17:05:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357810EB3F;
 Fri, 16 May 2025 17:05:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crashlog_Type1_Version2_s?=
 =?utf-8?q?upport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 17:05:26 -0000
Message-ID: <174741512620.88035.8635676664954900980@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516144619.210413-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250516144619.210413-1-michael.j.ruhl@intel.com>
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

Series: Crashlog Type1 Version2 support
URL   : https://patchwork.freedesktop.org/series/149120/
State : warning

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
commit 4d6841e0bcd2fdd2c4f37a6c89c405530df77957
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri May 16 10:46:19 2025 -0400

    platform/x86/intel/pmt: support BMG crashlog
    
    The Battlemage GPU has the type 1 version 2 crashlog
    feature.
    
    Update the crashlog driver to support this crashlog
    version.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch d92ef94d0cf251e79cb570b101645c457ebf764c drm-intel
80a291047e93 platform/x86/intel/pmt: crashlog binary file endpoint
6e702379aa3b platform/x86/intel/pmt: update to bit access
9a6be8ac3df5 platform/x86/intel/pmt: decouple sysfs and namespace
4d6841e0bcd2 platform/x86/intel/pmt: support BMG crashlog
-:396: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#396: FILE: drivers/platform/x86/intel/pmt/crashlog.c:441:
+       struct intel_pmt_entry *entry = dev_get_drvdata(dev);$

-:397: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#397: FILE: drivers/platform/x86/intel/pmt/crashlog.c:442:
+       u32 sts_off = get_status_offset(&entry->header);$

-:398: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#398: FILE: drivers/platform/x86/intel/pmt/crashlog.c:443:
+       u32 ctl_off = get_control_offset(&entry->header);$

-:399: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#399: FILE: drivers/platform/x86/intel/pmt/crashlog.c:444:
+       struct crashlog_status status = {$

-:400: ERROR:CODE_INDENT: code indent should use tabs where possible
#400: FILE: drivers/platform/x86/intel/pmt/crashlog.c:445:
+               .status = readl(entry->disc_table + sts_off),$

-:400: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#400: FILE: drivers/platform/x86/intel/pmt/crashlog.c:445:
+               .status = readl(entry->disc_table + sts_off),$

-:401: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#401: FILE: drivers/platform/x86/intel/pmt/crashlog.c:446:
+       };$

-:402: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#402: FILE: drivers/platform/x86/intel/pmt/crashlog.c:447:
+       struct crashlog_control control = {$

-:403: ERROR:CODE_INDENT: code indent should use tabs where possible
#403: FILE: drivers/platform/x86/intel/pmt/crashlog.c:448:
+               .control = readl(entry->disc_table + ctl_off),$

-:403: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#403: FILE: drivers/platform/x86/intel/pmt/crashlog.c:448:
+               .control = readl(entry->disc_table + ctl_off),$

-:404: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#404: FILE: drivers/platform/x86/intel/pmt/crashlog.c:449:
+       };$

-:405: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#405: FILE: drivers/platform/x86/intel/pmt/crashlog.c:450:
+       int len = 0;$

-:407: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#407: FILE: drivers/platform/x86/intel/pmt/crashlog.c:452:
+       len += sysfs_emit_at(buf, len, "clear_support: %d\n", status.stat2.clear_support);$

-:408: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#408: FILE: drivers/platform/x86/intel/pmt/crashlog.c:453:
+       len += sysfs_emit_at(buf, len, "rearmed: %d\n", status.stat2.rearmed);$

-:409: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#409: FILE: drivers/platform/x86/intel/pmt/crashlog.c:454:
+       len += sysfs_emit_at(buf, len, "error: %d\n", status.stat2.error);$

-:410: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#410: FILE: drivers/platform/x86/intel/pmt/crashlog.c:455:
+       len += sysfs_emit_at(buf, len, "consumed: %d\n", status.stat2.consumed);$

-:411: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#411: FILE: drivers/platform/x86/intel/pmt/crashlog.c:456:
+       len += sysfs_emit_at(buf, len, "disable: %d\n", status.stat2.disable);$

-:412: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#412: FILE: drivers/platform/x86/intel/pmt/crashlog.c:457:
+       len += sysfs_emit_at(buf, len, "cleared: %d\n", status.stat2.cleared);$

-:413: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#413: FILE: drivers/platform/x86/intel/pmt/crashlog.c:458:
+       len += sysfs_emit_at(buf, len, "in_progress: %d\n", status.stat2.in_progress);$

-:414: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#414: FILE: drivers/platform/x86/intel/pmt/crashlog.c:459:
+       len += sysfs_emit_at(buf, len, "complete: %d\n", status.stat2.complete);$

-:415: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#415: FILE: drivers/platform/x86/intel/pmt/crashlog.c:460:
+       len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", sts_off, ctl_off);$

-:416: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#416: FILE: drivers/platform/x86/intel/pmt/crashlog.c:461:
+       len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status.status);$

-:417: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#417: FILE: drivers/platform/x86/intel/pmt/crashlog.c:462:
+       len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control.control);$

-:419: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#419: FILE: drivers/platform/x86/intel/pmt/crashlog.c:464:
+       return len;$

total: 2 errors, 22 warnings, 0 checks, 464 lines checked


