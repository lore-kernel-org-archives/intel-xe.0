Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772C7CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 11:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286C710E10B;
	Thu,  9 Oct 2025 11:11:52 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B289E3F;
 Thu,  9 Oct 2025 11:11:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_allow_e?=
 =?utf-8?q?victing_of_BOs_in_same_VM_in_array_of_VM_binds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Oct 2025 11:11:50 -0000
Message-ID: <176000831023.22984.11416339511057994335@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009110618.3481870-1-matthew.brost@intel.com>
In-Reply-To: <20251009110618.3481870-1-matthew.brost@intel.com>
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

Series: drm/xe: Don't allow evicting of BOs in same VM in array of VM binds (rev2)
URL   : https://patchwork.freedesktop.org/series/155637/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5edf6405ba76eedd1f0a7814b6bb541ead7cb02
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Oct 9 04:06:18 2025 -0700

    drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
    
    An array of VM binds can potentially evict other buffer objects (BOs)
    within the same VM under certain conditions, which may lead to NULL
    pointer dereferences later in the bind pipeline. To prevent this, clear
    the allow_res_evict flag in the xe_bo_validate call.
    
    v2:
     - Invert polarity of no_res_evict (Thomas)
     - Add comment in code explaining issue (Thomas)
    
    Cc: stable@vger.kernel.org
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
    Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm in none fault mode")
    Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind IOCTL")
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch 0406d0518ff3a69ea611bfaf02a2f76d715156cb drm-intel
a5edf6405ba7 drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
-:58: CHECK:LINE_SPACING: Please don't use multiple blank lines
#58: FILE: drivers/gpu/drm/xe/xe_vm.c:2948:
+
+

total: 0 errors, 0 warnings, 1 checks, 97 lines checked


