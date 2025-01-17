Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD5FC02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 08:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8CD10E2E6;
	Fri, 17 Jan 2025 08:43:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55E610E2E6;
 Fri, 17 Jan 2025 08:43:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Check_Scaler_and_DSC_Pref?=
 =?utf-8?q?ill_Latency_Against_Vblank_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 08:43:13 -0000
Message-ID: <173710339367.649603.10364770982589867640@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Check Scaler and DSC Prefill Latency Against Vblank (rev5)
URL   : https://patchwork.freedesktop.org/series/143159/
State : success

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
commit 7e6839887c21b4c7f1ccef7d87c5c1e75fbcf891
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Fri Jan 17 13:14:21 2025 +0530

    drm/i915/dsc: Check if vblank is sufficient for dsc prefill
    
    High refresh rate panels which may have small line times
    and vblank sizes, Check if vblank size is sufficient for
    dsc prefill latency.
    
    --v2:
    - Consider chroma downscaling factor in latency calculation. [Ankit]
    - Replace with appropriate function name.
    
    --v3:
    - Remove FIXME tag.[Ankit]
    - Replace Ycbcr444 to Ycbcr420.[Anit]
    - Correct precision. [Ankit]
    - Use some local valiables like linetime_factor and latency to
    adjust precision.
    - Declare latency to 0 initially to avoid returning any garbage values.
    - Account for second scaler downscaling factor as well. [Ankit]
    
    --v4:
    - Improvise hscale and vscale calculation. [Ankit]
    - Use appropriate name for number of scaler users. [Ankit]
    - Update commit message and rebase.
    - Add linetime and cdclk prefill adjustment calculation. [Ankit]
    
    --v5:
    - Update bspec link in trailer. [Ankit]
    - Correct hscale, vscale datatype. [Ankit]
    - Use intel_crtc_compute_min_cdclk. [Ankit]
    
    --v6:
    - Use cdclk_state->logical.cdclk instead of
    intel_crtc_compute_min_cdclk. [Ankit]
    
    Bspec: 70151
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch a15d2a84505eed8dbb58911147e44752734f3a88 drm-intel
7dfc54eb5df3 drm/i915/scaler: Add and compute scaling factors
a3832421ed18 drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
aff6a253ef8a drm/i915/scaler: Refactor max_scale computation
e77a859101ca drm/i915/scaler: Compute scaling factors for pipe scaler
ba48569ea783 drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
2a87836bb10a drm/i915/scaler: Check if vblank is sufficient for scaler
7e6839887c21 drm/i915/dsc: Check if vblank is sufficient for dsc prefill


