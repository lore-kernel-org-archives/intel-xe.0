Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F7C02181
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 15:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1110E049;
	Mon, 20 Jan 2025 15:46:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0236310E049;
 Mon, 20 Jan 2025 15:46:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Check_Scaler_and_DSC_Pref?=
 =?utf-8?q?ill_Latency_Against_Vblank_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 15:46:37 -0000
Message-ID: <173738799700.2216755.2005007698704887309@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120125439.4188626-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250120125439.4188626-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Check Scaler and DSC Prefill Latency Against Vblank (rev6)
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
commit aa51bf8c5cfc0e397ea9a0db4bad8dea20006334
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Jan 20 18:24:39 2025 +0530

    drm/i915/dsc: Check if vblank is sufficient for dsc prefill
    
    High refresh rate panels which may have small line times
    and vblank sizes, Check if vblank size is sufficient for
    dsc prefill latency.
    
    --v2:
    - Consider chroma downscaling factor in latency calculation. [Ankit]
    - Replace with appropriate function name.
    
    --v3:
    - Remove FIXME tag.[Ankit]
    - Replace Ycbcr444 to Ycbcr420.[Ankit]
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
    
    --v7:
    - Fix linetime calculation. [Ankit]
    - Reduce redandancy use of variables. [Ankit]
    - Fix typos. [Ankit]
    - Update calculation for precision. [Ankit]
    
    Bspec: 70151
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 4d9c78b35c395ed49796502224f3a421b0ce65ef drm-intel
671231127591 drm/i915/scaler: Add and compute scaling factors
7356deae8d1e drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
b1f7db166044 drm/i915/scaler: Refactor max_scale computation
c9a7ec92f283 drm/i915/scaler: Compute scaling factors for pipe scaler
d0caf9410bd7 drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
10c1c8c4d99a drm/i915/scaler: Check if vblank is sufficient for scaler
aa51bf8c5cfc drm/i915/dsc: Check if vblank is sufficient for dsc prefill


