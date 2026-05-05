Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5888DCD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 10:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7F10E122;
	Tue,  5 May 2026 10:58:21 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5C410E122;
 Tue,  5 May 2026 10:58:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Fix_VSC_dy?=
 =?utf-8?q?namic_range_signaling_for_RGB_formats_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 10:58:19 -0000
Message-ID: <177797869975.38341.11076035025173271981@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505090920.2479112-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260505090920.2479112-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/dp: Fix VSC dynamic range signaling for RGB formats (rev3)
URL   : https://patchwork.freedesktop.org/series/164779/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 911b5abf5cb13100a08f5306f0f8ef1fefdbd31f
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue May 5 14:39:20 2026 +0530

    drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
    
    For RGB, set dynamic_range to CTA or VESA based on
    crtc_state->limited_color_range so sinks apply correct
    quantization. YCbCr remains limited (CTA) range.
    (DP v1.4, Table 5-1)
    
    v2:
    - Added Reported-by and Tested-by tags
    
    v3:
    - Add back YCbCr comment(Suraj)
    
    Cc: stable@vger.kernel.org #v5.8+
    Reported-by: DeepChirp <DeepChirp@outlook.com>
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15874
    Tested-by: DeepChirp <DeepChirp@outlook.com>
    Fixes: 9799c4c3b76e ("drm/i915/dp: Add compute routine for DP VSC SDP")
    Assisted-by: GitHub Copilot (GPT-5.4)
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 1cf8a1a77bb94b5c4476a04ea7d08e11756a58b9 drm-intel
911b5abf5cb1 drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
-:22: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#22: 
Assisted-by: GitHub Copilot (GPT-5.4)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


