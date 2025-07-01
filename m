Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3188C8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 07:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1C210E517;
	Tue,  1 Jul 2025 07:31:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DA010E517;
 Tue,  1 Jul 2025 07:31:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Future-proof_for_multi-ti?=
 =?utf-8?q?le_+_multi-GT_cases_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 07:31:38 -0000
Message-ID: <175135509897.122633.2183495554930588349@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
In-Reply-To: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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

Series: Future-proof for multi-tile + multi-GT cases (rev4)
URL   : https://patchwork.freedesktop.org/series/150192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e20a6116a385364f1fad8374f25dbf8fb5391147
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Jun 30 15:15:16 2025 -0700

    drm/xe/xe_query: Use separate iterator while filling GT list
    
    The 'id' value updated by for_each_gt() is the uapi GT ID of the GTs
    being iterated over, and may skip over values if a GT is not present on
    the device.  Use a separate iterator for GT list array assignments to
    ensure that the array will be filled properly on future platforms where
    index in the GT query list may not match the uapi ID.
    
    v2:
     - Include the missing increment of the iterator.  (Jonathan)
    
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e6e27e79a726f8bf333d13521aba32f6466035a8 drm-intel
b49c223441fd drm/xe: Export xe_step_name for kunit tests
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
  ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
37a3f8ac3faa drm/xe: Track maximum GTs per tile on a per-platform basis
36e930fe4fe0 drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
4c4b7962bcee drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
bae9661d504f drm/xe: Don't compare GT ID to GT count when determining valid GTs
-:41: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_device.h:131:
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
e20a6116a385 drm/xe/xe_query: Use separate iterator while filling GT list


