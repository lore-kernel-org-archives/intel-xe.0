Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02FBC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2E410E7F8;
	Fri, 21 Mar 2025 16:17:53 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C33210E7F8;
 Fri, 21 Mar 2025 16:17:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 16:17:52 -0000
Message-ID: <174257387257.65466.9943549636609970405@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
In-Reply-To: <20250321160628.2663912-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev11)
URL   : https://patchwork.freedesktop.org/series/139954/
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
commit f745ee06a3f271b50299ad3a016bf912af77b739
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Fri Mar 21 21:36:28 2025 +0530

    drm/i915/display: Expose sharpness strength property
    
    Expose the drm crtc sharpness strength property which will enable
    or disable the sharpness/casf based on user input. With this user
    can set/update the strength of the sharpness or casf filter.
    
    v2: Update subject[Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 8eb742743bae7e1a6b7c150768ba683a502a1d79 drm-intel
357735f1d7f6 drm/i915/display: Introduce sharpness strength property
dd5adb38eed2 drm/i915/display: Introduce HAS_CASF for sharpness support
fbc1b8375c99 drm/i915/display: Add sharpness strength and winsize
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 191 lines checked
0751004fbf04 drm/i915/display: Add filter lut values
7567459c28fd drm/i915/display: Compute the scaler filter
0ad0eeec3790 drm/i915/display: Add and compute scaler parameter
645eddbe72da drm/i915/display: Configure the second scaler for
049cb8cf89bd drm/i915/display: Compare the sharpness state
88648291d3ef drm/i915/display: Set a scaler mode
3929c448bbb3 drm/i915/display: Write and read back the casf registers
8a0e1ab8fc9e drm/i915/display: Enable/disable casf
f745ee06a3f2 drm/i915/display: Expose sharpness strength property


