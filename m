Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAEACE7CE5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442610E0F4;
	Tue,  1 Oct 2024 08:00:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2F10E0F4;
 Tue,  1 Oct 2024 08:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Guarantee_?=
 =?utf-8?q?a_minimum_HBlank_time_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 08:00:12 -0000
Message-ID: <172776961259.1140908.743654815324076128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001074348.2193502-1-arun.r.murthy@intel.com>
In-Reply-To: <20241001074348.2193502-1-arun.r.murthy@intel.com>
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

Series: drm/i915/dp: Guarantee a minimum HBlank time (rev2)
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
commit d7b9f7fa2f2d2fe83c465946a383b4271b16dfe7
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Oct 1 13:13:48 2024 +0530

    drm/i915/dp: Guarantee a minimum HBlank time
    
    Mandate a minimum Hblank symbol cycle count between BS and BE in 8b/10b
    MST and 12b/132b mode.
    Spec: DP2.1a
    
    v2: Affine calculation/updation of min HBlank to dp_mst (Jani)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 126b085652ff525948f88b62128ec9d95e00e281 drm-intel
d7b9f7fa2f2d drm/i915/dp: Guarantee a minimum HBlank time
-:52: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:176:
+	hblank = DIV_ROUND_UP((DIV_ROUND_UP(adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16), symbol_size);

-:92: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#92: FILE: drivers/gpu/drm/i915/i915_reg.h:1143:
+#define DP_MIN_HBLANK_CTL(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans), _DP_MIN_HBLANK_CTL_A)

total: 0 errors, 2 warnings, 0 checks, 66 lines checked


