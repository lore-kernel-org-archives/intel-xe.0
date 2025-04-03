Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C5C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 07:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335B610E193;
	Thu,  3 Apr 2025 07:11:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D2E10E193;
 Thu,  3 Apr 2025 07:11:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 07:11:07 -0000
Message-ID: <174366426752.31184.16519982523236010504@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402125647.361295-1-nemesa.garg@intel.com>
In-Reply-To: <20250402125647.361295-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev12)
URL   : https://patchwork.freedesktop.org/series/139954/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e76a5363382d39232fe5da5460e7e6f4695c0d64
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Apr 2 18:26:47 2025 +0530

    drm/i915/display: Expose sharpness strength property
    
    Expose the drm crtc sharpness strength property which will enable
    or disable the sharpness/casf based on user input. With this user
    can set/update the strength of the sharpness or casf filter.
    
    v2: Update subject[Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 135e2838ed7d44d880e7e19971b1234e6ae04ded drm-intel
b48f02a293bf drm/i915/display: Introduce sharpness strength property
e9ae773dce46 drm/i915/display: Introduce HAS_CASF for sharpness support
0f944298bf33 drm/i915/display: Add strength and winsize register
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 181 lines checked
4394b69a0214 drm/i915/display: Add filter lut values
1e8b76bf6ec4 drm/i915/display: Compute the scaler coefficients
ed608e683bb9 drm/i915/display: Add and compute scaler parameter
bc21cda6fd35 drm/i915/display: Configure the second scaler
c18da9d10819 drm/i915/display: Set and get the casf config
ae14bb7f6522 drm/i915/display: Enable/disable casf
e76a5363382d drm/i915/display: Expose sharpness strength property


