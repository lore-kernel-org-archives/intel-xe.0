Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F51C282EC
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 03:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E6610E1A2;
	Sat,  8 Mar 2025 03:21:07 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BC310E1A2;
 Sat,  8 Mar 2025 03:21:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/gpusvm=3A_Fix_kernel-?=
 =?utf-8?q?doc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 03:21:05 -0000
Message-ID: <174140406578.4957.16764766494808417750@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307-fix-svm-kerneldoc-v2-1-03c74b199620@intel.com>
In-Reply-To: <20250307-fix-svm-kerneldoc-v2-1-03c74b199620@intel.com>
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

Series: drm/gpusvm: Fix kernel-doc (rev2)
URL   : https://patchwork.freedesktop.org/series/146005/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b62c945b2f08163adda6ae6d6796a541657875c0
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Mar 7 17:14:28 2025 -0800

    drm/gpusvm: Fix kernel-doc
    
    Due to wrong `.. kernel-doc` directive in Documentation/gpu/rfc/gpusvm.rst
    the documentation was actually not parsing anything from
    drivers/gpu/drm/drm_gpusvm.c. This fixes the kernel-doc include and all
    warnings/errors created when doing so.
    
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: Dave Airlie <airlied@redhat.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Closes: https://lore.kernel.org/intel-xe/20250307195239.57abcd2d@canb.auug.org.au/
    Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
b62c945b2f08 drm/gpusvm: Fix kernel-doc


