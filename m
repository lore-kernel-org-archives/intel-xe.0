Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C39FE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA48F10E5A6;
	Mon,  6 Jan 2025 07:35:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269410E5A4;
 Mon,  6 Jan 2025 07:35:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Guarantee_?=
 =?utf-8?q?a_minimum_HBlank_time_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 07:35:26 -0000
Message-ID: <173614892614.59550.10079268901751329853@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106-hblank-v7-1-bc68dd614ea1@intel.com>
In-Reply-To: <20250106-hblank-v7-1-bc68dd614ea1@intel.com>
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

Series: drm/i915/dp: Guarantee a minimum HBlank time (rev7)
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
commit c42352eeebd736ceedebe530f89953e876b72771
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Jan 6 11:52:46 2025 +0530

    drm/i915/dp: Guarantee a minimum HBlank time
    
    Mandate a minimum Hblank symbol cycle count between BlankingStart and
    BlankingEnd in 8b/10b MST and 128b/132b mode.
    
    v2: Affine calculation/updation of min HBlank to dp_mst (Jani)
    v3: moved min_hblank from struct intel_dp to intel_crtc_state (Jani)
    v4: use max/min functions, change intel_xx *intel_xx to intel_xx *xx
        (Jani)
        Limit hblank to 511 and accommodate BS/BE in calculated value
        (Srikanth)
    v5: Some spelling corrections (Suraj)
    v6: Removed DP2.1 in comment as this is applicable for both DP2.1 and
        DP1.4 (Suraj)
    v7: crtc_state holds the logical values and the register value
        computation is moved to mst_enable() (Jani)
    
    Bspec: 74379
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 3241e60971d2944662d23a791a01a7c5cdc4230f drm-intel
c42352eeebd7 drm/i915/dp: Guarantee a minimum HBlank time
-:143: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#143: FILE: drivers/gpu/drm/i915/i915_reg.h:3202:
+#define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)

total: 0 errors, 1 warnings, 0 checks, 100 lines checked


