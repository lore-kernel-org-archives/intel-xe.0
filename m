Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC66FC61DF7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 14:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AC410E762;
	Thu, 23 Nov 2023 14:14:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2151110E762;
 Thu, 23 Nov 2023 14:14:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1DE03AADD1;
 Thu, 23 Nov 2023 14:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 23 Nov 2023 14:14:46 -0000
Message-ID: <170074888611.8136.3396318951121923770@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122143833.7-1-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_Cleanup_and_future_proof_=28rev5=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev5)
URL   : https://patchwork.freedesktop.org/series/126535/
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
commit df3b0178c4df3298cb57349789447f7a4d3b9187
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Nov 22 14:38:33 2023 +0000

    drm/xe/uapi: Move xe_exec after xe_exec_queue
    
    Although the exec ioctl is a very important one, it makes no sense
    to explain xe_exec before explaining the exec_queue. So, let's
    move this down to help bring a better flow on the documentation
    and code readability.
    
    It is important to highlight that this patch is changing all
    the ioctl numbers in a non-backward compatible way. However, we
    are doing this final uapi clean-up before we submit our first
    pull-request to be part of the upstream Kernel. Once we get
    there, no other change like this will ever happen and all the
    backward compatibility will be respected.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 501feae7afed8e9b21700d1185532c18d62ca33a drm-intel
8b3c05e18 drm/xe: Extend drm_xe_vm_bind_op
d718d7901 drm/xe/uapi: Separate bo_create placement from flags
72a9355cc drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
20cc3ae40 drm/xe/uapi: Reject bo creation of unaligned size
c986f5d1c drm/xe/uapi: Align on a common way to return arrays (memory regions)
d4278dfab drm/xe/uapi: Align on a common way to return arrays (gt)
de75a6cf1 drm/xe/uapi: Align on a common way to return arrays (engines)
f9bd0b4ea drm/xe/uapi: Split xe_sync types from flags
05169e680 drm/xe/uapi: Kill tile_mask
74f0bb078 drm/xe/uapi: Crystal Reference Clock updates
24cb39fda drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL
f13a968b0 drm/xe/uapi: Add Tile ID information to the GT info query
a41b6b9f1 drm/xe/uapi: Fix various struct padding for 64b alignment
df3b0178c drm/xe/uapi: Move xe_exec after xe_exec_queue
-:51: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#51: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


