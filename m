Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25282E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 13:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06B010E3CD;
	Wed,  8 Jan 2025 13:24:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A710E3CD;
 Wed,  8 Jan 2025 13:24:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Check_Scaler_and_DSC_Pref?=
 =?utf-8?q?ill_Latency_Against_Vblank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 13:24:51 -0000
Message-ID: <173634269180.1297915.15479343439782963140@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108123541.2101643-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250108123541.2101643-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Check Scaler and DSC Prefill Latency Against Vblank (rev2)
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
commit 6e8f639042e4f73c59c32c5ec4cd108c67c8cc30
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Wed Jan 8 18:05:41 2025 +0530

    drm/i915/dsc: Check if vblank is sufficient for dsc prefill
    
    Check if vblank is sufficient for dsc prefill latency.
    
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
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3 drm-intel
9cc16cbbba82 drm/i915/scaler: Add and compute scaling factors
331df26fd818 drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
fa33f9871964 drm/i915/scaler: Refactor max_scale computation
1c85fb619485 drm/i915/scaler: Compute scaling factors for pipe scaler
96b9dea6bc4a drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
f98b64bbd2b0 drm/i915/scaler: Check if vblank is sufficient for scaler
6e8f639042e4 drm/i915/dsc: Check if vblank is sufficient for dsc prefill


