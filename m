Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A5C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 04:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247D110E35A;
	Thu, 10 Apr 2025 04:11:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6210E35A;
 Thu, 10 Apr 2025 04:11:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Large_devcoredump_file_su?=
 =?utf-8?q?pport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 04:11:26 -0000
Message-ID: <174425828696.54719.12082724992654661153@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250410040622.238389-1-matthew.brost@intel.com>
In-Reply-To: <20250410040622.238389-1-matthew.brost@intel.com>
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

Series: Large devcoredump file support
URL   : https://patchwork.freedesktop.org/series/147503/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e1cc130e4ad491048ebe6eb52a175b48c08676f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Apr 9 21:06:22 2025 -0700

    drm/xe: Abort printing coredump in VM printer output if full
    
    Abort printing coredump in VM printer output if full. Helps speedup
    large coredumps which need to walked multiple times in
    xe_devcoredump_read.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch c54633598106dbdb97f3aa589587b8176009b6d8 drm-intel
10a556e9e78a drm/xe: Add devcoredump chunking
d7c72e3d9820 drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
296fffce9e01 drm/print: Add drm_printer_is_full
5e1cc130e4ad drm/xe: Abort printing coredump in VM printer output if full


