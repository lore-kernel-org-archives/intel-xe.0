Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611B6F34C5C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 14:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2A910E4A1;
	Mon, 13 Apr 2026 14:32:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7C10E4A1;
 Mon, 13 Apr 2026 14:32:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Fix_VSC_dy?=
 =?utf-8?q?namic_range_signaling_for_RGB_formats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 14:32:44 -0000
Message-ID: <177609076498.457299.15081911157660671633@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413095407.1426322-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260413095407.1426322-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/dp: Fix VSC dynamic range signaling for RGB formats (rev2)
URL   : https://patchwork.freedesktop.org/series/164779/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2a04e693c97412d77ee8b0d68a982467756163f
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Apr 13 15:24:07 2026 +0530

    drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
    
    For RGB, set dynamic_range to CTA or VESA based on
    crtc_state->limited_color_range so sinks apply correct
    quantization. YCbCr remains limited (CTA) range.
    (DP v1.4, Table 5-1)
    
    v2:
    - Added Reported-by and Tested-by tags
    
    Cc: stable@vger.kernel.org #v5.8+
    Reported-by: DeepChirp <DeepChirp@outlook.com>
    Tested-by: DeepChirp <DeepChirp@outlook.com>
    Fixes: 9799c4c3b76e ("drm/i915/dp: Add compute routine for DP VSC SDP")
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15874
    Assisted-by: GitHub Copilot (GPT-5.4)
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 380e49c900a45f7c7c206b48862f946bcbda4c54 drm-intel
b2a04e693c97 drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#15: 
Reported-by: DeepChirp <DeepChirp@outlook.com>
Tested-by: DeepChirp <DeepChirp@outlook.com>

-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: GitHub Copilot (GPT-5.4)

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot (GPT-5.4)'
#19: 
Assisted-by: GitHub Copilot (GPT-5.4)

total: 1 errors, 2 warnings, 0 checks, 14 lines checked


