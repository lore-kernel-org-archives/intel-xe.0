Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57147C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 03:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0AC10E4A8;
	Wed, 15 Nov 2023 03:37:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64BE310E412;
 Wed, 15 Nov 2023 03:37:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 61A46AADF5;
 Wed, 15 Nov 2023 03:37:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 15 Nov 2023 03:37:24 -0000
Message-ID: <170001944439.645.7930027388547025013@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115031508.173140-1-matthew.brost@intel.com>
In-Reply-To: <20231115031508.173140-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Only_set_xe=5Fvma=5Fop=2Emap_fields_for_GPUVA_map_opera?=
 =?utf-8?q?tions?=
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

Series: drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
URL   : https://patchwork.freedesktop.org/series/126438/
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
commit 8fcbc7eb123d8c066e018b136701165edbeae1d7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Nov 14 19:15:08 2023 -0800

    drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
    
    XE_VM_BIND_OP_MAP_* IOCTL operations can result in GPUVA unmap, remap,
    or map operations in vm_bind_ioctl_ops_create. The xe_vma_op.map fields
    are blindly set which is incorrect for GPUVA unmap or remap operations.
    Fix this by only setting xe_vma_op.map for GPUVA map operations. Also
    restructure a bit vm_bind_ioctl_ops_create to make the code a bit more
    readable.
    
    Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
    Signec-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2fe82053d916d09ffcc92bc27294c9eed4e4804b drm-intel
8fcbc7eb1 drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Signec-off-by: Matthew Brost <matthew.brost@intel.com>

-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Signec-off-by:' - perhaps 'Signed-off-by:'?
#15: 
Signec-off-by: Matthew Brost <matthew.brost@intel.com>

-:111: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 88 lines checked


