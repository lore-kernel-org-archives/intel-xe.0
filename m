Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780E9E7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 13:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3075410E2C1;
	Mon,  2 Oct 2023 13:53:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3A10E2C1;
 Mon,  2 Oct 2023 13:53:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F3E2BAADE1;
 Mon,  2 Oct 2023 13:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 02 Oct 2023 13:53:46 -0000
Message-ID: <169625482699.3204.8030799524553411418@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002102359.3740026-1-jouni.hogander@intel.com>
In-Reply-To: <20231002102359.3740026-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fr?=
 =?utf-8?q?ontbuffer_tracking_and_dirtyfb_=28rev4=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Frontbuffer tracking and dirtyfb (rev4)
URL   : https://patchwork.freedesktop.org/series/123751/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af1b07da4825d09370cc75f1f4b0746824248468
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Oct 2 13:23:59 2023 +0300

    fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
    
    Generic dirtyfb implementation which Xe is currently using is doing atomic
    commit which is inefficient. We have now dma fence handling in our dirtyfb
    implementation. This works with Xe and CPU/GPU frontbuffer rendering as
    long as sync objects are imported by userspace
    (dma_buf_import_sync_file). Switch to our custom dirtyfb implementation.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 13da205daec6272347232c2c523fe8cde8b67e35 drm-intel
fa1da69de drm/xe: Add empty def for i915_gem_object_flush_if_display
42ac5331d Revert "FIXME: drm/i915: More display ugly wa needed after rebase"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4bf10efdff69a34bfa55813593bfecbf6f5d6db9', maybe rebased or not pulled?
#10: 
This reverts commit 4bf10efdff69a34bfa55813593bfecbf6f5d6db9.

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
2b8c96c4a drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
af1b07da4 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile


