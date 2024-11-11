Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673A2D2E9D0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 10:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B98910E077;
	Mon, 11 Nov 2024 10:01:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9406B10E077;
 Mon, 11 Nov 2024 10:01:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Guarantee_?=
 =?utf-8?q?a_minimum_HBlank_time_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 10:01:27 -0000
Message-ID: <173131928760.2530272.16527411382643535514@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111092608.129410-1-arun.r.murthy@intel.com>
In-Reply-To: <20241111092608.129410-1-arun.r.murthy@intel.com>
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

Series: drm/i915/dp: Guarantee a minimum HBlank time (rev4)
URL   : https://patchwork.freedesktop.org/series/139268/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 479b896c2266343cc4e22cafff4cb3e4887c7e3a
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Nov 11 14:56:08 2024 +0530

    drm/i915/dp: Guarantee a minimum HBlank time
    
    Mandate a minimum Hblank symbol cycle count between BS and BE in 8b/10b
    MST and 12b/132b mode.
    Spec: DP2.1a
    
    v2: Affine calculation/updation of min HBlank to dp_mst (Jani)
    v3: moved min_hblank from struct intel_dp to intel_crtc_state (Jani)
    v4: use max/min functions, change intel_xx *intel_xx to intel_xx *xx
        (Jani)
        Limit hblank to 511 and accomodate BS/BE in calculated value
        (Srikanth)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 3f866f737f2b5b35056783cd2b8bce2c1b00ab47 drm-intel
479b896c2266 drm/i915/dp: Guarantee a minimum HBlank time
-:14: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#14: 
    Limit hblank to 511 and accomodate BS/BE in calculated value
                            ^^^^^^^^^^

-:66: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:179:
+	hblank = DIV_ROUND_UP((DIV_ROUND_UP(adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16), symbol_size);

-:113: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#113: FILE: drivers/gpu/drm/i915/i915_reg.h:3490:
+#define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)

total: 0 errors, 3 warnings, 0 checks, 77 lines checked


