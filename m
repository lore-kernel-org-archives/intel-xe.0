Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C758EECD996
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 18:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659B89358;
	Thu,  5 Feb 2026 18:57:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6D89358;
 Thu,  5 Feb 2026 18:57:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_per_queue?=
 =?utf-8?q?_programming_of_COMMON=5FSLICE=5FCHICKEN3_bit13?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lionel Landwerlin" <lionel.g.landwerlin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 18:57:11 -0000
Message-ID: <177031783102.228151.1975408150994922932@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
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

Series: drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13
URL   : https://patchwork.freedesktop.org/series/161212/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b41e7b027d57e3421ba481eb2efd61c6d690c3c7
Author: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date:   Thu Feb 5 20:52:48 2026 +0200

    drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13
    
    Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
    ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
    people have decided to not rely on putting the register on the
    allowlist for UMD to program and instead have context/queue creation
    flag.
    
    This is a recommended tuning setting for both gen12 and Xe_HP
    platforms.
    
    Bspec: 73993, 73994, 31870, 68331
    Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+ /mt/dim checkpatch f32d8500ec1a75b4c8dd4ca75cba6ce85f525a96 drm-intel
b41e7b027d57 drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13
-:54: ERROR:CODE_INDENT: code indent should use tabs where possible
#54: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:861:
+                         q->class != XE_ENGINE_CLASS_COMPUTE))$

-:54: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#54: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:861:
+                         q->class != XE_ENGINE_CLASS_COMPUTE))$

total: 1 errors, 1 warnings, 0 checks, 100 lines checked


