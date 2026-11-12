Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC83606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 02:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95ED10EB2F;
	Thu, 12 Nov 2026 02:14:52 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8578110EB2D;
 Thu, 12 Nov 2026 02:14:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_platform/x86/intel/pmt=3A?=
 =?utf-8?q?_Notify_userspace_when_crashlogs_complete_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 02:14:52 -0000
Message-ID: <179444969254.12913.11295477783930519040@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <cover.1794444671.git.david.e.box@linux.intel.com>
In-Reply-To: <cover.1794444671.git.david.e.box@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: platform/x86/intel/pmt: Notify userspace when crashlogs complete (rev2)
URL   : https://patchwork.freedesktop.org/series/176683/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1262ce7e7fa10a02fb22ad6a41cba676b0ba4a36
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Wed Nov 11 18:08:18 2026 -0800

    platform/x86/intel/pmt: Notify userspace when crashlogs complete
    
    A crashlog may already be complete when the driver binds, or it may
    complete asynchronously after a manual trigger. Userspace currently has to
    poll the status attributes to find out when data is ready.
    
    Emit a KOBJ_CHANGE uevent on the crashlog<x> device carrying
    INTEL_PMT_CRASHLOG_COMPLETE:
    
      - at probe, set to 1 if a completed crashlog is present
      - after a manual trigger, set to 1 when the capture completes, or 0
        if it has not completed within 5 seconds
    
    Writing 0 to trigger, clearing, rearming or disabling the crashlog while
    the trigger poll is running ends it without an event. Because the class
    device's attributes are created after its KOBJ_ADD, the probe-time event is
    also the first point at which userspace can reliably read a log captured
    before the driver bound.
    
    Trigger completion is polled every 100 ms from a delayed work item. The
    probe-time check also runs from a work item, queued at the end of probe,
    rather than from probe itself. This is because register access may go
    through the parent's read_reg() callback, and the upcoming xe support for
    Crescent Island (CRI) holds the lock that callback takes across
    intel_vsec_register() when it registers late, after its firmware is ready.
    With pmt_crashlog already loaded, probe runs synchronously within that
    call, so reading a register from probe would deadlock on the lock the
    caller already holds. Both work items run on the freezable workqueue so the
    device is not accessed during suspend.
    
    Manual triggers are rejected with -EBUSY until probe has set up all
    entries, and the probe-time check is skipped once a trigger has been
    accepted, so each capture is reported once. The work items are disabled and
    drained on removal.
    
    Document the uevent in the sysfs-class-intel_pmt ABI file.
    
    Tested-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
    Signed-off-by: David E. Box <david.e.box@linux.intel.com>
+ /mt/dim checkpatch f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c drm-intel
1262ce7e7fa1 platform/x86/intel/pmt: Notify userspace when crashlogs complete
-:145: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#145: FILE: drivers/platform/x86/intel/pmt/crashlog.c:292:
+	char *envp[] = {

total: 0 errors, 1 warnings, 0 checks, 306 lines checked


