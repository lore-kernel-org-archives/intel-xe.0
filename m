Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33830C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 02:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED9110E8BC;
	Fri, 13 Jun 2025 02:18:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48910E82A;
 Fri, 13 Jun 2025 02:18:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_WildCat_Lake_support_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 02:18:01 -0000
Message-ID: <174978108117.74585.2023153273678529604@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612203448.2948795-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250612203448.2948795-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support (rev5)
URL   : https://patchwork.freedesktop.org/series/149794/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 365d6fcb54956110b7a8171af169ce717c6084e6
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Fri Jun 13 02:04:48 2025 +0530

    drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02
    
    wa_16023981245 need to be extended for display version 30.02
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch 07cb1c19ef8056f2f964909c9273b3c45049760e drm-intel
33f38bff25bb drm/i915/xe3lpd: Add support for display version 30.02
5b307c4d6600 drm/xe/xe3: Add support for graphics IP version 30.03
c9643f8dcaf0 drm/xe/xe3: Add support for media IP version 30.02
-:12: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Matt Roper <matthew.d.roper@intel.com>:q', should be: 'Matt Roper <matthew.d.roper@intel.com> (:q)'
#12: 
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>:q

-:64: CHECK:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email comments mismatch: 'From: Matt Roper <matthew.d.roper@intel.com>' != 'Signed-off-by: Matt Roper <matthew.d.roper@intel.com>:q'

total: 0 errors, 1 warnings, 1 checks, 34 lines checked
134a7633f1da drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
102b84f1a9f5 drm/i915: Set max cdclk for display 30.02
a1bd955a2a94 drm/xe: Add Wildcat Lake device IDs to PTL list
132bf6c1d8c3 drm/i915/xe3lpd: Extend DMC load path for display version 30.02
6272062d85bf drm/i915/wcl: C10 phy connected to port A and B
365d6fcb5495 drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02


