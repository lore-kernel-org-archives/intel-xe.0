Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1CEC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C1510E57F;
	Thu, 27 Jul 2023 13:05:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF8C310E581;
 Thu, 27 Jul 2023 13:05:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CBCD6A882E;
 Thu, 27 Jul 2023 13:05:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 27 Jul 2023 13:05:48 -0000
Message-ID: <169046314883.19795.349908681101231155@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726210352.390864-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230726210352.390864-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Invert_mask_and_val_in_xe=5Fmmio=5Fwait32=2E?=
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

Series: drm/xe: Invert mask and val in xe_mmio_wait32.
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
commit f4c48cb23e3a6bc772b87be71c0de745f2a49e81
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Jul 26 17:03:52 2023 -0400

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
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6dc7ee6d03e78d12f132a503fa47428fb2d4bb41 drm-intel
f4c48cb23 drm/xe: Invert mask and val in xe_mmio_wait32.


