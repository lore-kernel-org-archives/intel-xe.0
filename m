Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2E606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6411276D;
	Fri, 30 Oct 2026 11:51:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A85112771;
 Fri, 30 Oct 2026 11:51:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ptl+=3A_Fix_eDP_?=
 =?utf-8?q?support_on_TypeC_PHYs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 11:51:35 -0000
Message-ID: <179336109523.93593.9191262414197217107@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029113017.618286-1-imre.deak@intel.com>
In-Reply-To: <20261029113017.618286-1-imre.deak@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/ptl+: Fix eDP support on TypeC PHYs (rev2)
URL   : https://patchwork.freedesktop.org/series/177147/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1329dc59805d438adc5eaf96f2b3ca2b35d45385
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Oct 29 13:30:17 2026 +0200

    drm/i915/ptl+: Fix TypeC detection for eDP on port B
    
    On PTL+ platforms with eDP on TypeC, port B's DDI is connected to a C20
    TypeC PHY. Identify PHY B as TypeC and map port B to TC_PORT_1 when eDP
    TypeC support is enabled.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9196
    CC: stable@vger.kernel.org # 6.14+
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 29f9258a2788a1066c0910c480e65c80887f4d20 drm-intel
011028fe6127 drm/i915/dp_aux: Take the TypeC port lock after the PPS lock
-:87: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
abbfc025f79c drm/i915/pps: Hold a TypeC link reference for PPS VDD
-:96: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
3528eac00135 drm/i915/pps: Reset PPS state after TypeC port init on resume
-:34: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
aa54ad9b8eff drm/i915/ptl+: Add TypeC HPD pin selection for port B
-:29: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
6d6fddcbd2d9 drm/i915/mtl+: Use PHY type to identify TypeC ports in PLL ID lookup
-:37: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
1329dc59805d drm/i915/ptl+: Fix TypeC detection for eDP on port B
-:49: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


