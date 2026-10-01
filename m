Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A0DCA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 22:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1191010E261;
	Thu,  1 Oct 2026 22:11:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665910E261;
 Thu,  1 Oct 2026 22:11:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_platform/x86/intel/pmt=3A?=
 =?utf-8?q?_Fix_crashlog_regressions_and_add_completion_uevent?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 22:11:23 -0000
Message-ID: <179089268302.231058.8628826035072294489@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
In-Reply-To: <20261001220351.1592138-1-david.e.box@linux.intel.com>
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

Series: platform/x86/intel/pmt: Fix crashlog regressions and add completion uevent
URL   : https://patchwork.freedesktop.org/series/175385/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d35b2f6732a0a544604f750c1c7866877b3e27dc
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Thu Oct 1 15:03:48 2026 -0700

    platform/x86/intel/pmt: Notify userspace when crashlogs complete
    
    A crashlog may already be complete when the driver binds, or it may
    complete asynchronously after userspace requests a manual trigger.
    Userspace otherwise has to poll to discover that data is ready.
    
    Emit a KOBJ_CHANGE uevent on the per-instance crashlog device when a
    completed log is found at probe. After a manual trigger, poll the
    completion bit at 100 ms intervals for up to 5 seconds and emit the same
    event when capture completes. The event carries two environment
    variables:
    
      INTEL_PMT_CRASHLOG_EVENT=PRESENT
      INTEL_PMT_CRASHLOG_COMPLETE=1
    
    Initialize the work items before the device's sysfs attributes are
    exposed, and disable and drain them during removal.
    
    Document the new uevent in the sysfs-class-intel_pmt ABI file.
    
    Assisted-by: LLM
    Signed-off-by: David E. Box <david.e.box@linux.intel.com>
+ /mt/dim checkpatch 6dc4226c266135bf90cdfb7a5e72350334144cb7 drm-intel
8db70235e721 platform/x86/intel/pmt: Fix NULL dereference when reading crashlog data
a6cf6efe5046 platform/x86/intel/vsec: Fix inverted walk_header() test in get_features()
d35b2f6732a0 platform/x86/intel/pmt: Notify userspace when crashlogs complete
-:100: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#100: FILE: drivers/platform/x86/intel/pmt/crashlog.c:242:
+	char *envp[] = {

total: 0 errors, 1 warnings, 0 checks, 159 lines checked


