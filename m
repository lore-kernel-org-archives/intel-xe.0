Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD67BC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 21:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C321132CC;
	Fri,  3 May 2024 21:51:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A1A1132CC;
 Fri,  3 May 2024 21:51:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vm=3A_Wait_for_ava?=
 =?utf-8?q?ilability_if_fault_mode_is_mismatched?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 21:51:35 -0000
Message-ID: <171477309533.1887279.16345986421737767698@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/vm: Wait for availability if fault mode is mismatched
URL   : https://patchwork.freedesktop.org/series/133188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5731bfcca5a8c0a410c08b6ad84f9bbbc304318
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri May 3 12:01:38 2024 -0700

    drm/xe/vm: Wait for availability if fault mode is mismatched
    
    Just because xe_device_in_non_fault_mode (or, equivalently,
    xe_device_in_fault_mode) do not match the requested VM type does not
    mean that running the VM in that mode is invalid.  It only means that
    there presently exists a VM active on the system that does not match the
    requested type.  The VM could be left over from an old test that wasn't
    cleaned up properly, but the more likely cause is that multiple tests
    running concurrently is resulting in the system falsely report that the
    VM fault mode is not supported.
    
    Instead of saying the VM cannot be created, ask the user to try again later.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
    Suggested-by: Brian Welty: <brian.welty@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch ca96a1c62451ea534391d1eafe3a0b5691658c02 drm-intel
e5731bfcca5a drm/xe/vm: Wait for availability if fault mode is mismatched
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
Instead of saying the VM cannot be created, ask the user to try again later.

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


