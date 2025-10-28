Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C077DCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8711510E3CB;
	Tue, 28 Oct 2025 12:38:54 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4F10E3BE;
 Tue, 28 Oct 2025 12:38:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 12:38:54 -0000
Message-ID: <176165513418.62904.4782585140065189578@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/156648/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d744f3ceeb80fe4086c57e5277544e1c657c93e2
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Oct 28 17:37:46 2025 +0530

    drm/i915/display: Expose sharpness strength property
    
    Expose the drm crtc sharpness strength property which will enable
    or disable the sharpness/casf based on user input. With this user
    can set/update the strength of the sharpness or casf filter.
    
    v2: Update subject[Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 894bc3ad572262b3c29e8cf0352adaa07275dbfc drm-intel
879764f6cd76 drm/drm_crtc: Introduce sharpness strength property
d182484468db drm/i915/display: Introduce HAS_CASF for sharpness support
d805281057d3 drm/i915/display: Add CASF strength and winsize
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
91a75c1ca032 drm/i915/display: Add filter lut values
f6ca6e55d4d3 drm/i915/display: Compute the scaler coefficients
8a178df9374a drm/i915/display: Add and compute scaler parameter
0de607c91e41 drm/i915/display: Configure the second scaler
6006f40f4bcc drm/i915/display: Set and get the casf config
24f681a8f822 drm/i915/display: Enable/disable casf
d744f3ceeb80 drm/i915/display: Expose sharpness strength property


