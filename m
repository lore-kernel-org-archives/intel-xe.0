Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED8FF6E97
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 23:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402910E694;
	Tue, 17 Mar 2026 23:24:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BAE10E694;
 Tue, 17 Mar 2026 23:24:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Wait_for_HW_cle?=
 =?utf-8?q?arance_before_issuing_the_next_TLB_inval=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 23:24:40 -0000
Message-ID: <177378988095.369304.7608445930880131674@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317232133.4106716-1-fei.yang@intel.com>
In-Reply-To: <20260317232133.4106716-1-fei.yang@intel.com>
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

Series: drm/xe: Wait for HW clearance before issuing the next TLB inval.
URL   : https://patchwork.freedesktop.org/series/163417/
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
commit c8107a615e011397c11a96cf80e6762cba7b88df
Author: Fei Yang <fei.yang@intel.com>
Date:   Tue Mar 17 16:21:33 2026 -0700

    drm/xe: Wait for HW clearance before issuing the next TLB inval.
    
    Hardware requires the software to poll the valid bit and make sure it's
    cleared before issuing a new TLB invalidation request.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
+ /mt/dim checkpatch c479cdf62a3f9a6101dd020abbc471f35142b3d1 drm-intel
c8107a615e01 drm/xe: Wait for HW clearance before issuing the next TLB inval.
-:29: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#29: FILE: drivers/gpu/drm/xe/xe_guc_tlb_inval.c:90:
+			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


