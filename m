Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5642CC282DE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 00:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4B710E23A;
	Fri, 14 Mar 2025 00:09:55 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D782310E23A;
 Fri, 14 Mar 2025 00:09:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Apply_Wa=5F1602?=
 =?utf-8?q?3105232_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 00:09:53 -0000
Message-ID: <174191099386.31450.15553564487978704673@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250313235850.1583584-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250313235850.1583584-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Apply Wa_16023105232 (rev5)
URL   : https://patchwork.freedesktop.org/series/145449/
State : warning

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
commit 3a2bae0c7357e1e585250d332e9d1b8fac901fb2
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Mar 13 16:58:50 2025 -0700

    drm/xe: Apply Wa_16023105232
    
    The WA requires KMD to disable DOP clock gating during a semaphore
    wait and also ensure that idle delay for every CS is lower than the
    idle wait time in the PWRCTX_MAXCNT register. Default values for these
    registers already comply with this restriction.
    
    v2: Store timestamp_base in gt info and other comments (Daniele)
    v3: Skip WA check for VF
    v4: Review comments (Matt Roper)
    v5: Cleanup the clock functions and use reg_field_get (Matt Roper)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch d7e9873f7923d139bdd258f4061751b5bfae468f drm-intel
3a2bae0c7357 drm/xe: Apply Wa_16023105232
-:159: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'idledly >= maxcnt'
#159: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:588:
+		if (xe_gt_WARN_ON(gt, (idledly >= maxcnt) || inhibit_switch)) {

total: 0 errors, 0 warnings, 1 checks, 155 lines checked


