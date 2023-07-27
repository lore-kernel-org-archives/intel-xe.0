Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB07C001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 15:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F63110E5B0;
	Thu, 27 Jul 2023 15:48:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C49A10E5B4;
 Thu, 27 Jul 2023 15:48:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 492C9AADD7;
 Thu, 27 Jul 2023 15:48:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 27 Jul 2023 15:48:09 -0000
Message-ID: <169047288929.19795.9750113318987863341@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230727135334.403255-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230727135334.403255-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Invert_mask_and_val_in_xe=5Fmmio=5Fwait32=2E_=28rev2=29?=
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

Series: drm/xe: Invert mask and val in xe_mmio_wait32. (rev2)
URL   : https://patchwork.freedesktop.org/series/121388/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 953fa2d5b787a523e48d219844ce07120b30e25b
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Jul 27 09:53:34 2023 -0400

    drm/xe: Invert mask and val in xe_mmio_wait32.
    
    The order: 'offset, mask, val'; is more common in other
    drivers and in special in i915, where any dev could copy
    a sequence and end up with unexpected behavior.
    
    Done with coccinelle:
    @rule1@
    expression gt, reg, val, mask, timeout, out, atomic;
    @@
    - xe_mmio_wait32(gt, reg, val, mask, timeout, out, atomic)
    + xe_mmio_wait32(gt, reg, mask, val, timeout, out, atomic)
    
    spatch -sp_file mmio.cocci *.c *.h compat-i915-headers/intel_uncore.h \
           --in-place
    
    v2: Rebased after changes on xe_guc_mcr usage of xe_mmio_wait32.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 580f19a11f9c682fa0f2c6b89578ae07226c3793 drm-intel
953fa2d5b drm/xe: Invert mask and val in xe_mmio_wait32.


