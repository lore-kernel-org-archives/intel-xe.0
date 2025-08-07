Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A24C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 09:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3301210E330;
	Thu,  7 Aug 2025 09:41:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796A110E330;
 Thu,  7 Aug 2025 09:41:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 09:41:08 -0000
Message-ID: <175455966849.218927.16813209827025978072@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property
URL   : https://patchwork.freedesktop.org/series/152615/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 899136806e6be2fd3909412e22373f5d5e7331ce
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Thu Aug 7 14:58:41 2025 +0530

    drm/i915/display: Expose sharpness strength property
    
    Expose the drm crtc sharpness strength property which will enable
    or disable the sharpness/casf based on user input. With this user
    can set/update the strength of the sharpness or casf filter.
    
    v2: Update subject[Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch e75fad13646be2a02f21a8e9d438b3150108950d drm-intel
1fce5ba678fb drm/drm_crtc: Introduce sharpness strength property
4cc9b6e5c290 drm/i915/display: Introduce HAS_CASF for sharpness support
b373bc69df9c drm/i915/display: Add strength and winsize register
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 188 lines checked
c39638068e41 drm/i915/display: Add filter lut values
5737ee8a1be4 drm/i915/display: Compute the scaler coefficients
efa36bb57013 drm/i915/display: Add and compute scaler parameter
88f642334197 drm/i915/display: Configure the second scaler
5e57135f5a43 drm/i915/display: Set and get the casf config
e6101fe51428 drm/i915/display: Enable/disable casf
899136806e6b drm/i915/display: Expose sharpness strength property


