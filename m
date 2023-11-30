Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F216CC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 23:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F7886A4;
	Thu, 30 Nov 2023 23:27:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A74310E58D;
 Thu, 30 Nov 2023 23:27:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 567D4AADE1;
 Thu, 30 Nov 2023 23:27:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 30 Nov 2023 23:27:57 -0000
Message-ID: <170138687735.15641.17975843183551452013@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130183955.7-1-francois.dugast@intel.com>
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_Cleanup_and_future_proof_=28rev6=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev6)
URL   : https://patchwork.freedesktop.org/series/126535/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 448ed4b1ed3fb4d214eb39e988326ffd6daeeabd
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Nov 30 18:39:55 2023 +0000

    drm/xe/uapi: Kill exec_queue_set_property
    
    All the properties should be immutable and set upon exec_queue creation
    using the existent extension. So, let's kill this useless and dangerous
    uapi.
    
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 84f2c2adec155170779f65ff63b4e80a51d22448 drm-intel
93894cede drm/xe: Extend drm_xe_vm_bind_op
48e8af98c drm/xe/uapi: Separate bo_create placement from flags
8a6bfb74e drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
d45f0f84c drm/xe/uapi: Reject bo creation of unaligned size
31997439a drm/xe/uapi: Align on a common way to return arrays (memory regions)
17ea72409 drm/xe/uapi: Align on a common way to return arrays (gt)
253260e9b drm/xe/uapi: Align on a common way to return arrays (engines)
1c64a62e9 drm/xe/uapi: Split xe_sync types from flags
36123169d drm/xe/uapi: Kill tile_mask
be0660b31 drm/xe/uapi: Crystal Reference Clock updates
948d6f59f drm/xe/uapi: Add Tile ID information to the GT info query
c539d0e5a drm/xe/uapi: Fix various struct padding for 64b alignment
8a8a74b5c drm/xe/uapi: Move xe_exec after xe_exec_queue
-:55: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#55: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
e7a06f46d drm/xe/uapi: Use LR abbrev for long-running vms
843078c1e drm/xe: Remove unused extension definition
448ed4b1e drm/xe/uapi: Kill exec_queue_set_property


