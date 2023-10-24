Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16817C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 09:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52810E30B;
	Tue, 24 Oct 2023 09:40:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DF1010E30B;
 Tue, 24 Oct 2023 09:40:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6C56DAA916;
 Tue, 24 Oct 2023 09:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Tue, 24 Oct 2023 09:40:26 -0000
Message-ID: <169814042644.18361.2593623373975323811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
In-Reply-To: <20231023063420.3298731-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?vert_remaining_local_fb_tracking_patches_and_backport_=28rev2?=
 =?utf-8?q?=29?=
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

Series: Revert remaining local fb tracking patches and backport (rev2)
URL   : https://patchwork.freedesktop.org/series/125437/
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
commit daf6a919c5ccb1e43074441064ce25607ad72a2a
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Oct 23 09:34:20 2023 +0300

    drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
    
    Xe and i915 objects have differing implementation. Use intel_bo_to_drm_bo
    instead of obj->base as xe_bo doesn't have base pointer.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231012072158.4115795-3-jouni.hogander@intel.com
    (cherry picked from commit 3594d00b71eea66d183b310c19aa5a6bf4206e62)
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
4dd92ab22 Revert "drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c6592b46a51db52f808b5a19e1ae8f797f8be38a', maybe rebased or not pulled?
#10: 
This reverts commit c6592b46a51db52f808b5a19e1ae8f797f8be38a.

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
1290281f8 Revert "drm/i915/display: Move releasing gem object away from fb tracking"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '86e3f63f9f1e9bbc3290955c316b17103ef5113e', maybe rebased or not pulled?
#10: 
This reverts commit 86e3f63f9f1e9bbc3290955c316b17103ef5113e.

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
fae6eda17 drm/i915/display: Move releasing gem object away from fb tracking
daf6a919c drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base


